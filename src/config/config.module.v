module config

import os
import json
import dracks.vest
import dracks.west
import dracks.validator { transform_and_validate }

pub struct Config {
pub:
	database string = './db.sqlite'
	port     int    = 8081
}

pub fn load_config() !Config {
	env := os.environ()
	transform := transform_and_validate[Config](env)
	if transform.has_errors() {
		errors_str := transform.errors.keys().map(fn [transform] (field string) string {
			return '\t${field}: ${transform.errors[field]}\n'
		})

		return error('Invalid configuration\n${errors_str}')
	}
	return transform.value
}

pub fn (self Config) to_object() vest.Object {
	return vest.Object(self)
}

pub fn (self Config) to_json() string {
	return json.encode(self)
}

pub fn new_module() &west.WebModule {
	mut web_module := &west.WebModule{
		global: true
	}
	config := load_config() or { panic(error) }
	web_module.use_instance[Config](config, true)
	return web_module
}

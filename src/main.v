module main

import vweb
import dracks.west
import dracks.westhealth
import home_page
import config { Config }

fn new_app_module() &west.WebModule {
	mut app := &west.WebModule{}

	app.import_web_module(mut config.new_module())
	app.import_web_module(mut home_page.new_module())
	app.import_web_module(mut westhealth.new_module())

	return app
}

fn main() {
	mut app_module := new_app_module()

	// Init everything, this will inject the service, and also call the on_init functions in all the structs
	app_module.init()!

	config_instance := app_module.get[Config](none)!

	// Create the server
	web_app := west.create_server(app_module)

	// Runs on the port 8020
	web_app.run(config_instance.port)
}

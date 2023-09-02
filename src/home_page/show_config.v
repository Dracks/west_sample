module home_page

import vweb
import config { Config }
import dracks.vest

[path: '/config']
struct ConfigController {
	vweb.Context
	vweb.Controller
mut:
	config &Config [inject; vweb_global]
}

fn (self ConfigController) to_object() vest.Object {
	return self
}

['/']
fn (mut self ConfigController) show_config() vweb.Result {
	return self.html('<html><body><h1>See Config</h1><pre>${self.config.to_json()}</pre></body></html>')
}

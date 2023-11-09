module home_page

import vweb
import dracks.vest

// This struct will be our controller
struct HomePage {
	vweb.Context
	vweb.Controller
mut:
	service &HomeService [inject; vweb_global]
}

fn (self HomePage) to_interface() vest.Object {
	return self
}

['/']
fn (mut self HomePage) main() vweb.Result {
	counter := self.service.count()
	return self.html('<html><body><h1>Wellcome to West</h1><div>Hello world user ${counter}</div></body></html>')
}

['/ip']
fn (mut self HomePage) get_ip() vweb.Result {
	ip := self.ip()
	ua := self.user_agent()
	return self.html('<html><body><h1>Your Ip is: ${ip}</h1><div>User agent: ${ua}</div></body></html>')
}

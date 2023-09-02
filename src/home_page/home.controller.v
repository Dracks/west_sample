module home_page

import vweb

// This struct will be our controller
struct HomePage {
	vweb.Context
	vweb.Controller
mut:
	service &HomeService [inject; vweb_global]
}

['/']
fn (mut self HomePage) main() vweb.Result {
	counter := self.service.count()
	return self.html('<html><body><h1>Wellcome to West</h1><div>Hello world user ${counter}</div></body></html>')
}

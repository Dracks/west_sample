module home_page

struct HomeService {
mut:
	counter int
}

fn (mut self HomeService) on_init() ! {
	self.counter = 0
}

fn (mut self HomeService) count() int {
	self.counter = self.counter + 1
	return self.counter
}

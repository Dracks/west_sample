module home_page

import dracks.west

pub fn new_module() &west.WebModule {
	// Create a new module
	mut home_module := &west.WebModule{}
	// register in this module the service, you can use also register_and_export to export this service and make it available to other modules
	home_module.register[HomeService]()

	// Register the controller
	home_module.register_controller[HomePage]()
	home_module.register_controller[ConfigController]()

	return home_module
}

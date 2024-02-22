# tenpearls_university

A new Flutter project.

## Getting Started

# Folder Structure

[Root]
    main.dart
	assets 
		- icons/
	lib
		- components
			reusable components (buttons, textfields etc)
		- constants
			- app_config
				- base_config.dart
				- environment.dart
				- prod_config.dart
				- staging_config.dart
			- app_assets.dart
			- app_styles.dart
			- end_points.dart
			- error_messages.dart
			- preferences.dart
			- strings.dart
		- data
			- models
				- contain response model files
			- network
				- interceptors
					- interceptor.dart
				- api_provider.dart
				- dio_client.dart
				- dio_exception.dart
			- response
				- api_response.dart
				- status.dart
			- repository
				- contain repository files
			- cache_helper.dart
		- routes
			- routes_name.dart
			- routes.dart
		- utils
			- extensions
				- target_platform_extension.dart
			- utils.dart
		- view
			- contain screens/view files
		- viewmodel
			- contain view model files

# Packages used:

Dependency Injection
  > get_it: ^7.2.0
  > intl: ^0.17.0
Network Layer
  > path_provider: ^2.0.11
  > json_annotation: ^4.6.0
  > dio: ^4.0.6
  # Dev dependencies to generate models from json
  > build_runner: ^2.2.0
  > json_serializable: ^6.3.1
Cache Helper:
  shared_preferences:
UI
  > cupertino_icons: ^1.0.2
  > fluttertoast: ^8.0.9
  > another_flushbar: ^1.10.29
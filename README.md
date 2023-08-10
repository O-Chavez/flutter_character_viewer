# Flutter Character Viewing App

## Run Operations

To run the **Simpsons Character Viewer**, follow these steps:

1. Open your terminal.

2. Navigate to the project file

3. Use the following command:


`flutter run --flavor simpsons -t lib/main_simpsons.dart`

This command will launch the app with the configuration for the Simpsons flavor.

To run the **The Wire Character Viewer**, follow these steps:

1. Open your terminal.

2. Navigate to the project file

3. Use the following command:

`flutter run --flavor theWire -t lib/main_the_wire.dart`

This command will launch the app with the configuration for The Wire flavor.

## Details

This project is written using the **Bloc pattern** (Business Logic Component) to create a clear separation of concerns and to make it more easily testable.

The project utilizes the following public libraries:

- **Provider**: For state management, enabling efficient management of app state and updates.

- **flutter_flavors**: Used for creating app variants with different configurations, making it easier to handle multiple environments.


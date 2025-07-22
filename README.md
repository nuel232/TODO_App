# To Do App

A simple cross-platform To-Do List application built with Flutter. This app allows users to add, check off, and delete tasks, with persistent storage using Hive.

## Features

- Add new tasks
- Mark tasks as completed
- Delete tasks with a swipe gesture (Slidable)
- Persistent local storage using Hive
- Responsive UI for Android, iOS, Windows, macOS, Linux

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)

### Installation

1. Clone this repository:

   ```sh
   git clone <your-repo-url>
   cd to_do_app
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app:

   ```sh
   flutter run
   ```

## Project Structure

- `lib/`
  - `main.dart` - App entry point
  - `pages/home_page.dart` - Main UI and logic
  - `util/todo_tile.dart` - Task tile widget with Slidable
  - `util/dialog_box.dart` - Dialog for adding tasks
  - `util/my_button.dart` - Custom button widget
  - `database/database.dart` - Hive database logic
- `pubspec.yaml` - Project dependencies

## Dependencies

- [flutter_slidable](https://pub.dev/packages/flutter_slidable) - Swipe to delete
- [hive](https://pub.dev/packages/hive) & [hive_flutter](https://pub.dev/packages/hive_flutter) - Local storage


## License

This project is licensed under the MIT License.

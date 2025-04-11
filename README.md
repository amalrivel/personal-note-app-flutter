# Personal Note App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

A clean, simple, and responsive personal note-taking application built with Flutter. This app allows users to create, view, and manage their personal notes across different devices with an intuitive user interface.

<!-- ## 📱 Screenshots

*[You can add screenshots of your app here]* -->

## ✨ Features

- **Create Notes**: Add new notes with title and content
- **View Notes**: Browse through all your notes in a clean list view
- **Delete Notes**: Remove notes you no longer need
- **Responsive Design**: Optimized for both mobile phones and tablets
- **Date Tracking**: Automatically records creation dates for all notes

## 🛠️ Technologies Used

- Flutter: Cross-platform UI framework
- Dart: Programming language
- Material Design: UI design pattern

## 🚀 Getting Started

### Prerequisites

- Flutter (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone this repository
```bash
git clone https://github.com/amalrivel/personal-note-app-flutter.git
```

2. Navigate to the project directory
```bash
cd personal-note-app-flutter
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## 🏗️ Project Structure

```
lib/
├── main.dart            # App entry point
├── main_screen.dart     # Main notes list screen
├── add_screen.dart      # Create new note screen
├── detail_screen.dart   # View note details screen
├── models/
│   └── note.dart        # Note data model
└── services/
    └── note_service.dart # Note management service
```

## 🧩 Architecture

This project follows a simple and clean architecture:

- **Models**: Data structures representing notes
- **Services**: Business logic for managing notes
- **Screens**: UI components for user interaction

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 👤 Author

Ikhlasul Amal Rivel - [GitHub Profile](https://github.com/amalrivel)
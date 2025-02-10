# **Product App** 🛍️

A Flutter-based product management application that interacts with both remote and local data sources.

## **🚀 Getting Started**

### **Prerequisites**
Ensure you have the following installed:

- **Flutter SDK** (latest stable) → [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **VS Code** (optional, but recommended)
- **Git** for cloning the repository

### **Project Structure**

📦 product_app
 ┣ 📂 lib
 ┃ ┣ 📂 data
 ┃ ┃ ┣ 📂 sources  # Data sources (API, local storage)
 ┃ ┃ ┣ 📂 models   # Data models
 ┃ ┃ ┗ 📂 repositories # Repository layer
 ┃ ┣ 📂 presentation # UI layer
 ┃ ┗ 📂 core # Utility functions & constants
 ┣ 📂 test  # Unit tests
 ┃ ┣ 📂 data
 ┃ ┃ ┗ 📂 sources
 ┃ ┗ 📜 mocks.mocks.dart # Mocked dependencies (generated)
 ┣ 📜 pubspec.yaml
 ┗ 📜 README.md



### **📥 Clone the Repository**
```sh
git clone https://github.com/amrkamal1993/product_app.git
cd product_app
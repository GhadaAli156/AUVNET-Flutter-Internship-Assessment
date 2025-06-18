# flutter_internship
This is a Flutter-based e-commerce application built as part of the AUVNET Flutter Internship Assessment.

## 📸 Screenshots

| Home Screen | Home Screen | Login Screen |
|------------|-------|------|
| ![Image](https://github.com/user-attachments/assets/bf7e4555-5576-4573-945a-84c6c278f652)| ![Image](https://github.com/user-attachments/assets/55751423-d02a-499e-b425-7296c0a3d1f8) | ![Image](https://github.com/user-attachments/assets/65ccd3ab-5b9e-4d65-903d-95bd63af2c6e)|

| SignUp Screen | OnBoarding Screen1 | OnBoarding Screen2 |
|------------|-------|------|
| ![Image](https://github.com/user-attachments/assets/c24aa0a6-ada7-40e8-868d-fd9bffc8f8a2)| ![Image](https://github.com/user-attachments/assets/395b45d8-fb6d-438d-96a0-55d7d07c9207)| ![Image](https://github.com/user-attachments/assets/61eb72d2-a67b-47ba-9cd4-ac2019c7252b) |

| OnBoarding Screen3 | Splash Screen |
|------------|-------|
|![Image](https://github.com/user-attachments/assets/323580d3-4ce9-4aa5-b892-30573c87d4e8)| ![Image](https://github.com/user-attachments/assets/38241d70-4179-4add-ae8a-47fc6804d1a8)

## ✨ Features

- ✅ Splash & Onboarding Screens
- ✅ Firebase Authentication (Sign Up / Login)
- ✅ Home Page UI (based on provided design)
- ✅ State Management using Bloc
- ✅ Clean Architecture (Data - Domain - Presentation)
- ✅ Hive for local user session storage

### 🗂️ Directory Structure:
<pre> ``` lib/ ├── core/ │ ├── colors/ │ ├── utilities/ ├── features/ │ ├── auth/ │ │ ├── data/ │ │ │ ├── repositories/ │ │ │ ├── local/ │ │ ├── domain/ │ │ │ ├── entities/ │ │ │ ├── usecases/ │ │ ├── presentation/ │ │ │ ├── bloc/ │ │ │ ├── views/ │ │ │ ├── widgets/ │ ├── home/ │ │ ├── data/ │ │ ├── domain/ │ │ ├── presentation/ │ ├── splash&onboarding/ │ │ ├── presentation/ ├── main.dart ``` </pre> 

lib/
├── core/
│ ├── colors/
│ ├── utilities/
├── features/
│ ├── auth/
│ │ ├── data/
│ │ │ ├── repositories/
│ │ │ ├── local/
│ │ ├── domain/
│ │ │ ├── entities/
│ │ │ ├── usecases/
│ │ ├── presentation/
│ │ │ ├── bloc/
│ │ │ ├── views/
│ │ │ ├── widgets/
│ ├── home/
│ │ ├── data/
│ │ ├── domain/
│ │ ├── presentation/
│ ├── splash&onboarding/
│ │ ├── presentation/
├── main.dart

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

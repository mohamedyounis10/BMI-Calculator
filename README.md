# 🧮 BMI Calculator - Flutter App

A modern, cross-platform BMI (Body Mass Index) Calculator built with Flutter. This app allows users to easily calculate their BMI by entering their gender, weight, height, and age, and provides instant feedback on their health category.

## 📲 Features

- **Animated Splash Screen**: Welcomes users with a smooth animation.
- **Gender Selection**: Choose between male and female with custom cards.
- **Weight, Height, and Age Input**: Intuitive controls for entering your data, including a ruler picker for height.
- **Instant BMI Calculation**: Calculates BMI and shows the result in a dialog with color-coded health categories.
- **Healthy Weight Range**: Displays the healthy weight range for the entered height.
- **Responsive Design**: Looks great on all devices using `flutter_screenutil` and `device_preview`.
- **Custom Theming**: Modern, colorful UI with custom fonts and assets.

## 📱 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- A device or emulator (Android, iOS, Web, Desktop)

### Installation

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd bmi
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 🛠️ Project Structure

- `lib/main.dart` - App entry point, sets up theming and navigation.
- `lib/features/` - Contains all app features:
  - `screen_1` - Splash/Welcome screen.
  - `screen_2` - Gender selection screen.
  - `screen_3` - Input screen for weight, height, and age.
  - `screen_result` - BMI calculation logic and result dialog.
- `assets/images/` - App icons and illustrations.
- `fonts/` - Custom fonts.

## BMI Calculation Logic

BMI is calculated as:
```
BMI = weight (kg) / (height (m) * height (m))
```
The app categorizes BMI as:
- Underweight: BMI < 18.5
- Normal: 18.5 ≤ BMI < 25
- Overweight: 25 ≤ BMI < 30
- Obese: BMI ≥ 30

## Customization

- **App Icon**: Located at `assets/images/app_icon.png`
- **Fonts**: Roboto Medium and SemiBold in `fonts/`
- **Colors**: Defined in `lib/core/app_color.dart`

---

## 📷 App Screenshot

<img width="1050" height="800" alt="BMI" src="https://github.com/user-attachments/assets/2d7e4352-684c-461e-861a-7065775a9e8f" />
<img width="1920" height="1080" alt="Clean and Modern App Portfolio Mockup Presentation" src="https://github.com/user-attachments/assets/f5a39d7c-d0f4-41a8-8337-f21a954c892a" />

---

## 🎥 Demo Video

Watch the BMI Calculator app in action, recorded directly from the Android emulator:

[Click here to watch the demo video](https://github.com/user-attachments/assets/4d22b4e4-5f2e-464c-b0a9-846843f0d67f)

---

## License

This project is for educational purposes.

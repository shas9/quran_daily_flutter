# Quran Daily

## Overview
**Quran Daily** is a modern Flutter application designed to facilitate daily Quran reading. It offers features such as bookmark saving, Bangla translations, pronunciations, and an intuitive user interface. Built using Flutter 3.24.0 and Dart SDK 3.5.0, it employs **BLoC**, the **repository pattern**, and **clean architecture** for scalability and maintainability.

---

## Features
- **Search by Surah** – Quickly locate Surahs using the built-in search functionality.
- **Save a Bookmark** – Bookmark the last read Ayah to resume reading seamlessly.
- **Clean UI** – Minimalist and distraction-free user interface design.
- **Easy Navigation** – Effortlessly navigate to each Ayah for an enhanced reading experience.
- **Bangla Translations** – Support for Bangla translations and pronunciations.

---

## API Usage
The app fetches Quran data using the **Al-Quran Cloud API**. 
For more details, visit: [alquran.cloud](https://alquran.cloud)

---

## Technical Details
### **Framework and Tools:**
- **Flutter Version:** 3.24.0
- **Dart SDK:** 3.5.0
- **State Management:** flutter_bloc (v8.1.4)
- **Networking:** dio (v5.4.0)
- **Local Storage:** shared_preferences (v2.0.15)
- **Error Logging:** logger (v2.4.0)
- **Functional Programming:** dartz (v0.10.1) (Planning to remove)

### **Project Structure:**
The project adheres to **Clean Architecture** principles, separating the app into layers:
1. **Presentation Layer:** Handles UI and user interactions (Widgets, BLoC).
2. **Domain Layer:** Business logic and use cases.
3. **Data Layer:** Repositories, API calls, and data sources.

---

## Installation
### **Prerequisites:**
- Flutter SDK 3.24.0 or later.
- Dart SDK 3.5.0 or later.
- Android Studio or Visual Studio Code.
- Android and iOS emulators or physical devices.

### **Steps:**
1. Clone the repository:
   ```bash
   git clone https://github.com/shas9/quran_daily_flutter.git
   ```
2. Navigate to the project directory:
   ```bash
   cd quran_daily
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## Troubleshooting
### Android Toolchain Issues
- **cmdline-tools component is missing:**
  ```bash
  path/to/sdkmanager --install "cmdline-tools;latest"
  ```
- **Accept Android SDK licenses:**
  ```bash
  flutter doctor --android-licenses
  ```

### Device Connection Issues (iPhones)
- Ensure the device is unlocked and connected via cable or same Wi-Fi network.
- Opt into **Developer Mode** on the device.

---

## Author
**Shahwat Hasnaine**  
**Herdsmen, Venture 144**  
**Email:** shahwathasnaine@gmail.com  

---

## Contribution
Contributions are welcome! Please fork this repository and submit a pull request.

---


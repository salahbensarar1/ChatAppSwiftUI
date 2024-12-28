📱 ChatAppSwiftUI

**ChatAppSwiftUI** is an iOS chat application built using **SwiftUI** and **Firebase**. It allows users to register, log in, and engage in real-time messaging with a clean and intuitive interface.

---

## ✨ Features

- **🔐 User Authentication**: Sign up and log in using email and password.
- **💬 Real-Time Messaging**: Send and receive messages instantly.
- **👤 User Profiles**: Display user information, including profile pictures.

---

## 🛠️ Requirements

- **iOS**: 14.0+
- **Xcode**: 12.0+
- **Swift**: 5.3+
- **Firebase Account**
- **Cloudinary Account**: For storing and managing profile pictures.

---

## 🚀 Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/salahbensarar1/ChatAppSwiftUI.git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd ChatAppSwiftUI
   ```

3. **Open the project in Xcode**:
   ```bash
   open ChatApp.xcodeproj
   ```

4. **Install dependencies**:
   Ensure you have [CocoaPods](https://cocoapods.org/) installed. Then, run:
   ```bash
   pod install
   ```

5. **Configure Firebase**:
   - Sign in to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new project.
   - Add an iOS app to your project with the appropriate bundle identifier.
   - Download the `GoogleService-Info.plist` file.
   - Add the `GoogleService-Info.plist` file to your Xcode project.
   - Enable **Email/Password Authentication** in the Firebase Console under **Authentication > Sign-in Method**.
   - Set up **Firestore** or **Realtime Database** as per your application's requirements.

6. **Set up Cloudinary**:
   - Create an account on [Cloudinary](https://cloudinary.com/).
   - Obtain your **Cloudinary API Key** and **Cloud Name**.
   - Use Cloudinary to upload and manage user profile pictures.
   - Update your app's logic to upload profile pictures using the Cloudinary API.

7. **Build and run the project**:
   - Select the target device or simulator.
   - Press `Cmd + R` to build and run the application.

---

## 📖 Usage

- **🔑 Sign Up**: Create a new account using your email and password.
- **🔓 Log In**: Access your account with your credentials.
- **💌 Chat**: Start a new conversation or continue an existing one.

---

## 🗂️ Explanation of Technologies Used

### Firebase Realtime Database
We used **Firebase Realtime Database** to store and manage user data, such as:
- User emails
- Unique user identifiers (UIDs)
- Profile picture URLs (stored on Cloudinary)

Realtime Database ensures quick and synchronized updates, providing real-time functionality for messaging and user data.

### Cloudinary
We integrated **Cloudinary** for handling and storing user profile pictures. Cloudinary allows:
- Uploading images directly via its API.
- Storing image URLs, which are referenced in Firebase Realtime Database.
- Efficient delivery of optimized images for better performance.

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. **Fork the repository**.
2. **Create a new branch**:
   ```bash
   git checkout -b feature/YourFeatureName
   ```

3. **Commit your changes**:
   ```bash
   git commit -m "Add some feature"
   ```

4. **Push to the branch**:
   ```bash
   git push origin feature/YourFeatureName
   ```

5. **Open a Pull Request**.

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

---

## 🙏 Acknowledgements

- **[Firebase](https://firebase.google.com/)**: For providing backend services.
- **[Cloudinary](https://cloudinary.com/)**: For image management and storage.
- **[SwiftUI](https://developer.apple.com/xcode/swiftui/)**: For building the user interface.


## 📞 Contact

For questions or feedback, reach out to

[![Salah Ben Sarar](https://cdn.jsdelivr.net/gh/alohe/avatars/png/memo_23.png)](https://github.com/salahbensarar1)


---

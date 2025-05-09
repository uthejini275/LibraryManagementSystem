 HEAD
# LIBRARY MANAGEMENT SYSTEM

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# LibraryManagementSystem
Library Management System (LMS) for mobile platforms using Flutter for the frontend and Node.js with MySQL for the backend. The app allows users to log in, issue books, and return books by scanning barcodes. It maintains book availability and transaction history, ensuring smooth library operations. 
152be6a36a29c7a0580e0f441e7ba023ac9db404

Absolutely! Here's a **clear explanation of your entire Library Management System (LMS) project** that you can directly include in the `README.md` of your GitHub repository. It summarizes what your app does, how it's structured, and what was implemented — in a clean and well-organized format.

---

🔗 [Watch App Demo](https://drive.google.com/file/d/1oN6FNOxI7D4X4hC5RvnmfIJEQNestdDn/view?usp=sharing)  
🎥 [Watch Project Presentation](https://drive.google.com/file/d/1vAGVvSXPVfP9venCccOep_CR68aOOP7y/view?usp=sharing)



## 📚 Library Management System (LMS)

The **Library Management System** is a mobile-based application built using **Flutter**, designed to digitize and simplify traditional library tasks such as **book issuing**, **returning**, **searching**, and **tracking**. This app supports **two types of users** – **Students** and **Librarians** – and provides role-specific functionalities for each.

The application uses a **Node.js backend**, a **MySQL database** for persistent data storage, and integrates features like **barcode scanning**, **secure login**, and **role-based navigation**. The app runs **locally** and is intended for demonstration and educational purposes.

---
📚 Library Management System – A Smart Book Tracking App for Students & Admins  
🔗 [Watch App Demo](https://drive.google.com/file/d/1oN6FNOxI7D4X4hC5RvnmfIJEQNestdDn/view?usp=sharing)  
🎥 [Watch Project Presentation](https://drive.google.com/file/d/1vAGVvSXPVfP9venCccOep_CR68aOOP7y/view?usp=sharing)

Library Management System is a mobile-first application designed to simplify book issuing, returning, and management using barcode scanning. Built for educational institutions, it ensures real-time updates, secure authentication, and intuitive user experience for both admins and students.

---

🧠 **Project Objective**  
To develop a robust, barcode-enabled mobile application that allows:

✅ Admins to manage book inventory and track transactions  
✅ Students to issue and return books with ease  
✅ Authentication and role-based access  
✅ Barcode-based identification of books  
✅ Timestamped logs for all activities

---



### 👥 User Roles

* **Student**

  * 🔍 Search Books
  * 📚 View Issued Books
  * 🔄 Return Books
  * ✍️ Add Reviews
  * 🚪 Logout

* **Librarian**

  * 🔐 Issue Books (via Barcode)
  * 🔄 Return Books
  * 🔍 Search Books
  * 📚 View All Issued Books
  * ➕ Add New Books
  * ✍️ Add Reviews
  * 🚪 Logout

---

### 🛠 Technologies Used

| Layer        | Technology                           |
| ------------ | ------------------------------------ |
| **Frontend** | Flutter (Dart)                       |
| **Backend**  | Node.js + Express                    |
| **Database** | MySQL                                |
| **Auth**     | Firebase Authentication (for login)  |
| **Other**    | QR/Barcode Scanner Plugin in Flutter |

---

### 💡 Features Implemented

* ✅ Role-based login (Firebase Auth): student and librarian dashboards
* ✅ Book issue and return via barcode scanning
* ✅ Real-time book availability updates (status = 'available' / 'issued')
* ✅ MySQL tables for books, users, and transactions
* ✅ Review submission feature
* ✅ Simple, responsive Flutter UI with clear navigation

---

### 🧩 Database Design

* **Users Table**: Stores user data (name, email, role, password)
* **Books Table**: Stores book info (title, author, status)
* **Transactions Table**: Tracks issue and return data with timestamps

---

### 🚀 How to Run Locally

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/library-management-app.git
   cd library-management-app
   ```

2. **Backend Setup**

   * Navigate to the backend folder
   * Install dependencies: `npm install`
   * Configure MySQL credentials in `.env`
   * Start server: `node server.js`

3. **Flutter App**

   * Open Flutter project in Android Studio or VS Code
   * Run: `flutter pub get`
   * Launch on emulator/device

---

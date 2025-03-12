# MacQueries (MacQ)

## Developer

Himchan Bae

## Compatible Devices

- **Android simulator** (iPhone 13 Pro)
- **Chrome browser**

**Recommendation:** Use in 'Light mode' for best experience.

## Running the Application

```sh
flutter run lib/main.dart
```

---

## 1. About MacQ

MacQ is a **question and answer application** designed for **students, staff, and visitors** of **Macquarie University**. The app allows users to **register, edit, delete, and view enquiries**, helping resolve questions about Macquarie University efficiently.

---

## 2. Design Differences

### a. Modifications

- **Simplified the "MacQueries Highlights" panel** to introduce **current events** and added a **Macquarie University map view**.
- **Removed** the red line above the selected index on the **bottom navigation bar**.
- **Did not implement** the search, notification, and hamburger menu buttons on the app bar.
- **Settings screen** is text-only, with only the **Logout feature** implemented.

---

## 3. Key Features

### a. Login Validation

- Users select a **login method** based on their user type.
- **Real-time validation** for login credentials:
  - **One ID:** Must be an **8-digit number**.
  - **Password:** Must be **8-16 characters** including **lowercase letters, uppercase letters, numbers, and special characters**.
- Incorrect entries trigger **error messages** for easy re-entry.

### b. Load & Save Enquiry Data

- Users can **register new enquiries** with **validation checks**.
- **Firebase Realtime Database** manages **enquiries** using a simple structure:
  - **Category, Title, Detail, Date**
- Enquiries are **updated in real-time** on **Home Screen** and **My Enquiry Screen**.

### c. Edit & Delete Enquiry Data

- **Modification and deletion** are allowed **only from the Detail Screen**.
- **Currently, the Detail Screen is only available for the first enquiry (index 0) in Open/Closed categories**.
- **Deleting an enquiry does not remove it** but **alters the title** to `'Deleted Enquiry'` and updates the date.
- The enquiry data is initially stored in `enquiry_data.dart` locally.
- Future updates will allow for **full edit and deletion** once a detailed data structure is implemented.

### d. Logout Feature

- Pressing **Logout** resets all input data and restarts the app.

### e. User Interface

- **Screen navigation** via **app bar back button** and **bottom navigation bar**.
- **Pages are scrollable** when content exceeds screen length.

---

## 4. Additional Information

### a. Theme & Color Scheme

- The app was initially designed with a theme, but **Dark mode implementation was unsatisfactory**.

### b. UI Layout Issues

- Could not **maintain equal heights** for input forms and buttons.
- Labels and hint text seem to cause **unexpected height expansion**.

### c. Testing Challenges

- **Firebase initialization failed** in the testing environment, limiting testing to the **Loading Screen**.
- **Integration testing was attempted** but left incomplete due to Firebase issues.
- Without Firebase, **test codes for all screens could have been implemented**.

### d. Web Responsiveness

- The app is **not responsive**, so the **user experience might degrade in a web environment**.

---

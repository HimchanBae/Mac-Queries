# MacQueries (MacQ)

Developer: Himchan Bae

Compatible Devices:
a. Android simulator (iPhone 13 Pro)
b. Chrome browser

Recommendation:
Use in 'Light mode' is recommended.

Run the application using the following command:
flutter run lib/main.dart

# 1. About MacQ

MacQ is a question and answer application for students, staff, and visitors of Macquarie University. The app allows users to register, edit, delete, and view enquiries, helping to resolve curiosities about Macquarie University.

# 2. Design Differences

a. Simplified the MacQueries Highlights panel on the main screen to introduce current events at Macquarie and added the ability to view a map of Macquarie.

b. Removed the red line that was displayed above the selected index on the bottom navigation bar.

c. Did not implement the search, notification, and hamburger menu buttons on the app bar.

d. The Settings screen is presented in text format only, with only the Logout feature implemented.

# 3. Key Features

a. About Login Validation

From the Start Screen, users can select the login method according to their user type, and real-time validation checks are performed on each login screen. For example, a One ID must be an 8-digit number, and passwords must include a combination of 8-16 lowercase letters, uppercase letters, numbers, and special characters. Incorrect entries are displayed with error messages, making it easy for users to re-enter.

b. About Load & Save Enquiry Data

Users can register new enquiries from the New Enquiry screen, where validation checks are performed for each field. Enquiry data is managed using Firebase's Realtime Database with a simple structure (Enquiry Category, Title, Detail, Date). Users can view added enquiries in real-time on the Home Screen and My Enquiry Screen.

c. About Edit & Delete Enquiry Data

Enquiry data can only be modified and deleted from the Detail Screen. Currently, due to the simplistic data structure we are using, creating and navigating to a new Detail Screen for each enquiry has not been implemented. The capabilities to edit and actually delete data will be possible once a more detailed data structure is developed.

At present, the initial enquiry models are stored in the 'enquiry_data.dart' file locally. Navigation to the detail pages is limited to the initial enquiry at index 0 under both Open and Closed enquiries. When a user wishes to delete an enquiry, the actual data is not removed; instead, the fields of the enquiry are altered (for example, the title is changed to 'Deleted Enquiry' and the Date is updated to the time of deletion) to visibly indicate to the user that their enquiry has been deleted. This implementation is only superficial.

d. Logout Feature

Pressing the Logout button resets all input data and restarts the app from the beginning.

e. User Interface

Screen transitions are possible through the back button on the app bar and the bottom navigation buttons, and all pages are scrollable if the content exceeds the screen length.

# 4. Additional Information

a. The app's theme and color scheme were defined initially, but the results of applying the Dark mode were not satisfactory.

b. Was unable to make same heights for input forms and buttons. Even when specifying the height of the input form or the container itself, the overall height seems to extend longer, possibly due to the labels or hint text.

c. Tried multiple attempts, but the issue of Firebase initialization not occurring in the testing environment could not be resolved. Therefore, tests were written only up to the Loading Screen. Integration testing was also attempted but left only in code due to unresolved Firebase initialization issues. If Firebase had not been used, it would have been possible to write test codes for all screens.

d. The app was not made responsive, so the user experience might degrade in a web environment.

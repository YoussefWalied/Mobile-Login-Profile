Project Name: FCI Student App

Description:

This mobile application serves as a convenient platform for students enrolled at the Faculty of Computers and Information (FCI) at Cairo University. It offers various features to enhance their academic experience:

User Management:

Login: Users can securely access the app by entering their registered email address (FCI email format) and password. The login screen validates the credentials against the local database and provides feedback on success or failure.
Signup: New users can create an account by providing the following mandatory details:
Name
Email (FCI email structure validation enforced: studentID@stud.fci-cu.edu.eg)
Student ID
Password (minimum of 8 characters)
Confirm Password (must match the entered password)
Data Security: User credentials (passwords) are stored securely using a hashing algorithm (e.g., bcrypt) to protect against unauthorized access.
Profile Management:

Create and Edit Profile: Users can create and update their profiles, including:
Name
Gender (optional) (Radio button selection)
Level (optional) (Dropdown menu with options 1, 2, 3, and 4)
Profile Photo (optional) (Users can add a photo from their device's gallery or capture a new one using the camera)
Local Database Storage: User profiles and associated data are stored locally on the device using a SQLite database (or a similar option depending on the chosen framework).
Technology Stack:

The FCI Student App can be developed using various mobile development frameworks, such as:

React Native (Cross-Platform): For a single codebase that can be deployed to both Android and iOS platforms.

Native Development (Android/iOS): For potentially better performance and platform-specific features, you can choose native development using Kotlin or Java (Android) or Swift/Objective-C (iOS).

SQLite Database: A lightweight and efficient database engine suitable for storing user data locally on the device.

HTTP Plugin: If required for specific functionalities that might interact with external servers (e.g., announcements or updates), a suitable HTTP plugin for the chosen framework should be selected.

Note: External server interaction is not explicitly mentioned in the requirements. If you intend to include such features, consider using secure protocols (HTTPS) and appropriate security measures for data exchange.

Additional Considerations:

Input Validation: Implement robust validation on user input during signup and profile editing to ensure data integrity and prevent errors.
Error Handling: Provide informative error messages to users in case of invalid inputs, login failures, or any potential issues.
User Interface: Design a user-friendly and intuitive interface for easy navigation and interaction.
Target Users:

This application is specifically designed for students enrolled at the FCI, Cairo University.

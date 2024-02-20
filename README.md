### Food Ordering App

This iOS application allows users to browse and order dishes from a menu. Built using Swift and SwiftUI, the app follows the MVVM (Model-View-ViewModel) architecture pattern with the addition of a coordinator to handle navigation.

[App Demo Video](https://drive.google.com/file/d/1TzpfLgOpdldTcgn6qaYeUIJqb8VMfXjt/view?usp=sharing)

#### Features:

- **Adding Dishes to Cart:** Users can browse through the menu and add dishes to their shopping cart.

- **Ordering:** Once items are added to the cart, users can proceed to order them.

- **Sorting by Tags:** Dishes can be sorted based on tags, allowing for easy navigation through the menu.

- **Managing Cart:** Users can adjust the quantity of items in their cart and remove dishes as needed.

- **Asynchronous Image Loading:** The app implements asynchronous image loading for a smooth user experience.

#### Architecture:

The app follows the MVVM+С (Model-View-ViewModel+Coordinator) architecture pattern, enhanced with a coordinator for navigation management.

- **Model:** Represents the data and business logic of the application, including entities like dishes, tags, and the shopping cart.

- **View:** Displays the user interface and interacts with the user. SwiftUI views are used to render the UI components.

- **ViewModel:** Acts as an intermediary between the Model and the View. It prepares the data to be displayed and handles user interactions. SwiftUI's `@ObservableObject` and `@Published` properties are utilized for data binding.

- **Coordinator:** Manages the navigation flow of the application, coordinating transitions between different views and screens. This helps keep the View layer clean and decoupled from navigation logic.

#### Implementation Details:

- **Async Image Loading:** Images are loaded asynchronously to ensure a responsive user interface. This improves the app's performance, especially when dealing with large image files.

- **SwiftUI Components:** The user interface is built using SwiftUI components, allowing for a modern and dynamic UI design.

#### Getting Started:

To run the app on your iOS device or simulator:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on your desired device or simulator.

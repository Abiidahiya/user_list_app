 Flutter User List App

A Flutter application that fetches and displays a list of users from an API using Bloc state management.  
The app follows a clean architecture with separate layers for API calls, repository handling, business logic, and UI presentation.


## Features
- Fetch user data from a REST API
- Bloc state management for predictable state handling
- Error handling for API failures
- Modular folder structure for scalability
- UI components like UserCard & UserTile for reusable widgets
- Pull-to-refresh functionality


##  How It Works

### Workflow
1. User opens the app → A `FetchUsers` event is dispatched to the `UserBloc`.
2. Bloc Layer
    - `UserBloc` calls the UserRepository.
    - UserRepository calls the UserService.
    - UserService calls the ApiClient to fetch data from the API.
3. State Update
    - On success → Bloc emits `UserLoaded` with user data.
    - On failure → Bloc emits `UserError` with an error message.
4. UI Layer
    - Listens to the `UserBloc` states.
    - Displays:
        - Loading indicator when fetching
        - List of users when loaded
        - Error message in a pop-up when API fails



### Folder Structure

lib/
├── core/                      # App-wide utilities & constants
│    ├── constants/            # API URLs, dimension constants
│    ├── network/              # ApiClient for HTTP requests
│    └── widgets/              # Reusable widgets like LoadingIndicator
│
├── features/users/            # User feature module
│    ├── data/                 # Models, services (API), repositories
│    ├── logic/                # Bloc: events, states, bloc implementation
│    └── presentation/         # UI: pages and widgets for users
│
├── app/                      # App-level setup, routes, theme
└── main.dart                 # Entry point and dependency injection

### How to Run
1. Clone the repository: git clone <your_repo_url>
   cd <your_repo_folder>
2. Get dependencies: flutter pub get
3. Run the app on emulator or device: flutter run

### Screenshots

![User Page](https://github.com/Abiidahiya/user_list_app/blob/830be6c0078f61f19b5b7460a469abe746ede75f/user%20details.png)
  
## Additional Notes
1. The app uses flutter_bloc package for state management.

2. The network requests are handled through a reusable ApiClient.

3. Dimensions and styling constants are centralized in core/constants/dimen.dart.

4. The app can be easily extended for more features due to the modular design.

If you have any questions or want to see the code walkthrough, feel free to reach out!

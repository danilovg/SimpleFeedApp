# SimpleFeedApp

iOS pet project built with UIKit and MVVM architecture.  
The app fetches a list of posts from a public API and displays them in a table view.

This project is created as a learning exercise and as a demonstration of basic iOS development skills.

## Features

- Fetch posts from network (JSONPlaceholder API)
- Display data using `UITableView`
- Clean MVVM architecture
- Asynchronous networking

## Architecture

The project follows MVVM pattern:

- View — UIViewController, handles UI and user interaction
- ViewModel — contains presentation logic and prepares data for the view
- Model — data structures
- Network — networking layer

Flow:
View → ViewModel → Network → API

## Getting Started

1. Clone the repository
2. Open SimpleFeedApp.xcodeproj
3. Run on iPhone Simulator

No additional setup required.

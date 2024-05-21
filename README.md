# periferiaTheMoviesDBSwift

## Overview
periferiaTheMoviesDBSwift is a Swift project that uses the MVVM architecture to fetch and display top-rated movies from The Movie Database (TMDB) API.

## Architecture
The project is built using the Model-View-ViewModel (MVVM) architecture, which separates the concerns of the application into three main components:

- **Model:** Responsible for handling the data and business logic of the application.
- **View:** Responsible for rendering the user interface and handling user input.
- **ViewModel:** Acts as an intermediary between the Model and View, providing data to the View and handling user input.

## Components
The project consists of the following components:

- **API:** Handles token and authorization for API endpoints.
- **TopRated:** Displays a list of top-rated movies.
- **Popular:** Displays a list of popular movies.
- **DetailView:** Displays the details of a single movie.

## Images
![Image from Dropbox](https://www.dropbox.com/scl/fi/14sfhsr4yew5aurmvc17j/Captura-de-pantalla-2024-05-20-a-la-s-10.41.56-p.-m..png?rlkey=jie1kvyp5ue1966w73q8qcvl0&st=adpjvazx&dl=0)

## Video
[Video from Dropbox](https://www.dropbox.com/scl/fi/hpbv58uqzz22awg88i6pt/Simulator-Screen-Recording-iPhone-15-Pro-2024-05-20-at-21.34.18.mp4?rlkey=uyb24o149ypwj9981tk240qhr&st=7rd5xub0&dl=0)

## Testing
The project includes unit tests for the following components:

- **TopRatedViewController:** Tests the setup of the top-rated view controller.
- **FetchTopRatedMovies:** Tests the fetching of top-rated movies.
- **SearchBarDelegate:** Tests the search bar delegate.
- **CollectionViewDataSource:** Tests the collection view data source.

## Getting Started
To get started with the project, follow these steps:

1. Clone the repository.
2. Open the project in Xcode.
3. Run the project to see the top-rated movies.

## License
This project is licensed under the MIT License.

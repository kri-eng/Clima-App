
# Clima

## Introduction

Clima is a versatile iOS weather application designed to provide users with accurate weather forecasts and information. With its intuitive interface and robust functionality, Clima offers users an enhanced experience of staying informed about current and future weather conditions.

## Screenshot

<img src="https://github.com/kri-eng/Clima-App/assets/124129235/bea0bb60-a823-420f-a118-e41127482c90" alt="Xylophone-Screenshot" width=300>

<img src="https://github.com/kri-eng/Clima-App/assets/124129235/c9e6ddd6-172a-4996-86d9-36da8fe9fbeb" alt="Xylophone-Screenshot" width=300>

## User Interface

The user interface of Clima includes:

- **Custom Navigation Bar:** Featuring essential elements such as a current coordinate button, a search bar, and a search button.
- **Weather Display:** Including system images representing the current weather, temperature indication, and city label.

## Functionality

Clima offers the following functionalities:

- **Location-Based Weather:** Users receive the current weather for their location upon launching the application.
- **City Search:** Users can search for weather in other cities using the search bar, initiating data fetching from the OpenWeather API.
- **Data Fetching and Parsing:** The application utilizes URLSession and data tasks to fetch weather data, JSON parsing it to retrieve temperature and city information.
- **Dynamic Image Allocation:** Clima allocates weather-specific images based on weather ID fetched from the API.
- **CoreLocation Integration:** Clima utilizes CoreLocation to access the user's current location and fetch weather data accordingly.

## Learnings

- Dark mode implementation
- Vector images usage
- UITextField for user input
- Delegate pattern
- Swift protocols and extensions
- Swift guard keyword
- Swift computed properties
- URLSession for networking
- JSON parsing with Encodable and Decodable protocols
- Grand Central Dispatch for main thread handling
- Core Location integration for GPS-based location retrieval

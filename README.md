# Dog Breed Generator App

This mobile app allows users to explore various dog breeds, view images, and generate random dog pictures. The app features a splash screen, caching for images, and a user-friendly interface.

## Features

- **Splash Screen:** The app opens with a splash screen that stays visible until all dog breeds and their corresponding image links are fetched from the API.

- **Parallel Image Fetching:** After retrieving dog breeds, the app fetches images in parallel to enhance performance.

- **Image Caching:** Images are cached to prevent redundant downloads and improve overall app responsiveness.

- **AppBar and BottomBar:** The main screen features a simple app bar at the top and a bottom bar. Users can navigate to the home screen and settings screen using the bottom bar.

- **Dog Breed List:** On the home screen, dog breeds are listed with their images and names. The user can filter breeds using the input field located above the bottom bar.


## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/onurbasdas/DogList.git
    ```

2. Open the project in your preferred IDE.

3. Build and run the app on your emulator or physical device.

## Acknowledgements

- Dog breed data and images are fetched from the [Dog API](https://dog.ceo/dog-api/).

## License

This project is licensed under the [MIT License](LICENSE).

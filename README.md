
# Nimbus Now ☁️

Nimbus Now is a simple weather forecast app that provides real-time weather updates and a 5-day forecast. It displays:
- 🌡 Temperature (current)
- 🌥 Sky Condition (clear, cloudy, rainy, stormy)
- 💧 Humidity
- 🌬 Wind Speed
- 🔽 Pressure
- 📅 3-Hour Interval Forecast for the next 5 days


## Demo

Gifs go here!
## ✨ Features

- **Real-time weather updates** – Displays temperature, sky condition, humidity, wind speed, and pressure using the **OpenWeather Free Forecast 2.5 Plan**.  
- **5-day forecast in 3-hour intervals** – Provides a total of **40 forecasts per city**, with **8 updates per day** (e.g., 00:00, 03:00, 06:00, etc.).  
- **City search with autocomplete** – Displays up to **5 search results** using the **OpenWeather Free Geocoding API 1.0 Plan**.  
- **Attractive UI animations with Lottie** – Shows different animations for various weather conditions like **clear, cloudy, rain, snow and so on**.  
- **Optimized API requests** – Ensures efficient API usage by reducing unnecessary calls. For example, city search calls the **Geocoding API** only after a **500ms delay**, preventing excessive requests for each keystroke. 
## 🛠 Technologies Used  

Nimbus Now is built using the following technologies and packages:  

#### **📌 Framework & Language**  
- **Flutter** – For building the cross-platform UI  
- **Dart** – The programming language used  

#### **📌 State Management**  
- **setState()** – For managing UI updates  

#### **📌 API & Networking**  
- **OpenWeather API** – Fetches real-time weather data  
- **http** – Handles API requests  

#### **📌 UI & Animations**  
- **Lottie** – Displays weather-based animations  
- **intl** – Formats date and time  

#### **📌 Other Utilities**  
- **typeahead** – Provides city search suggestions  
- **dotenv** – Manages API keys securely  




## 🛠 Installation  

Fairly easy. I've made this biginner friendly so if you use this as your school/college project, you can do so. 

Follow these steps to set up and run Nimbus Now locally:  

#### ⚙️ Prerequisites:
Before proceeding, ensure your system meets the following requirements:
- Make sure you have flutter installed in your system or else, download from the [official website](https://docs.flutter.dev/get-started/install). Follow the steps mentioned to install.
- Install Visual Studio Code and Android Studio. *(This step should be completed when you install flutter)* Android Studio would be needed for running an emulator. Avoid the emulator provided with vscode.
- Download and install Git from [git-scm.com](https://git-scm.com/). Verify installation using 
    ```sh
     git --version
     ```

#### (Optional)
It's best to use an external phone (android) rather an emulator. To use an android phone you need to enable developer mode and USB debugging. Follow these steps below to proceed:
- On your phone, go to your 'About Phone' section (or similar)
- Look for Build number and tap 7 times on it. You will see a pop-up message stating 'You are now a developer'. This will enable 'Developer Options' on your phone.
- Navigate to settings and look for *'Developer Options'* or *'System > Developer Options'* or *'Additional settings > Developer Options'*.
- Scroll down to the option and turn on **USB debugging**. 

Additionally, if you want to connect to your phone wirelessly then follow these steps:
- Navigate to Developer Options
- Turn on both **Wireless ADB debugging** and **Wireless Debugging**.
- Now, (important) ensure your phone and desktop/laptop are on the same network (wired or wireless).
- Note down your phone IP, port and pairing code by going to Wireless Debugging option in developer options.
- Open command prompt and start pairing your phone with your system. 
    ```sh
     adb pair adb pair <IP>:<Port> <Pairing Code>
     // (example) adb pair 192.168.1.100:4321 123456
     ```
- After pairing, run:
   ```sh
     adb connect <IP>:<Port>
     adb connect 192.168.1.100:5555
     ```
- Verify connection:
  ```sh
     adb devices
     ```
- If connected, it should show your device as:
  ```sh
    List of devices attached
    192.168.1.100:5555       device
     ```

### 📥 Setup & Run Nimbus Now

Now that you have installed git, Flutter, VScode and have an emulator or physical phone ready, open an empty folder on your system and clone this repository.

1️⃣ Clone the Repository
```sh
git clone https://github.com/isGandalf/nimbus_now.git
cd nimbus-now
```
2️⃣ Install Dependencies
```
flutter pub get
```
3️⃣ Set Up Environment Variables

Create a .env file in the root directory and add your OpenWeather API key. I've included an example env file where you can paste your API key. Now, to get your API key, you can follow these steps:
- Goto [OpenWeatherMap](https://openweathermap.org/api) website and create an account.
- Once you create an account you will get your API key under 'My API keys' option. Also, you will get an email with the API key. Note, that you might have to wait for your key to be activated (at most 3 hours). This is a free key that allows 60 API calls per minute. If you need more, explore premium plans for One Call API 3.0.
- Now, copy your key > got to .env file and paste.
  ```
   API_KEY=your-key
   ```

4️⃣ Run the App

You can click the play button on your vscode (top-right) and choose 'Run without debugging' or run command in your project directory:
```sh
flutter run
```
## 📌 Usage  ☁️🌞🌧️

#### 🌍 Search for a City  
- Tap on the search bar and start typing a city name.  
- A **dropdown with up to 5 matching results** will appear.  
- Select a city to view its weather details.  

#### 🌦️ Weather Details  
- Displays **temperature, sky condition, humidity, wind speed, and pressure**.  
- **Lottie animations** change based on weather conditions (e.g., sunny, rainy, cloudy).  

#### 📅 5-Day Forecast  
- Shows weather data in **3-hour intervals** for the next 5 days.  
- Scroll down to view the forecast.  


## 🚀 Future Improvements  

Here are some planned features for upcoming updates:  

- 🟢 **Tappable Cards** – Show more details about the current weather when tapped.  
- 🟢 **Air Quality Index (AQI)** – Display real-time air quality data.  
- 🟢 **Gemini AI Integration** – Allow users to ask questions like:  
  - *"Will there be rain today?"*  
  - *"What's today's weather like?"*  

## 🤝 Contributing  

Contributions are welcome! If you'd like to improve Nimbus Now, please go ahead. Since, I am just a biginner in this space, feel free to send me your suggestions and code Improvements.
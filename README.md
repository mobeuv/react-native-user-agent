<p align="center">
  <img src="./assets/banner.png" alt="i18n">
</p>
<p align="center">
  <a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/:License-MIT-blue.svg" alt="MIT License"></a>
</p>


This library provides a simple and effective solution for generating standardized User-Agent strings in React Native applications. It automatically assembles a User-Agent string with predefined components such as application name, version, device name, and network information.

## Key Features

- **Predefined User-Agent Format**: Automatically generates User-Agent strings with a fixed format.
- **Cross-Platform Support**: Compatible with both iOS and Android platforms.
- **Simple Integration**: Easy-to-use API for quick setup in your React Native projects.


## Install the library via npm or yarn.
Import and use the provided method to obtain the User-Agent string.
```sh
npm install @mobeuv/react-native-user-agent
yarn add @mobeuv/react-native-user-agent
```

## Usage

```js
import { getUserAgent } from '@mobeuv/react-native-user-agent';

const fetchUserAgent = async () => {
  try {
    const userAgent = await getUserAgent();
    console.log(userAgent);
    // iOS Result =
    // Android Result =
  } catch (error) {
    console.error('Error fetching User-Agent:', error);
  }
};
```


## Pattern

| Platform | Pattern                                                                                           | Example                                      |
|----------|---------------------------------------------------------------------------------------------------|----------------------------------------------|
| iOS      | `APPLICATION_NAME/APPLICATION_VERSION_NAME - Darwin/DARWIN_VERSION CFNetwork/CFNETWORK DEVICE_NAME SYSTEM_NAME/SYSTEM_VERSION` | `ReactTestApp/1.0 - Darwin/23F79 CFNetwork/1474 iPhone iOS/17.0` |
| Android  | `APPLICATION_NAME/APPLICATION_VERSION_NAME - WebSettings_getDefaultUserAgent`                             | `ReactNativeUserAgentExample/1.0 - Mozilla/5.0 (Linux; Android 12; sdk_gphone64_arm64 Build/SE1A.220203.002.A1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/124.0.6367.179 Mobile Safari/537.36`                    |

If `WebSettings.getDefaultUserAgent` is unavailable or an error occurs, we will try using `System.getProperty("http.agent")`. If `getProperty` also fails, the User-Agent will default to `APPLICATION_NAME/APPLICATION_VERSION_NAME`. In case of any generic errors, a rejection will be handled through a catch block.


## Requirements

- **Kotlin Version**:  >= 1.7.0
- **Android MinSdkVersion**: >= 21
- **Android NDK Version**: >= 21.4.7075529

## Handling Errors
If an error occurs during the construction of the User-Agent, a rejection will be thrown in the promise. Always remember to handle this and, if necessary, set your own temporary User-Agent.


## Contributing
Need a custom User-Agent? Create a PR adding this method for Kotlin and Swift. Just make sure that the methods used do not require a privacy manifest; if they do, you'll need to add the privacy manifest in the PR.

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

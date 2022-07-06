# Mobeuv - React Native User Agent

Library that helps you to get mobile application user agent and web view user agent strings

## The Package

This package is a fork of (<https://github.com/bebnev/react-native-user-agent>). All rights to the fork go to the proper authors under the MIT license (<https://github.com/bebnev>)
We created this fork to make the package available with future fixes and new features.

## Installation

```sh
npm install @mobeuv/react-native-user-agent

yarn add @mobeuv/react-native-user-agent
```

## Usage

```js
import { getUserAgent } from '@mobeuv/react-native-user-agent';

// ...

const result = getUserAgent();
```

### Methods:

| Method           | Description                   | Support     |     |
| ---------------- | ----------------------------- | ----------- | --- |
| getUserAgent     | Returns the agent             | Android/IOS |     |
| getAll           | Return all methods and values | Android/IOS |     |
| getDarwinVersion | Return Darwin Version         | IOS         |     |
| getConstants     | Return Constants              | Android/IOS |     |
| getSystemVersion | Return System Version         | Android     |     |

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

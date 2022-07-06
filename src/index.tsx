import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-user-agent' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const UserAgent = NativeModules.UserAgent
  ? NativeModules.UserAgent
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function getUserAgent(): string {
  return UserAgent.userAgent;
}

export function getAll(): string {
  return UserAgent;
}

export function getDarwinVersion(): string {
  return UserAgent.darwinVersion;
}

export function getConstants(): Constants {
  return UserAgent.getConstants();
}

export function getSystemVersion(): string {
  return UserAgent.systemVersion;
}

import { useState, useEffect } from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { getUserAgent } from '@mobeuv/react-native-user-agent';

export default function App() {
  const [result, setResult] = useState<string | undefined>();

  useEffect(() => {
    getUserAgent().then(setResult);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});

import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { getUserAgent } from 'react-native-user-agent';

export default function App() {
  const [result, setResult] = React.useState<string>('nothing');

  React.useEffect(() => {
    const agent = getUserAgent();
    setResult(agent);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Agent: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    margin: 20,
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});

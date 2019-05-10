
# react-native-off-storage

## Getting started

`$ npm install react-native-off-storage --save`

### Mostly automatic installation

`$ react-native link react-native-off-storage`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-off-storage` and add `RNOffStorage.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNOffStorage.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.thinkeasy.offStorage.RNOffStoragePackage;` to the imports at the top of the file
  - Add `new RNOffStoragePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-off-storage'
  	project(':react-native-off-storage').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-off-storage/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-off-storage')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNOffStorage.sln` in `node_modules/react-native-off-storage/windows/RNOffStorage.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Off.Storage.RNOffStorage;` to the usings at the top of the file
  - Add `new RNOffStoragePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNOffStorage from 'react-native-off-storage';

// TODO: What to do with the module?
RNOffStorage;
```
  
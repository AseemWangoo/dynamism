# screener
- This is a sample application.
- Uses MVVM pattern
- Tries to encourage the use of boundaries (by using the concept of packages) 

### Getting Started 🎯🎯

- Download the repo
- Make sure you are on the Flutter Stable Channel (1.22.6)

```dart
flutter channel stable
flutter upgrade

```

- Install dependencies, when asked, after downloading the project.
- Run the cmd 

```dart
flutter run

```

- You should see the app working at this point..

### Architecture 🏗🏗

- The app follows MVVM approach
- Their is a shared folder, which comprises of all the common entities.
- Common entites like assets, extensions, services etc

- Take a folder, let's say home
- It is broken down into components, models, utils (utilties if any), view and view_models

- Let's discuss each of them

### Components
- They contain the building blocks of UI.
- A UI may comprise of a button, or card, or a list. 
- All these items are created under their respective folders
- Let's say for a list component,

```dart
home/components/list/xyz.component.dart

```

### Model (from MVVM)
- They are usually simple classes
- For instance, let's take home
- It would contain models folder, including all the models needed for home

```dart
home/models/xyz.model.dart

```

### View (from MVVM)
- These are the screens visible to the user on their device.
- For instance, home would have views folder

```dart
home/view/xyz.view.dart

```

- We have 3 views
1. HomeView. Now home has 2 options (Egestas scleri) and (Consectur)
2. On click of Egestas scleri, you see the PellenView
3. On click of Consectur, you see the FringillaView


### Templates
- They are some cases, when a view has a piece of UI, that is somewhat big.
- We extract those bits of UI, into the templates

- Let's say for the home view, we have a template as,

```dart
home/templates/carousel/xyz.template.dart

```

### ViewModel (from MVVM)
- They help in transforming the data into models.
- For instance, home would have view_models folder

```dart
home/view_models/xyz.viewmodel.dart

```

### Utils 
- Any additional helpers or strings are put inside the utils
- For instance, home would have utils folder, containing all the strings needed

```dart
home/utils/strings.dart

```

### Shared
- Their is a folder called shared, which includes all the common entities inside the app

- For instance, all the styles, colors are placed under styles

```dart
shared/styles/xyz.dart

```

- For instance, all the services are placed under the services folder

```dart
shared/services/xyz.service.dart

```

### Data
- Sample data files are put inside the assets
- When needed they are fetched within the app.

### Testing 🧐🧐
- Uses golden tests `https://pub.dev/packages/golden_toolkit`
- Integration tests

```
flutter drive \
--driver=test_driver/integration_test.dart \
--target=integration_test/app_test.dart
```

```
flutter drive \
--driver=test_driver/integration_test.dart \
--target=integration_test/app_test.dart
-d "9B4DC39F-5419-4B26-9330-0B72FE14E15E"
```
Simple package helps you to do navigation in short line without using context (BuildCotext)
## Features

You can navigation without context.
Show dialog without context.
Show bottomSheet without context.
Show SnackBar without context and aything else without using any context.
And this package will give you context variable 
to use it whenever and wherever in your code.

## Getting started
In MaterialApp in main.dart you must pass [Go.navigatorKey] to [navigatorKey] property
like this:

```dart
MaterialApp(
      navigatorKey: Go.navigatorKey, //Pass this navigatorKey here
      home:  home: const HomePage(),
    );
```

and after that you can use this package usefully.    

## Usage
Explaining of how to use this package

## Global access to context
```dart
  ///If you need context in any file in your code you can use it
  Go.context;
```
## Navigation using route widget
```dart
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  Go.to(HomePage());

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  Go.toReplace(HomePage());

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  Go.toRemoveAll(HomePage());

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  Go.backAndTo(HomePage());
```
## Navigation using route name
```dart
  ///This is simple navigation all you have to do
  ///just passing your route [name] to go
  Go.toName("/homePage");

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove previous route from the tree
  Go.toReplaceName("/homePage");

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove all routes from the tree
  Go.toNameRemoveAll("/homePage");

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your route [name] to go
  Go.backAndToName("/homePage");
```
## Back to previous page
```dart
  ///If you need to back to previous page you can use this function,
  ///however if you need to pop many routes you simply
  ///you have to pass how many time you want to pop
  ///using [numOfBacks].
  ///There is no need to pass [numOfBacks] if you just want to pop one time.
  Go.back();
```
## Show dialog, bottomSheet, snackBar, and materialBanner
```dart
  ///If you wnat to [showDialog] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showDialog] proparties as usuall.
  Go.dialog(MyCustomDialog());

  ///If you wnat to [showModalBottomSheet] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showModalBottomSheet] proparties as usuall.
  Go.bottomSheet(MyCustomBottomSheet());

  ///If you wnat to [showSnackBar] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showSnackBar] proparties as usuall.
  Go.snackBar(MyCustomSnackBar());

  ///If you wnat to [showMaterialBanner] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showMaterialBanner] proparties as usuall.
  Go.materialBanner(MyCustomMaterialBanner());
```
## Global access to scaffoldMessenger
```dart
  ///If you need any thing from [ScaffoldMessenger.of(context)]
  ///you can use it wherevere in your code without need any context.
  Go.scaffoldMessenger;
```
## Global access to Theme
```dart
  ///If you need any thing from [Theme.of(context)]
  ///you can use it wherevere in your code without need any context.
  Go.theme;
```
## Additional information

I hope this package helped you very well.
If you need to contact with me: 

<img src="https://github.com/MohammadBahlaq/short_navigation/raw/main/assets/Gmail.jpg" width="22"> [Bahlaq57@gmail.com]

<!-- [<img src="https://github.com/MohammadBahlaq/short_navigation/raw/main/assets/Gmail.jpg" width="22">](Bahlaq57@gmail.com) -->

<img src="https://raw.githubusercontent.com/MohammadBahlaq/short_navigation/main/assets/LinkedIn.png" width="20"> [www.linkedin.com/in/mohammad-bahlaq-089882220]

<!-- [<img src="https://raw.githubusercontent.com/MohammadBahlaq/short_navigation/main/assets/LinkedIn.png" width="20">](www.linkedin.com/in/mohammad-bahlaq-089882220) -->

<img src="https://github.com/MohammadBahlaq/short_navigation/raw/main/assets/GitHub.png" width="20"> [https://github.com/MohammadBahlaq]

<!-- [<img src="https://github.com/MohammadBahlaq/short_navigation/raw/main/assets/GitHub.png" width="20">](https://github.com/MohammadBahlaq) -->

Do not hesitate to contact me if you faced any problem.

Mohammad Bahlaq.

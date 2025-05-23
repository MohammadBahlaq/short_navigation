<img src="https://raw.githubusercontent.com/MohammadBahlaq/short_navigation/main/assets/Designer(1).jpeg" height="220" width="800">


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

## Global access to the app [context] using class [Go]
```dart
  ///If you need context in any file in your code you can use it
  Go.context;
```

## Navigation using the default route [MaterialPageRoute] using class [Go]
```dart
  ///Instead of using [Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  Go.to(HomePage());

  ///Instead of using [Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  Go.toReplace(HomePage());
  
  ///Instead of using [Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  Go.toRemoveUntil(HomePage());

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  Go.backAndTo(HomePage());
```

## You can check these GIF examples from the Example section
<img src="https://github.com/user-attachments/assets/1a334193-27c9-4a88-a72c-a2369c0d8945" width="200" height="350" />
<img src="https://github.com/user-attachments/assets/8254ae11-cf51-4dbe-951d-4cad6adffc79" width="200" height="350" />
<img src="https://github.com/user-attachments/assets/cfceae55-49c1-49e7-a127-6e56b716f033" width="200" height="350" />
<img src="https://github.com/user-attachments/assets/c2381a5d-7c29-42be-8fc4-edeebbd51700" width="200" height="350" />
<img src="https://github.com/user-attachments/assets/b41082f4-8687-4677-8177-f5fd836d4296" width="200" height="350" />
<img src="https://github.com/user-attachments/assets/a6acb68f-d956-47bc-b5fd-f623e0e1c6fa" width="200" height="350" />
<img src="https://github.com/user-attachments/assets/47a44c0e-195d-42e7-a33a-c07cdd1d1009" width="200" height="350" />
<img src="https://github.com/user-attachments/assets/e6acd407-34c8-4beb-8289-7080e3d2a876" width="200" height="350" />

## Navigation with animations [Slide, Scale, Rotation, Size, Fade]
```dart
  ///You can navigate using [GoSlide] class
  ///and you can use slideDirection to chose the slide direction
  ///and curve to chose any curve you want
  GoSlide.to(HomePage()) //It will navigate like slide animation

  ///You can navigate using [GoScale] class
  ///and use curve to chose any curve you want
  GoScale.to(HomePage()) //It will scale the page gradually during navigation

  ///You can navigate using [GoSize] class
  ///and you can use sizeDirection to chose the where the navigation will begin
  ///and curve to chose any curve you want
  GoSize.to(HomePage()) //It will make the page's size larger smoothly during navigation

  ///You can navigate using [GoRotation] class
  ///and you can use numberOfTurns to chose how many turns you want the page rotate before navigation
  ///and use curve to chose any curve you want
  GoRotation.to(HomePage()) //It will make the page rotate at least one time

  ///You can navigate using [GoFade] class
  ///and use curve to chose any curve you want
  GoFade.to(HomePage()) //It will increase opacity smothly during navigation
```

## Navigation using [DialogRoute] using class [GoDialogRoute]
```dart
  ///Instead of using [Navigator.of(context).push(DialogRoute(........));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  GoDialogRoute.to(HomePage());

  ///Instead of using [Navigator.of(context).pushReplacement(DialogRoute(........));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  GoDialogRoute.toReplace(HomePage());
  
  ///Instead of using [Navigator.of(context).pushAndRemoveUntil(DialogRoute(........));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  GoDialogRoute.toRemoveUntil(HomePage());

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  GoDialogRoute.backAndTo(HomePage());
```

## Navigation using [RawDialogRoute] using class [GoRawDialogRoute]
```dart
  ///Instead of using [Navigator.of(context).push(RawDialogRoute(.......));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  GoRawDialogRoute.to(HomePage());

  ///Instead of using [Navigator.of(context).pushReplacement(RawDialogRoute(.......));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  GoRawDialogRoute.toReplace(HomePage());
  
  ///Instead of using [Navigator.of(context).pushAndRemoveUntil(RawDialogRoute(.......));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  GoRawDialogRoute.toRemoveUntil(HomePage());

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  GoRawDialogRoute.backAndTo(HomePage());
```

## Navigation using [PageRouteBuilder] using class [GoPageRoute]
```dart
  ///Instead of using [Navigator.of(context).push(PageRouteBuilder(......));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  GoPageRoute.to(HomePage());

  ///Instead of using [Navigator.of(context).pushReplacement(PageRouteBuilder(......));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  GoPageRoute.toReplace(HomePage());
  
  ///Instead of using [Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder(......));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  GoPageRoute.toRemoveUntil(HomePage());

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  GoPageRoute.backAndTo(HomePage());
```

## Navigation using [ModalBottomSheetRoute] using class [GoBottomSheetRoute]
```dart
  ///Instead of using [Navigator.of(context).push(ModalBottomSheetRoute(........));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  GoBottomSheetRoute.to(HomePage());

  ///Instead of using [Navigator.of(context).pushReplacement(ModalBottomSheetRoute(........));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  GoBottomSheetRoute.toReplace(HomePage());
  
  ///Instead of using [Navigator.of(context).pushAndRemoveUntil(ModalBottomSheetRoute(........));]
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  GoBottomSheetRoute.toRemoveUntil(HomePage());

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  GoBottomSheetRoute.backAndTo(HomePage());
```

## Navigation using route name
```dart
  ///Instead of using [Navigator.of(context).pushNamed("/homePage");]
  ///This is simple navigation all you have to do
  ///just passing your route [name] to go
  Go.toName("/homePage");

  ///Instead of using [Navigator.of(context).pushReplacementNamed("/homePage");]
  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove previous route from the tree
  Go.toReplaceName("/homePage");

  ///Instead of using [Navigator.of(context).pushNamedAndRemoveUntil("/homePage");]
  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove all routes from the tree
  Go.toNameRemoveAll("/homePage");

  ///Instead of using [Navigator.of(context).popAndPushNamed("/homePage");]
  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your route [name] to go
  Go.backAndToName("/homePage");
```

## Back to previous page
```dart
  ///If you need to back to previous page you can [Go.back()],
  ///however if you need to pop many routes simply
  ///you have to use [Go.multiBack()] and pass how many time you want to pop
  ///using [numOfBacks].
  ///There is no need to pass [numOfBacks] if you just want to pop one time.

  ///Instead of using [Navigator.of(context).pop();]
  Go.back();

  ///Instead of using [Navigator.of(context)..pop()..pop()..pop();]
  ///If you wand to pop 3 pages
  Go.multiBack(3); //instate of Go.back(); Go.back(); Go.back();

  ///You can back as many as you want
  ///If you wand to pop 5 pages
  Go.multiBack(5);
  ///If you wand to pop 2 pages
  Go.multiBack(2);
```

## Show [dialog, bottomSheet, snackBar, and materialBanner] using class [GoMessenger]
```dart
  ///Instead of using [showDialog(context: context,builder: (context) => MyCustomDialog());]
  ///If you wnat to [showDialog] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showDialog] proparties as usuall.
  GoMessenger.dialog(MyCustomDialog());

  ///Instead of using [showModalBottomSheet(context: context, builder: (context) => content);]
  ///If you wnat to [showModalBottomSheet] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showModalBottomSheet] proparties as usuall.
  GoMessenger.bottomSheet(MyCustomBottomSheet());

  ///Instead of using [ScaffoldMessenger.of(context).showSnackBar(snackBar);]
  ///If you wnat to [showSnackBar] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showSnackBar] proparties as usuall.
  GoMessenger.snackBar(MyCustomSnackBar());

  ///Instead of using [ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);]
  ///If you wnat to [showMaterialBanner] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showMaterialBanner] proparties as usuall.
  GoMessenger.materialBanner(MyCustomMaterialBanner());
```

## Global access to [Anything.of(context)] using class [GofContext]
```dart
    ///If you need any thing from [Theme.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.theme;

    ///If you need any thing from [ModalRoute.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.modalRoute;

    ///If you need any thing from [MediaQuery.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.mediaQuery;

    ///If you need any thing from [Focus.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.focus;

    ///If you need any thing from [FocusScope.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.focusScope;

    ///If you need any thing from [DefaultAssetBundle.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.defaultAssetBundle;

    ///If you need any thing from [MaterialLocalizations.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.materialLocalizations;

    ///If you need any thing from [Scaffold.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.scaffold;

    ///If you need any thing from [ScaffoldMessenger.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.scaffoldMessenger;

    ///If you need any thing from [Navigator.of(context)]
    ///you can use it wherevere in your code without need any context.
    GofContext.navigator;
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

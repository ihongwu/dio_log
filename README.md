# dio_log
[![pub package](https://img.shields.io/pub/v/dio_log.svg)](https://pub.dev/packages/dio_log)

[English](./README.md) | [中文](./README_zh.md)

## Note
This project originates from https://pub.dev/packages/dio_log The version is dio-log 5.3.0+3, which differs from the original author's project in that the background color of the page has been uniformly changed to white, while the text color has been uniformly changed to black. This solves the problem of unclear logs caused by incorrect or mismatched theme configuration in dark mode

## Description
HTTP Inspector tool for Dart which can debugging http requests. Currently, DIO based HTTP capture is implemented.
Of course, you can implement an Interceptor instead of a DiologInterceptor to adapt to other HTTP clients.
## Installation
Add this to your package's `pubspec.yaml` file:
```yaml
dependencies:
  dio_log:
    git:
      url: https://github.com/ihongwu/dio_log
      ref: main
```

## Usage
1. Set interceptor of dio:
```dart
dio.interceptors.add(DioLogInterceptor());
```

2. Add a global hover button on your home page:
```dart
// Display overlay button
showDebugBtn(context, btnColor: Colors.blue);
// Cancel overlay button
dismissDebugBtn();
// Check overlay button state
debugBtnIsShow()
```

3. Or open log list manually:
```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => HttpLogListWidget(),
  ),
);
```

## Configuration
```dart
// Sets the maximum number of entries for logging
LogPoolManager.getInstance().maxCount = 100;
// Add custom error detection
LogPoolManager.getInstance().isError = (res) => res.resOptions==null;
// Disable Log Printing
DioLogInterceptor.enablePrintLog = false;
```

## Screenshots
<img src="https://raw.githubusercontent.com/flutterplugin/dio_log/develop/images/log_list.jpg" width="200">      
<img src="https://raw.githubusercontent.com/flutterplugin/dio_log/develop/images/log_request.jpg" width="200">
<img src="https://raw.githubusercontent.com/flutterplugin/dio_log/develop/images/log_response.jpg" width="200">
<img src="https://raw.githubusercontent.com/flutterplugin/dio_log/develop/images/log_filter.jpg" width="200">

## Demo
![gif](https://raw.githubusercontent.com/flutterplugin/dio_log/develop/images/dio_log_example.gif)
# Flex License Scanner

A professional, high-performance rectangular overlay for Driving License and ID card OCR scanning.



## 🌟 Features

* **Standard ID-1 Aspect Ratio:** Perfectly sized for Driving Licenses and Identity Cards ($85.60 \times 53.98$ mm).
* **Customizable Guide Frame:** Adjust border colors, thickness, and corner radius to match your app's brand.
* **Semi-Transparent Overlay:** Dims the area outside the scanner to help users focus on the document.
* **Clean Architecture:** Built with a strict separation between domain logic and presentation layers.
* **Lightweight:** Zero heavy dependencies. Works with any camera plugin like `camera` or `mobile_scanner`.

## 🚀 Getting Started

### Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flex_license_scanner: ^0.0.1
```

### Usage
## 🚀 Basic Usage

Wrap your camera preview in a Stack and place the LicenseScannerOverlay on top:

```dart
import 'package:flex_license_scanner/flex_license_scanner.dart';

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        // Your Camera Widget (e.g., CameraPreview or MobileScanner)
        const MyCameraWidget(),
        
        // The License Overlay
        const LicenseScannerOverlay(
          config: ScannerConfig(
            borderColor: Colors.greenAccent,
            overlayOpacity: 0.6,
          ),
        ),
      ],
    ),
  );
}
```

## 🛠 Configuration

You can fully customize the `ScannerConfig`:

| Property        | Description                          | Default                |
|-----------------|--------------------------------------|------------------------|
| aspectRatio     | Width/Height ratio of the frame      | 1.585 (ID-1 Standard)  |
| borderColor     | Color of the focus margins           | Colors.green           |
| overlayOpacity  | Darkness of the surrounding area     | 0.7                    |

## 🏗 Architecture

This package follows Clean Architecture principles:

- **Domain Layer**: Defines the `ScannerConfig` entity and business rules for ID ratios.
- **Presentation Layer**: Contains the `LicensePainter` (`CustomPainter`) and the `LicenseScannerOverlay` widget.

```dart
import 'package:flex_license_scanner/flex_license_scanner.dart';
```

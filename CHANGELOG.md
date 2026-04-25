# Changelog

## 0.0.7

### New Features

* **Expanded ScannerConfig**: Added new customization options:
  * `cornerRadius` - Customize frame corner radius
  * `borderWidth` - Adjust border thickness
  * `frameWidthRatio` - Control frame width relative to screen
  * `showLaserAnimation` - Enable/disable laser effect
  * `laserColor` - Customize laser color
  * `laserAnimationDuration` - Control animation speed
  * `laserGlowIntensity` - Adjust laser glow effect
* **LicenseScannerOverlayAnimated**: New animated widget with laser scanning effect
* **copyWith()**: Added copyWith method to ScannerConfig for easy customization
* **getScannerFrameRect()**: Static helper to get frame bounds for image cropping

### Improvements

* Updated SDK constraint to `>=3.0.0 <4.0.0` for better compatibility
* Updated `google_mlkit_text_recognition` to `^0.15.0`
* Made ScannerConfig constructor `const` for better performance
* Improved code documentation

## 0.0.6

* Bug fixes and improvements

## 0.0.2

* Initial release.
* Added rectangular ID-1 aspect ratio guide for Driving Licenses.
* Implemented Clean Architecture for easy customization.

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../domain/utils/license_parser.dart';

class LicenseOcrService {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  /// Processes the image and returns parsed LicenseData if found
Future<LicenseData?> processImage(InputImage inputImage) async {
  try {
    final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
    
    // ADD THIS LOG: Check your terminal/debug console while scanning
    debugPrint("EXTRACTED TEXT: ${recognizedText.text}");
    
    return LicenseParser.parse(recognizedText.text);
  } catch (e) {
    debugPrint("OCR Error: $e");
    return null;
  }
}

  void dispose() {
    _textRecognizer.close();
  }
}
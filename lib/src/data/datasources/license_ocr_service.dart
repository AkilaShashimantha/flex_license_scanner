import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../domain/utils/license_parser.dart';

class LicenseOcrService {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  /// Processes the image and returns parsed LicenseData if found
  Future<LicenseData?> processImage(InputImage inputImage) async {
    try {
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      
      // Pass the raw text to the parser we created earlier
      return LicenseParser.parse(recognizedText.text);
    } catch (e) {
      print("OCR Error: $e");
      return null;
    }
  }

  void dispose() {
    _textRecognizer.close();
  }
}
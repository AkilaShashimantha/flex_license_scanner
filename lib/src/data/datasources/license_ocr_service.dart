import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../domain/utils/license_parser.dart';

class LicenseOcrService {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  /// Processes the image and returns parsed LicenseData if found
  Future<LicenseData?> processImage(InputImage inputImage) async {
 final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
  
  // DEBUG: Print this to your console to see what the OCR sees
  print("RAW OCR TEXT: ${recognizedText.text}"); 
  
  return LicenseParser.parse(recognizedText.text);
  }

  void dispose() {
    _textRecognizer.close();
  }
}
class LicenseData {
  final String licenseNumber;
  final String nicNumber;
  final String issueDate;
  final String expiryDate;

  LicenseData({
    required this.licenseNumber,
    required this.nicNumber,
    required this.issueDate,
    required this.expiryDate,
  });
}

class LicenseParser {
  static LicenseData? parse(String rawText) {
    final lines = rawText.split('\n');
    String? lic, nic, issue, expiry;

    for (var line in lines) {
      final cleanLine = line.trim();
      
      // Use Regex to find the fields even if there are small OCR errors
      if (cleanLine.contains(RegExp(r'5\.\s*'))) {
        lic = cleanLine.split(RegExp(r'5\.\s*')).last.trim();
      }
      if (cleanLine.contains(RegExp(r'4d\.\s*'))) {
        nic = cleanLine.split(RegExp(r'4d\.\s*')).last.trim();
      }
      if (cleanLine.contains(RegExp(r'4a\.\s*'))) {
        issue = cleanLine.split(RegExp(r'4a\.\s*')).last.trim();
      }
      if (cleanLine.contains(RegExp(r'4b\.\s*'))) {
        expiry = cleanLine.split(RegExp(r'4b\.\s*')).last.trim();
      }
    }

    // Return data if at least the License or NIC is found
    if (lic != null || nic != null) {
      return LicenseData(
        licenseNumber: lic ?? "Not detected",
        nicNumber: nic ?? "Not detected",
        issueDate: issue ?? "",
        expiryDate: expiry ?? "",
      );
    }
    return null;
  }
}
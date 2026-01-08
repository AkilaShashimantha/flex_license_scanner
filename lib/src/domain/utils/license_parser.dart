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
    // We search for the prefixes you identified
    final lines = rawText.split('\n');
    String? lic, nic, issue, expiry;

    for (var line in lines) {
      if (line.contains('5.')) lic = line.replaceAll('5.', '').trim();
      if (line.contains('4d.')) nic = line.replaceAll('4d.', '').trim();
      if (line.contains('4a.')) issue = line.replaceAll('4a.', '').trim();
      if (line.contains('4b.')) expiry = line.replaceAll('4b.', '').trim();
    }

    if (lic != null && nic != null) {
      return LicenseData(
        licenseNumber: lic,
        nicNumber: nic,
        issueDate: issue ?? "",
        expiryDate: expiry ?? "",
      );
    }
    return null;
  }
}
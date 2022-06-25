import 'package:travelmate/enums/verification_status.dart';

class CommonHelper {
  CommonHelper._();

  static String? verificationStatusMessage(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.pending:
        return 'Your verification are being processed. Please wait in maximum of 1x24 hours.';
      case VerificationStatus.rejected:
        return 'Sorry! Your verification is failed.';
      default:
        return null;
    }
  }
}

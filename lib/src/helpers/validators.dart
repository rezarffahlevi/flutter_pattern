import 'dart:async';

class Validators {
  final validatePhoneNumber = StreamTransformer<String, String>.fromHandlers(
      handleData: (phoneNumber, sink) {
    if ((phoneNumber?.length ?? 0) < 6) {
      sink.addError('Nomor ponsel tidak valid');
    } else {
      sink.add(phoneNumber);
    }
  });

  final ovoValidatePhoneNumber = StreamTransformer<String, String>.fromHandlers(
      handleData: (phoneNumber, sink) {
    if ((phoneNumber?.length ?? 0) < 10) {
      sink.addError('Nomor ponsel tidak valid');
    } else {
      sink.add(phoneNumber);
    }
  });

  final validatePinPartner =
      StreamTransformer<String, String>.fromHandlers(handleData: (pin, sink) {
    if ((pin?.length ?? 0) < 6) {
      sink.addError('Pin tidak valid');
    } else {
      sink.add(pin);
    }
  });

  String validatePhoneNumberManual(String? value) {
    value = value ?? '';
    if (value == '')
      return ' ';
    else if ((value?.length ?? 0) < 6)
      return 'Nomor ponsel tidak valid';
    else
      return '';
  }

  final validateStringIsNotEmpty =
      StreamTransformer<String, String?>.fromHandlers(
          handleData: (value, sink) {
    if (value == '') {
      sink.add(null);
      sink.addError('Harus Diisi');
    } else {
      sink.add(value);
    }
  });

  final validateStringMoreThan20 =
      StreamTransformer<String, String?>.fromHandlers(
          handleData: (value, sink) {
    if (value.length < 20) {
      sink.add(null);
      sink.addError('Harus Diisi');
    } else {
      sink.add(value);
    }
  });

  final validateVerificationCodeLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length < 4) {
      sink.addError('Harus 4 Karakter');
    } else {
      sink.add(value);
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(email)) {
      sink.addError('Email Tidak Valid');
    } else {
      sink.add(email);
    }
  });

  static String? validateEmailString(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value ?? ''))
      return 'Email Tidak Valid';
    else
      return null;
  }

  ///NEW WITH TEXT FORM FIELD

  static String? notEmptyValidator(String value) {
    if (value.isEmpty) {
      return '* Harus diisi';
    }

    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return '* Kata sandi harus diisi';
    } else if (value.length < 6) {
      return '* Kata sandi harus paling sedikit 6 karakter';
    }

    return null;
  }

  static String? emailValidator(String email, {bool canEmpty = false}) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (email.isEmpty && !canEmpty) {
      return '* Email harus diisi';
    } else if (email.isEmpty && canEmpty) {
      return null;
    } else if (!regex.hasMatch(email)) {
      return '* Format email tidak sesuai';
    }

    return null;
  }

  static String? referralCodeValidator(String value) {
    if (value.isEmpty) {
      return null;
    } else if (value.length < 8 || value.length > 8) {
      return '* Kode referral harus 8 karakter';
    }

    return null;
  }
}

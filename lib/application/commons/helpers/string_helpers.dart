import 'package:intl/intl.dart';

class BrazilianCep {
  // Formatar número de BrazilianCep
  static String? formatToBrazilianCep(String brazilianCep) {
    // Obter somente os números do BrazilianCpf
    var numeros = brazilianCep.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o BrazilianCpf possui 11 dígitos
    if (numeros.length != 8) return brazilianCep;

    // Retornar BrazilianCpf formatado
    return '${numeros.substring(0, 5)}-${numeros.substring(5, 8)}';
  }

  static bool isValidBrazilianCep(String brazilianCep) {
    var aux = formatToBrazilianCep(brazilianCep);
    bool emailValid = RegExp(r'^[0-9]{5}-[0-9]{3}$').hasMatch(aux!);
    return emailValid;
  }
}

class BrazilianCpf {
  // Formatar número de BrazilianCpf
  static String? formatToBrazilianCpf(
    String brazilianCpf,
  ) {
    // Obter somente os números do BrazilianCpf
    var numeros = brazilianCpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o BrazilianCpf possui 11 dígitos
    if (numeros.length != 11) return brazilianCpf;

    // Retornar BrazilianCpf formatado
    return '${numeros.substring(0, 3)}.${numeros.substring(3, 6)}.${numeros.substring(6, 9)}-${numeros.substring(9)}';
  }

  // Validar número de BrazilianCpf
  static bool isValidBrazilianCpf(String brazilianCpf) {
    // Obter somente os números do BrazilianCpf
    var numeros = brazilianCpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o BrazilianCpf possui 11 dígitos
    if (numeros.length != 11) return false;

    // Testar se todos os dígitos do BrazilianCpf são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

    // Dividir dígitos
    List<int> digitos = numeros.split('').map((String d) => int.parse(d)).toList();

    // Calcular o primeiro dígito verificador
    var calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digitos[10 - i] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digitos[9] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digitos[11 - i] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digitos[10] != dv2) return false;

    return true;
  }
}

class BrazilianCnpj {
  // Formatar número de BrazilianCnpj
  static String? formatToBrazilianCnpj(
    String brazilianCnpj,
  ) {
    // Obter somente os números do BrazilianCnpj
    var numeros = brazilianCnpj.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o BrazilianCnpj possui 14 dígitos
    if (numeros.length != 14) return brazilianCnpj;

    // Retornar BrazilianCpf formatado
    return '${numeros.substring(0, 2)}.${numeros.substring(2, 5)}.${numeros.substring(5, 8)}/${numeros.substring(8, 12)}-${numeros.substring(12)}';
  }

  // Validar número de BrazilianCnpj
  static bool isValidBrazilianCnpj(String brazilianCnpj) {
    // Obter somente os números do BrazilianCnpj
    var numeros = brazilianCnpj.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o BrazilianCnpj possui 14 dígitos
    if (numeros.length != 14) return false;

    // Testar se todos os dígitos do BrazilianCnpj são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

    // Dividir dígitos
    List<int> digitos = numeros.split('').map((String d) => int.parse(d)).toList();

    // Calcular o primeiro dígito verificador
    var calcDv1 = 0;
    var j = 0;
    for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
      calcDv1 += digitos[j++] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digitos[12] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    j = 0;
    for (var i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
      calcDv2 += digitos[j++] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digitos[13] != dv2) return false;

    return true;
  }
}

extension ToOnlyNumbers on String {
  String toOnlyNumbers() {
    var aux = replaceAll(RegExp(r'[^0-9]'), '');
    return aux;
  }
}

extension ToOnlyLetters on String {
  String toOnlyLetters() {
    var aux = replaceAll(RegExp(r'[^a-z^A-Z]'), '');
    return aux;
  }
}

extension ToLocalDate on String {
  String toLocalDate({bool dataHora = true}) {
    String strData;
    DateFormat formatter;
    if (trim() != '') {
      if (dataHora) {
        formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
      } else {
        formatter = DateFormat('dd/MM/yyyy');
      }
      DateTime aux = DateTime.parse(this);
      strData = formatter.format(aux);
    } else {
      strData = '';
    }
    return strData;
  }
}

extension DoubleToStringIgnoreNull on double {
  String toStringIgnoreNull() {
    var aux = toString().toUpperCase() == 'NULL' ? '' : toString();
    return aux;
  }
}

extension IntToStringIgnoreNull on int {
  String toStringIgnoreNull() {
    var aux = toString().toUpperCase() == 'NULL' ? '' : toString();
    return aux;
  }
}

extension StringToStringIgnoreNull on String {
  String toStringIgnoreNull() {
    var aux = toString().toUpperCase() == 'NULL' ? '' : toString();
    return aux;
  }
}

extension ToBrazilianCep on String {
  String? toBrazilianCep() {
    String? aux = replaceAll(RegExp(r'[^0-9]'), '').trim();
    if (aux != '') {
      aux = length == 8 ? BrazilianCep.formatToBrazilianCep(aux) : 'Inválido';
    } else {
      aux = '';
    }
    return aux;
  }
}

extension IsValidBrazilianCep on String {
  bool get isValidBrazilianCep {
    return BrazilianCep.isValidBrazilianCep(this);
  }
}

extension ToBrazilianCpf on String {
  String? toBrazilianCpf() {
    return length == 11 ? BrazilianCpf.formatToBrazilianCpf(this) : 'Inválido';
  }
}

extension IsValidBrazilianCpf on String {
  bool get isValidBrazilianCpf {
    return BrazilianCpf.isValidBrazilianCpf(this);
  }
}

extension ToBrazilianCnpj on String {
  String? tnBrazilianCnpj() {
    return length == 14 ? BrazilianCnpj.formatToBrazilianCnpj(this) : 'Inválido';
  }
}

extension IsValidBrazilianCnpj on String {
  bool get isValidBrazilianCnpj {
    return BrazilianCnpj.isValidBrazilianCnpj(this);
  }
}

extension ToBrazilianCpfCnpj on String {
  String? toBrazilianCpfCnpj() {
    return length < 14 ? BrazilianCpf.formatToBrazilianCpf(this) : BrazilianCnpj.formatToBrazilianCnpj(this);
  }
}

extension IsValidBrazilianCpfCnpj on String {
  bool get isValidBrazilianCpfCnpj {
    switch (length) {
      case 11:
        return BrazilianCpf.isValidBrazilianCpf(this);
      case 14:
        return BrazilianCnpj.isValidBrazilianCnpj(this);
      default:
        return false;
    }
  }
}

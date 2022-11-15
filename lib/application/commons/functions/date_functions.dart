import 'package:intl/intl.dart';
import 'package:pdvandroid_flutter/application/commons/regex/date_time_regex.dart';

abreviaNomeMes(String nomeMes) {
  return (nomeMes.length > 4) ? nomeMes.substring(0, 3) : nomeMes;
}

String nomeMes(int month) {
  switch (month) {
    case 1:
      return 'Janeiro';
    case 2:
      return 'Fevereiro';
    case 3:
      return 'Março';
    case 4:
      return 'Abril';
    case 5:
      return 'Maio';
    case 6:
      return 'Junho';
    case 7:
      return 'Julho';
    case 8:
      return 'Agosto';
    case 9:
      return 'Setembro';
    case 10:
      return 'Outubro';
    case 11:
      return 'Novembro';
    case 12:
      return 'Dezembro';
    default:
      return 'Não Definido';
  }
}

String diaSemana(
  int weekDay, {
  bool completo = false,
}) {
  String complemento;
  complemento = completo ? '-Feira' : '';
  switch (weekDay) {
    case 1:
      return 'Segunda$complemento';
    case 2:
      return 'Terça$complemento';
    case 3:
      return 'Quarta$complemento';
    case 4:
      return 'Quinta$complemento';
    case 5:
      return 'Sexta$complemento';
    case 6:
      return 'Sábado';
    case 7:
      return 'Domingo';
    default:
      return 'Não Definido';
  }
}

DateTime convertStringToDateTime(dataString) {
  DateTime? newDate;
  try {
    if (DateTimeRegex.brazilianDateRegex.hasMatch(dataString)) {
      newDate = DateFormat('dd/MM/yyyy').parse(dataString);
    }
    if (DateTimeRegex.brazilianDateTimeRegex.hasMatch(dataString)) {
      newDate = DateFormat('dd/MM/yyyy HH:mm:ss').parse(dataString);
    }
    if (DateTimeRegex.databaseDateRegex.hasMatch(dataString)) {
      newDate = DateFormat('yyyy-MM-dd').parse(dataString);
    }
    if (DateTimeRegex.databaseDateTimeRegex.hasMatch(dataString)) {
      newDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dataString);
    }
    try {
      newDate = newDate ?? DateTime.parse(dataString);
    } catch (e) {
      newDate = DateTime.now();
    }
  } catch (e) {
    newDate = DateTime.now();
  }
  return newDate;
}

String formatDateToLiteral(
  DateTime data, {
  bool abreviarMes = false,
}) {
  return (abreviarMes)
      ? '${diaSemana(data.weekday)}, ${data.day} de ${abreviaNomeMes(nomeMes(data.month))} de ${data.year}'
      : '${diaSemana(data.weekday)}, ${data.day} de ${nomeMes(data.month)} de ${data.year}';
}

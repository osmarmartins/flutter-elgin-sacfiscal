import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final _usuarioConectado = ''.obs;

  get usuarioConectado => _usuarioConectado.value;
  set usuarioConectado(value) => _usuarioConectado.value = value;

  setUusuuario({
    required int codigoUsuario,
  }) {
    usuarioConectado = codigoUsuario;
  }

  // @override
  // onInit() async {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}

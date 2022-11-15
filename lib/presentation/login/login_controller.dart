import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdvandroid_flutter/application/application_pages.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/dao/configuracoes_dao.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/connection/sqlite_connection.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/exports/sqlite_entity_exports.dart';

class LoginController extends GetxController {
  final _manterDadosLogin = false.obs;
  final _isKeyboardVisible = false.obs;
  final _login = ''.obs;
  final _senha = ''.obs;
  final _hidePasswordState = true.obs;

  get manterDadosLogin => _manterDadosLogin.value;
  set manterDadosLogin(value) => _manterDadosLogin.value = value;

  get isKeyboardVisible => _isKeyboardVisible.value;
  set isKeyboardVisible(value) => _isKeyboardVisible.value = value;

  get login => _login.value;
  set login(value) => _login.value = value;

  get senha => _senha.value;
  set senha(value) => _senha.value = value;

  get hidePasswordState => _hidePasswordState.value;
  set hidePasswordState(value) => _hidePasswordState.value = value;

  void setKeyboardVisible(bool value) {
    _isKeyboardVisible.value = value;
  }

  setLogin(String value) {
    login = value;
  }

  setSenha(String value) {
    senha = value;
  }

  setSwitchManterDadosLogin(
    bool value, {
    required String nomeUsuario,
  }) {
    manterDadosLogin = value;
    login = nomeUsuario;
  }

  setHidePasswordState() {
    _hidePasswordState.value = !_hidePasswordState.value;
  }

  Future<void> efetuarLogin(String login, String senha) async {
    UsuarioEntity? usuario = await Get.find<SQLiteConnection>().usuarioDAO.login(login);

    try {
      if (usuario != null) {
        if (usuario.senha == senha) {
          var configuracoes = Get.find<ConfigruacoesEntity>();

          configuracoes.id = usuario.id;
          configuracoes.loginUsuario = login;
          configuracoes.logado = true;
          configuracoes.dataUltimoAcesso = DateTime.now().toIso8601String();
          configuracoes.manterDadosLogin = manterDadosLogin;

          Get.find<ConfiguracoesDao>().updateData(configuracoes);

          Get.toNamed(ApplicationRoutes.launcher);
        } else {
          Get.snackbar(
            'Falha de login',
            'Favor verifique os dados de acesso!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
          );
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  onInit() async {
    var configuracoes = Get.find<ConfigruacoesEntity>();

    manterDadosLogin = configuracoes.manterDadosLogin ?? false;

    if (manterDadosLogin == true) {
      login = configuracoes.loginUsuario;
    }

    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:pdvandroid_flutter/application/commons/functions/cancel_focud.dart';
import 'package:pdvandroid_flutter/application/commons/theme/cores.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_button_widget.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_textformfield_widget.dart';
import 'package:pdvandroid_flutter/presentation/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with RouteAware {
  LoginController controller = Get.find<LoginController>();

  final _formKey = GlobalKey<FormState>();
  final keyboardVisibilityController = KeyboardVisibilityController();

  @override
  initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    controller.setKeyboardVisible(false);

    keyboardVisibilityController.onChange.listen(
      (bool visible) {
        controller.setKeyboardVisible(visible);
      },
    );

    controller.login = 'usuario1';
    controller.senha = '1234';

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Get.find<RouteObserver>().subscribe(
      this,
      ModalRoute.of(context) as PageRoute,
    );
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  void didPushNext() {
    cancelFocus(context);
  }

  @override
  Widget build(BuildContext context) {
    final ApplicationResponsiveWidget responsiveWidget = ApplicationResponsiveWidget.of(context);

    PreferredSizeWidget scaffoldAppBar = AppBar(
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.infoCircle),
          onPressed: () {},
        )
      ],
      title: GestureDetector(
        onTap: () {},
        child: Text('Login'),
      ),
      backgroundColor: AppTheme.corRoxa.withAlpha(200),
      centerTitle: true,
    );

    return KeyboardDismisser(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: scaffoldAppBar,
          backgroundColor: AppTheme.corRoxa,
          body: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  height: responsiveWidget.heightPercentual(80),
                  padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () {
                          return controller.isKeyboardVisible == false
                              ? Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    height: responsiveWidget.heightPercentual(60),
                                    child: Image.asset(
                                      'assets/images/logo_sacfiscal_elgin_branco3.fw.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container();
                        },
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: keyboardVisibilityController.isVisible == false
                                ? responsiveWidget.widthPercentual(5)
                                : responsiveWidget.widthPercentual(20),
                            right: keyboardVisibilityController.isVisible == false
                                ? responsiveWidget.widthPercentual(5)
                                : responsiveWidget.widthPercentual(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ApplicationTextFormFieldWidget(
                                key: Key('edtLoginUsuario'),
                                initialValue: 'usuario1',
                                labelText: 'Seu login',
                                textInputAction: TextInputAction.next,
                                onChanged: (text) {
                                  controller.login = text;
                                },
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: responsiveWidget.diagonalPercentual(
                                    responsiveWidget.isTablet ? 1.5 : 2,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor.withAlpha(100),
                                  fontSize: responsiveWidget.diagonalPercentual(
                                    responsiveWidget.isTablet ? 1.5 : 2,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor.withAlpha(100),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Favor informar o login do usuário';
                                  }
                                  return null;
                                },
                              ),
                              ApplicationTextFormFieldWidget(
                                key: Key('edtSenha'),
                                initialValue: '1234',
                                isPassword: controller.hidePasswordState ?? false,
                                labelText: 'Sua Senha',
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (value) {
                                  validarFormularioLogin();
                                },
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: responsiveWidget.diagonalPercentual(
                                    responsiveWidget.isTablet ? 1.5 : 2,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor.withAlpha(100),
                                  fontSize: responsiveWidget.diagonalPercentual(
                                    responsiveWidget.isTablet ? 1.5 : 2,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                                onChanged: (text) {
                                  controller.senha = text;
                                },
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor.withAlpha(100),
                                  ),
                                ),
                                suffixIcon: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: IconButton(
                                    icon: controller.hidePasswordState ?? false
                                        ? Icon(
                                            FontAwesomeIcons.eye,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        : Icon(
                                            FontAwesomeIcons.eyeSlash,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                    onPressed: () {
                                      controller.setHidePasswordState();
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vafor informar a senha de acesso';
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Switch(
                                      value: controller.manterDadosLogin,
                                      activeColor: Theme.of(context).primaryColor,
                                      onChanged: (value) {
                                        controller.setSwitchManterDadosLogin(
                                          value,
                                          nomeUsuario: controller.login,
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Manter Dados de login?',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: responsiveWidget.diagonalPercentual(
                                        responsiveWidget.isTablet ? 1.5 : 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ApplicationButtonWidget(
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () async {
                                  validarFormularioLogin();
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Get.toNamed(ApplicationRoutes.loginRecoveryView);
                                    },
                                    child: SizedBox(
                                      height: 60,
                                      width: responsiveWidget.width,
                                      child: Text(
                                        'Esqueceu a sua senha?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: responsiveWidget.diagonalPercentual(
                                            responsiveWidget.isTablet ? 1.5 : 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validarFormularioLogin() {
    if (_formKey.currentState!.validate()) {
      controller.efetuarLogin(controller.login, controller.senha);
    }
  }
}

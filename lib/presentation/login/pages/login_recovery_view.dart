import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_button_widget.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_textformfield_widget.dart';

class LoginRecoveryView extends StatefulWidget {
  const LoginRecoveryView({Key? key}) : super(key: key);

  @override
  _LoginRecoveryViewState createState() => _LoginRecoveryViewState();
}

class _LoginRecoveryViewState extends State<LoginRecoveryView> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    final ApplicationResponsiveWidget responsiveWidget = ApplicationResponsiveWidget.of(context);
    return KeyboardDismisser(
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Recuperação de Senha'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              alignment: Alignment.center,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(
                        image: AssetImage('assets/images/email.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Entre com um e-mail válido e vinculado a sua conta de usuário para recuperação da senha.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ApplicationTextFormFieldWidget(
                      key: Key('edtSenha'),
                      initialValue: '',
                      labelText: 'E-mail',
                      hintText: 'Entre com um e-mail válido',
                      textStyle: TextStyle(
                        color: Colors.green[900],
                        fontSize: responsiveWidget.diagonalPercentual(
                          responsiveWidget.isTablet ? 2 : 2,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.green.withAlpha(110),
                        fontSize: responsiveWidget.diagonalPercentual(
                          responsiveWidget.isTablet ? 2 : 2,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (text) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ApplicationButtonWidget(
                        child: Text(
                          'Enviar Nova Senha',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        height: 45,
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

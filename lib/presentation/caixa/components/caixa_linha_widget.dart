import 'package:flutter/material.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';

class CaixaLinhaWIdget extends StatefulWidget {
  final String label;
  final String identificador;
  final String valor;
  const CaixaLinhaWIdget({
    Key? key,
    required this.label,
    required this.identificador,
    this.valor = '',
  }) : super(key: key);

  @override
  _CaixaLinhaWIdgetState createState() => _CaixaLinhaWIdgetState();
}

class _CaixaLinhaWIdgetState extends State<CaixaLinhaWIdget> {
  @override
  Widget build(BuildContext context) {
    ApplicationResponsiveWidget responsive = ApplicationResponsiveWidget(context);

    return Container(
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 180,
            height: 48,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(80),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: widget.identificador,
              readOnly: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.diagonalPercentual(1.3),
              ),
              onChanged: (text) async {},
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                alignLabelWithHint: true,
                hintStyle: TextStyle(
                  color: Colors.white.withAlpha(180),
                ),
                contentPadding: EdgeInsets.all(responsive.heightPercentual(2.5)),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(
                    color: Colors.white.withAlpha(80),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Visibility(
            visible: (widget.valor.trim() != ''),
            child: Expanded(
              flex: 5,
              child: Container(
                width: 250,
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  initialValue: widget.valor,
                  readOnly: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.diagonalPercentual(1.3),
                  ),
                  onChanged: (text) async {},
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      color: Colors.white.withAlpha(180),
                    ),
                    contentPadding: EdgeInsets.all(responsive.heightPercentual(2.5)),
                    border: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        color: Colors.white.withAlpha(80),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

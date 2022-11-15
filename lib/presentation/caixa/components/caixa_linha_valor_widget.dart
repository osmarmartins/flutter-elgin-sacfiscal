import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdvandroid_flutter/application/commons/widgets/application_responsive_widget.dart';

class CaixaValorWidget extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController valorController;
  const CaixaValorWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.valorController,
  }) : super(key: key);

  @override
  _CaixaValorWidgetState createState() => _CaixaValorWidgetState();
}

class _CaixaValorWidgetState extends State<CaixaValorWidget> {
  late FocusNode valorFocusNode;

  @override
  void initState() {
    valorFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    valorFocusNode.dispose();
    super.dispose();
  }

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
              controller: widget.valorController,
              focusNode: valorFocusNode,
              // autofocus: true,
              textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.diagonalPercentual(1.3),
              ),
              onChanged: (text) async {},
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.dollarSign,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                alignLabelWithHint: true,
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
        ],
      ),
    );
  }
}

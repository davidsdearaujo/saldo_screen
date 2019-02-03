import 'package:flutter/material.dart';

class PopupWidget extends StatefulWidget {
  @override
  _PopupWidgetState createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("NOVIDADES PRA VOCÊ"),
              ),
              Container(width: double.infinity, height: 2, color: Colors.green),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 25),
                    Text(
                      "Você já conhece o aplicativo Minha Conta?",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 75,
                      child: PageView(
                        children: <Widget>[
                          _buildItem(
                            Icons.phonelink_ring,
                            "Nele, você consulta o saldo e faz transferências para o seu cartão pré-pago",
                          ),
                          _buildItem(
                            Icons.credit_card,
                            "Além disso, acompanhe suas vendas e transfira o saldo para sua conta bancária",
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(backgroundColor: Colors.green, radius: 5),
                        SizedBox(width: 5),
                        CircleAvatar(backgroundColor: Colors.grey, radius: 5),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              ListTile(
                title: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text(
                    "Download na Play Store",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 50,
          ),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

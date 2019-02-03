import 'package:desafio20190202/widgets/item-widget.dart';
import 'package:desafio20190202/widgets/popup-widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> listAnimation;
  Animation<double> popupAnimation;
  Animation<double> colorAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      value: 0,
    );

    listAnimation = Tween<double>(
      begin: 0,
      end: -MediaQuery.of(context).size.height * 0.18,
    ).animate(controller);
    popupAnimation = Tween<double>(begin: 260, end: 35).animate(controller);
    colorAnimation = Tween<double>(begin: 0, end: 0.3).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          "Saldo",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: AnimatedBuilder(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("meuTextoFSDAIUDIUASNHFIUASHUIDHJIASJD");
                    },
                    child: ItemWidget(
                      color: Color(0xFF97CCDA),
                      label: "Disponível",
                      value: 0.0,
                    ),
                  ),
                  ItemWidget(
                    color: Color(0xFFEFA300),
                    label: "A receber",
                    value: 0.0,
                  ),
                  ItemWidget(
                    color: Color(0xFFCB3527),
                    label: "Bloqueado",
                    value: 0.0,
                  ),
                  Text(
                    "Última atualização: 27/01/2017 às 22:57",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  Text(
                    "(Saldo sujeito a alterações)",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              animation: listAnimation,
              builder: (context, _child) {
                return Transform.translate(
                  offset: Offset(0, listAnimation.value),
                  child: _child,
                );
              },
            ),
          ),
          AnimatedBuilder(
            animation: colorAnimation,
            builder: (context, _child) {
              return controller.value == 0
                  ? Container()
                  : GestureDetector(
                      onTap: controller.reverse,
                      child: Container(
                        color: Colors.black.withOpacity(colorAnimation.value),
                      ),
                    );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: popupAnimation,
              child: InkWell(
                child: PopupWidget(),
                onTap: () {
                  if (controller.value == 0)
                    controller.forward();
                  else
                    controller.reverse();
                },
              ),
              builder: (context, _child) {
                return Transform.translate(
                  offset: Offset(0, popupAnimation.value),
                  child: _child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

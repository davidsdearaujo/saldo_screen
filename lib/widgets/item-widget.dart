import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Color color;
  final String label;
  final double value;

  const ItemWidget({
    Key key,
    @required this.color,
    @required this.label,
    @required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      height: 100,
      color: Colors.grey[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: this.color,
            width: 5,
            height: 100,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.label),
                  SizedBox(height: 9),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "R\$",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w100,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "${this.value.toStringAsPrecision(3).replaceFirst('.', ',')}",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w100,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

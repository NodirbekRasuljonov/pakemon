import 'package:flutter/material.dart';
import 'package:poxedon/core/constants/constants.dart';

class InfoSpec extends StatelessWidget {
  String type;
  String info;
  InfoSpec({Key? key, required this.type,required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 70.0,
      width: 100.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            type,
            style: TextStyle(color: Colors.black, fontSize: MySize.small),
            textAlign: TextAlign.center,
          ),
          Text(
            info,
            style: TextStyle(
              fontSize: MySize.small,
              color: MyColor.itemtextcategorycolor.withOpacity(0.56),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

import 'package:liuyao/calculate/code_key.dart';
import 'package:liuyao/calculate/data_map.dart';

/// 获取宫卦、主卦、变卦
(String, String, String?) guaHandler(String divination) {
  String gongName = "";
  String zhuName = "";
  String? bianName;

  RegExp regExp = RegExp("^(['\"XO]+)\$");

  List<String> guaNameList = DataMap.liuShiSiGua.keys.toList();

  List<String> newNameList = [];

  for (var i = 0; i < guaNameList.length; i++) {
    if (divination.contains(guaNameList[i])) {
      newNameList.add(guaNameList[i]);
    }
  }

  if (regExp.hasMatch(divination)) {
    String z = "";
    String b = "";
    for (var i = 0; i < 6; i++) {
      if (divination[i] == "'") {
        z += "1";
        b += "1";
      } else if (divination[i] == '"') {
        z += "0";
        b += "0";
      } else if (divination[i] == 'O') {
        z += "1";
        b += "0";
      } else if (divination[i] == 'X') {
        z += "0";
        b += "1";
      }
    }

    zhuName = CodeKey.get64name(z);
    if (z != b) {
      bianName = CodeKey.get64name(b);
    }

    gongName = DataMap.liuShiSiGua[zhuName]["卦宫"];
  } else {
    if (newNameList.length == 1) {
      zhuName = newNameList[0];
      gongName = DataMap.liuShiSiGua[zhuName]["卦宫"];
    } else if (newNameList.length == 2) {
      int indexof1 = divination.indexOf(newNameList[0]);
      int indexof2 = divination.indexOf(newNameList[1]);
      zhuName = indexof1 < indexof2 ? newNameList[0] : newNameList[1];
      bianName = indexof1 > indexof2 ? newNameList[0] : newNameList[1];
      gongName = DataMap.liuShiSiGua[zhuName]["卦宫"];
    }
  }

  // 返回宫卦、主卦、变卦
  return (gongName, zhuName, bianName);
}

import 'package:liuyao/calculate/data_map.dart';
import 'package:liuyao/calculate/gua_handler.dart';
import 'package:liuyao/calculate/gua_model.dart';
import 'package:liuyao/calculate/time_handler.dart';

class LiuYao {
  // 占卜时间 20230825 || 癸卯庚申乙卯
  String time;
  // 占卜卦象 '''''' || XO""'' || 乾 || 乾天
  String divination;
  LiuYao({
    required this.time,
    required this.divination,
  });

  /// 获取卦宫、主卦、变卦  ==> {卦宫：乾，主卦：乾，变卦：坤}
  Map<String, dynamic> getGongZhuBianGua() {
    var gzb = guaHandler(divination);
    return {"卦宫": gzb.$1, "主卦": gzb.$2, "变卦": gzb.$3};
  }

  /// 获取天干时间 ==> {年: 甲子, 月: 甲子, 日: 甲子, 旬空：戌亥}
  Map<String, dynamic> getGanZhiTime() {
    var gzt = timeHandler(time);
    return {"年": gzt.$1, "月": gzt.$2, "日": gzt.$3, "旬空": gzt.$4};
  }

  /// 获取宫卦
  Map<String, dynamic> getGuaGong() {
    // 获取卦宫
    String guaName = getGongZhuBianGua()['卦宫'];
    // 获取卦
    Map guaMap = DataMap.liuShiSiGua[guaName];

    GuaModel guaModel = GuaModel(
      name: guaName,
      code: guaMap['编码'],
      order: guaMap['卦序'],
      up: guaMap['上卦'],
      down: guaMap['下卦'],
      yaoList: _getLiuYao(
          getGanZhiTime()["日"]![0], // 当天天干
          guaMap['纳甲天干'], // 纳甲天干
          guaMap['纳甲地支'], // 纳甲地支
          guaMap['世应下标'], //世应下标
          guaMap['编码'], // 编码
          DataMap.baGua[guaName]["五行"]), // 卦宫属五行
    );
    return guaModel.toJson();
  }

  /// 获取主卦
  Map<String, dynamic> getZhuGua() {
    // 获取卦宫
    String gongName = getGongZhuBianGua()['卦宫'];
    // 获取卦的名字
    String guaName = getGongZhuBianGua()['主卦'];
    // 获取卦
    Map guaMap = DataMap.liuShiSiGua[guaName];

    GuaModel guaModel = GuaModel(
      name: guaName,
      code: guaMap['编码'],
      order: guaMap['卦序'],
      up: guaMap['上卦'],
      down: guaMap['下卦'],
      yaoList: _getLiuYao(
          getGanZhiTime()["日"]![0], // 当天天干
          guaMap['纳甲天干'], // 纳甲天干
          guaMap['纳甲地支'], // 纳甲地支
          guaMap['世应下标'], //世应下标
          guaMap['编码'], // 编码
          DataMap.baGua[gongName]["五行"]), // 卦宫属五行
    );
    return guaModel.toJson();
  }

  /// 获取变卦
  Map<String, dynamic>? getbianGua() {
    // 获取卦宫
    String gongName = getGongZhuBianGua()['卦宫'];
    // 判断是否有变卦
    if (getGongZhuBianGua()['变卦'] == null) return null;
    // 获取卦的名字
    String guaName = getGongZhuBianGua()['变卦'];
    // 获取卦
    Map guaMap = DataMap.liuShiSiGua[guaName];

    GuaModel guaModel = GuaModel(
      name: guaName,
      code: guaMap['编码'],
      order: guaMap['卦序'],
      up: guaMap['上卦'],
      down: guaMap['下卦'],
      yaoList: _getLiuYao(
          getGanZhiTime()["日"]![0], // 当天天干
          guaMap['纳甲天干'], // 纳甲天干
          guaMap['纳甲地支'], // 纳甲地支
          guaMap['世应下标'], //世应下标
          guaMap['编码'], // 编码
          DataMap.baGua[gongName]["五行"]), // 卦宫属五行
    );
    return guaModel.toJson();
  }
}

// 获取六爻数组
// 参数 当天天干、纳甲天干List、纳甲地支List、世应下标List、卦码6位2进制、卦的五行
List<Yao> _getLiuYao(
  String tg,
  List<String> njtg,
  List<String> njdz,
  List syIndex,
  String code64,
  String wuxing,
) {
  List<Yao> yaoList = [];

  for (var i = 0; i < 6; i++) {
    Yao yao = Yao(
      code64[i] == "0" ? false : true,
      njtg[i],
      njdz[i],
      DataMap.diZhi[njdz[i]],
      DataMap.wuXing[wuxing][DataMap.diZhi[njdz[i]]],
      i == syIndex[0] ? true : false,
      i == syIndex[1] ? true : false,
      DataMap.tianGan[tg]['六神'][i],
    );
    yaoList.add(yao);
  }

  return yaoList;
}

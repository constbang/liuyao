class GuaModel {
  /// 卦名
  String name;

  /// 编码
  String code;

  /// 卦序
  int order;

  /// 上卦
  String up;

  /// 下卦
  String down;

  List<Yao> yaoList;

  GuaModel({
    required this.name,
    required this.code,
    required this.order,
    required this.up,
    required this.down,
    required this.yaoList,
  });
  factory GuaModel.fromJson(Map<String, dynamic> json) => GuaModel(
        name: json["卦名"],
        code: json["编码"],
        order: json["顺序"],
        up: json["上卦"],
        down: json["下卦"],
        yaoList: List<Yao>.from(
          json["六爻"].map((x) => Yao.fromJson(x)),
        ),
      );
  Map<String, dynamic> toJson() => {
        "卦名": name,
        "编码": code,
        "顺序": order,
        "上卦": up,
        "下卦": down,
        '六爻': List<dynamic>.from(yaoList.map((x) => x.toJson()))
      };
}

class Yao {
  /// 阴阳
  bool yinYang;

  /// 天干
  String tianGan;

  /// 地支
  String diZhi;

  /// 五行
  String wuXing;

  /// 六亲
  String liuQin;

  /// 世爻
  bool shiYao;

  /// 应爻
  bool yingYao;

  /// 六神
  String liuShen;

  Yao(
    this.yinYang,
    this.tianGan,
    this.diZhi,
    this.wuXing,
    this.liuQin,
    this.shiYao,
    this.yingYao,
    this.liuShen,
  );

  factory Yao.fromJson(Map<String, dynamic> json) => Yao(
        json['阴阳'],
        json['天干'],
        json['地支'],
        json['五行'],
        json['六亲'],
        json['世爻'],
        json['应爻'],
        json['六神'],
      );

  Map<String, dynamic> toJson() => {
        '阴阳': yinYang,
        '天干': tianGan,
        '地支': diZhi,
        '五行': wuXing,
        '六亲': liuQin,
        '世爻': shiYao,
        '应爻': yingYao,
        '六神': liuShen,
      };
}

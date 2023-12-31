/**
 * 八卦编码 乾兑离震巽坎艮坤
 * 64卦编码
 */

/// 第1位初爻，第2位为二爻，第3位为三爻，以此类推

class CodeKey {
  // 根据卦名查询8卦编码
  static String get8code(String name8) => _name8code[name8]!;
  // 根据编码查询8卦名
  static String get8name(String code8) => _code8name[code8]!;
  // 根据卦名查询64卦编码
  static String get64code(String name64) => _name64code[name64]!;
  // 根据编码查询64卦名
  static String get64name(String code64) => _code64name[code64]!;
  // 根据上卦下卦查询64本卦名
  static String getTopBottomName(String topName, String bottomName) =>
      get64name(get8code(bottomName) + get8code(topName));

  // 根据上卦编码下卦编码查询64卦名
  static String getTopBottomCode(String topCode, String bottomCode) =>
      get64name(bottomCode + topCode);

  // 根据64卦查询上卦和下卦
  static List<String> get64nameTopBottom(String name64) {
    // 1、获取编码 2、分上下卦编 3、返回数组
    String code = get64code(name64);
    String topCode = code.substring(3);
    String bottomCode = code.substring(0, 3);
    return [get8name(topCode), get8name(bottomCode)];
  }
}

Map<String, String> _name8code =
    _code8name.map((key, value) => MapEntry(value, key));

Map<String, String> _name64code =
    _code64name.map((key, value) => MapEntry(value, key));

Map<String, String> _code8name = {
  "000": "坤", // 坤为地 坤六段
  "001": "艮", // 艮为山 艮覆碗
  "010": "坎", // 坎为水 坎中满
  "011": "巽", // 巽为风 巽下断
  "100": "震", // 震为雷 震仰盂
  "101": "离", // 离为火 离中虚
  "110": "兑", // 兑为泽 兑上缺
  "111": "乾", // 乾为天 乾三连
};

Map<String, String> _code64name = {
  "000000": "坤", // 坤上坤下 坤为地
  "000001": "剥", // 艮上坤下 山地剥
  "000010": "比", // 坎上坤下 水地比
  "000011": "观", // 巽上坤下 风地观
  "000100": "豫", // 震上坤下 雷地豫
  "000101": "晋", // 离上坤下 火地晋
  "000110": "萃", // 兑上坤下 泽地萃
  "000111": "否", // 乾上坤下 天地否
  "001000": "谦", // 坤上艮下 地山谦
  "001001": "艮", // 艮上艮下 艮为山
  "001010": "蹇", // 坎上艮下 水山蹇
  "001011": "渐", // 巽上艮下 风山渐
  "001100": "小过", // 震上艮下 雷山小过
  "001101": "旅", // 离上艮下 火山旅
  "001110": "咸", // 兑上艮下 泽山咸
  "001111": "遁", // 乾上艮下 天山遁
  "010000": "师", // 坤上坎下 地水师
  "010001": "蒙", // 艮上坎下 山水蒙
  "010010": "坎", // 坎上坎下 坎为水
  "010011": "涣", // 巽上坎下 风水涣
  "010100": "解", // 震上坎下 雷水解
  "010101": "未济", // 离上坎下 火水未济
  "010110": "困", // 兑上坎下 泽水困
  "010111": "讼", // 乾上坎下 天水讼
  "011000": "升", // 坤上巽下 地凤升
  "011001": "蛊", // 艮上巽下 山凤蛊
  "011010": "井", // 坎上巽下 水凤井
  "011011": "巽", // 巽上巽下 巽为凤
  "011100": "恒", // 震上巽下 雷凤恒
  "011101": "鼎", // 离上巽下 火凤鼎
  "011110": "大过", // 兑上巽下 泽凤大过
  "011111": "姤", // 乾上巽下 天凤姤
  "100000": "复", // 坤上震下 地雷复
  "100001": "颐", // 艮上震下 山雷颐
  "100010": "屯", // 坎上震下 水雷屯
  "100011": "益", // 巽上震下 风雷益
  "100100": "震", // 震上震下 震为雷
  "100101": "噬嗑", // 离上震下 火雷噬嗑
  "100110": "随", // 兑上震下 泽雷随
  "100111": "无妄", // 乾上震下 天雷无妄
  "101000": "明夷", // 坤上离下 地火明夷
  "101001": "贲", // 艮上离下 山火贲
  "101010": "既济", // 坎上离下 水火既济
  "101011": "家人", // 巽上离下 风火家人
  "101100": "丰", // 震上离下 雷火丰
  "101101": "离", // 离上离下 离为火
  "101110": "革", // 兑上离下 泽火革
  "101111": "同人", // 乾上离下 天火同人
  "110000": "临", // 坤上兑下 地泽临
  "110001": "损", // 艮上兑下 山泽损
  "110010": "节", // 坎上兑下 水泽节
  "110011": "中孚", // 巽上兑下 风泽中孚
  "110100": "归妹", // 震上兑下 雷泽归妹
  "110101": "睽", // 离上兑下 火泽睽
  "110110": "兑", // 兑上兑下 兑为泽
  "110111": "履", // 乾上兑下 天泽履
  "111000": "泰", // 坤上乾下 地天泰
  "111001": "大畜", // 艮上乾下 山天大畜
  "111010": "需", // 坎上乾下 水天天需
  "111011": "小畜", // 巽上乾下 风天小畜
  "111100": "大壮", // 震上乾下 雷天大壮
  "111101": "大有", // 离上乾下 火天大有
  "111110": "夬", // 兑上乾下 泽天夬
  "111111": "乾", // 乾上乾下 乾为天
};

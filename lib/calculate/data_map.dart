class DataMap {
  /// 天干
  static Map<String, dynamic> get tianGan => _tianGan;

  /// 地支
  static Map<String, dynamic> get diZhi => _diZhi;

  /// 天干地支
  static List<String> get tianGanDiZhi => _tianGuanDiZhi;

  /// 五行
  static Map<String, dynamic> get wuXing => _wuXing;

  /// 八卦
  static Map<String, dynamic> get baGua => _gua8;

  /// 64卦
  static Map<String, dynamic> get liuShiSiGua => _gua64;
}

Map<String, dynamic> _tianGan = {
  "甲": {
    "五行": "木",
    "六神": ["青龙", "朱雀", "勾陈", "腾蛇", "白虎", "玄武"]
  },
  "乙": {
    "五行": "木",
    "六神": ["青龙", "朱雀", "勾陈", "腾蛇", "白虎", "玄武"]
  },
  "丙": {
    "五行": "火",
    "六神": ["朱雀", "勾陈", "腾蛇", "白虎", "玄武", "青龙"]
  },
  "丁": {
    "五行": "火",
    "六神": ["朱雀", "勾陈", "腾蛇", "白虎", "玄武", "青龙"]
  },
  "戊": {
    "五行": "土",
    "六神": ["勾陈", "腾蛇", "白虎", "玄武", "青龙", "朱雀"]
  },
  "己": {
    "五行": "土",
    "六神": ["腾蛇", "白虎", "玄武", "青龙", "朱雀", "勾陈"]
  },
  "庚": {
    "五行": "金",
    "六神": ["白虎", "玄武", "青龙", "朱雀", "勾陈", "腾蛇"]
  },
  "辛": {
    "五行": "金",
    "六神": ["白虎", "玄武", "青龙", "朱雀", "勾陈", "腾蛇"]
  },
  "壬": {
    "五行": "水",
    "六神": ["玄武", "青龙", "朱雀", "勾陈", "腾蛇", "白虎"]
  },
  "癸": {
    "五行": "水",
    "六神": ["玄武", "青龙", "朱雀", "勾陈", "腾蛇", "白虎"]
  }
};
Map<String, dynamic> _diZhi = {
  "子": "水",
  "丑": "土",
  "寅": "木",
  "卯": "木",
  "辰": "土",
  "巳": "火",
  "午": "火",
  "未": "土",
  "申": "金",
  "酉": "金",
  "戌": "土",
  "亥": "水"
};
Map<String, dynamic> _wuXing = {
  "水": {"金": "父母", "土": "官鬼", "水": "兄弟", "火": "妻财", "木": "子孙"},
  "火": {"木": "父母", "水": "官鬼", "火": "兄弟", "金": "妻财", "土": "子孙"},
  "木": {"水": "父母", "金": "官鬼", "木": "兄弟", "土": "妻财", "火": "子孙"},
  "金": {"土": "父母", "火": "官鬼", "金": "兄弟", "木": "妻财", "水": "子孙"},
  "土": {"火": "父母", "木": "官鬼", "土": "兄弟", "水": "妻财", "金": "子孙"}
};
Map<String, dynamic> _gua8 = {
  "乾": {"编码": "111", "内": "甲子", "外": "壬午", "属性": "天", "五行": "金"},
  "兑": {"编码": "110", "内": "丁巳", "外": "丁亥", "属性": "泽", "五行": "金"},
  "离": {"编码": "101", "内": "乙卯", "外": "乙酉", "属性": "火", "五行": "火"},
  "震": {"编码": "100", "内": "庚子", "外": "庚午", "属性": "雷", "五行": "木"},
  "巽": {"编码": "011", "内": "辛丑", "外": "辛未", "属性": "凤", "五行": "木"},
  "坎": {"编码": "010", "内": "戊寅", "外": "戊申", "属性": "水", "五行": "水"},
  "艮": {"编码": "001", "内": "丙辰", "外": "丙戌", "属性": "山", "五行": "土"},
  "坤": {"编码": "000", "内": "乙未", "外": "癸丑", "属性": "地", "五行": "土"}
};
Map<String, dynamic> _gua64 = {
  "乾": {
    "编码": "111111",
    "卦序": 1,
    "上卦": "乾",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "壬", "壬", "壬"],
    "纳甲地支": ["子", "寅", "辰", "午", "申", "戌"],
    "卦宫": "乾",
    "世应下标": [5, 2]
  },
  "坤": {
    "编码": "000000",
    "卦序": 2,
    "上卦": "坤",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "癸", "癸", "癸"],
    "纳甲地支": ["未", "巳", "卯", "丑", "亥", "酉"],
    "卦宫": "坤",
    "世应下标": [5, 2]
  },
  "屯": {
    "编码": "100010",
    "卦序": 3,
    "上卦": "坎",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "戊", "戊", "戊"],
    "纳甲地支": ["子", "寅", "辰", "申", "戌", "子"],
    "卦宫": "坎",
    "世应下标": [1, 4]
  },
  "蒙": {
    "编码": "010001",
    "卦序": 4,
    "上卦": "艮",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "丙", "丙", "丙"],
    "纳甲地支": ["寅", "辰", "午", "戌", "子", "寅"],
    "卦宫": "离",
    "世应下标": [3, 0]
  },
  "需": {
    "编码": "111010",
    "卦序": 5,
    "上卦": "坎",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "戊", "戊", "戊"],
    "纳甲地支": ["子", "寅", "辰", "申", "戌", "子"],
    "卦宫": "坤",
    "世应下标": [3, 0]
  },
  "讼": {
    "编码": "010111",
    "卦序": 6,
    "上卦": "乾",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "壬", "壬", "壬"],
    "纳甲地支": ["寅", "辰", "午", "午", "申", "戌"],
    "卦宫": "离",
    "世应下标": [3, 0]
  },
  "师": {
    "编码": "010000",
    "卦序": 7,
    "上卦": "坤",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "癸", "癸", "癸"],
    "纳甲地支": ["寅", "辰", "午", "丑", "亥", "酉"],
    "卦宫": "坎",
    "世应下标": [2, 5]
  },
  "比": {
    "编码": "000010",
    "卦序": 8,
    "上卦": "坎",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "戊", "戊", "戊"],
    "纳甲地支": ["未", "巳", "卯", "申", "戌", "子"],
    "卦宫": "坤",
    "世应下标": [2, 5]
  },
  "小畜": {
    "编码": "111011",
    "卦序": 9,
    "上卦": "巽",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "辛", "辛", "辛"],
    "纳甲地支": ["子", "寅", "辰", "未", "巳", "卯"],
    "卦宫": "巽",
    "世应下标": [0, 3]
  },
  "履": {
    "编码": "110111",
    "卦序": 10,
    "上卦": "乾",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "壬", "壬", "壬"],
    "纳甲地支": ["巳", "卯", "丑", "午", "申", "戌"],
    "卦宫": "艮",
    "世应下标": [4, 1]
  },
  "泰": {
    "编码": "111000",
    "卦序": 11,
    "上卦": "坤",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "癸", "癸", "癸"],
    "纳甲地支": ["子", "寅", "辰", "丑", "亥", "酉"],
    "卦宫": "坤",
    "世应下标": [2, 5]
  },
  "否": {
    "编码": "000111",
    "卦序": 12,
    "上卦": "乾",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "壬", "壬", "壬"],
    "纳甲地支": ["未", "巳", "卯", "午", "申", "戌"],
    "卦宫": "乾",
    "世应下标": [2, 5]
  },
  "同人": {
    "编码": "101111",
    "卦序": 13,
    "上卦": "乾",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "壬", "壬", "壬"],
    "纳甲地支": ["卯", "丑", "亥", "午", "申", "戌"],
    "卦宫": "离",
    "世应下标": [2, 5]
  },
  "大有": {
    "编码": "111101",
    "卦序": 14,
    "上卦": "离",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "乙", "乙", "乙"],
    "纳甲地支": ["子", "寅", "辰", "酉", "未", "巳"],
    "卦宫": "乾",
    "世应下标": [2, 5]
  },
  "谦": {
    "编码": "001000",
    "卦序": 15,
    "上卦": "坤",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "癸", "癸", "癸"],
    "纳甲地支": ["辰", "午", "申", "丑", "亥", "酉"],
    "卦宫": "兑",
    "世应下标": [4, 1]
  },
  "豫": {
    "编码": "000100",
    "卦序": 16,
    "上卦": "震",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "庚", "庚", "庚"],
    "纳甲地支": ["未", "巳", "卯", "午", "申", "戌"],
    "卦宫": "震",
    "世应下标": [0, 3]
  },
  "随": {
    "编码": "100110",
    "卦序": 17,
    "上卦": "兑",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "丁", "丁", "丁"],
    "纳甲地支": ["子", "寅", "辰", "亥", "酉", "未"],
    "卦宫": "震",
    "世应下标": [2, 5]
  },
  "蛊": {
    "编码": "011001",
    "卦序": 18,
    "上卦": "艮",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "丙", "丙", "丙"],
    "纳甲地支": ["丑", "亥", "酉", "戌", "子", "寅"],
    "卦宫": "巽",
    "世应下标": [2, 5]
  },
  "临": {
    "编码": "110000",
    "卦序": 19,
    "上卦": "坤",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "癸", "癸", "癸"],
    "纳甲地支": ["巳", "卯", "丑", "丑", "亥", "酉"],
    "卦宫": "坤",
    "世应下标": [1, 4]
  },
  "观": {
    "编码": "000011",
    "卦序": 20,
    "上卦": "巽",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "辛", "辛", "辛"],
    "纳甲地支": ["未", "巳", "卯", "未", "巳", "卯"],
    "卦宫": "乾",
    "世应下标": [3, 0]
  },
  "噬嗑": {
    "编码": "100101",
    "卦序": 21,
    "上卦": "离",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "乙", "乙", "乙"],
    "纳甲地支": ["子", "寅", "辰", "酉", "未", "巳"],
    "卦宫": "巽",
    "世应下标": [4, 1]
  },
  "贲": {
    "编码": "101001",
    "卦序": 22,
    "上卦": "艮",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "丙", "丙", "丙"],
    "纳甲地支": ["卯", "丑", "亥", "戌", "子", "寅"],
    "卦宫": "艮",
    "世应下标": [0, 3]
  },
  "剥": {
    "编码": "000001",
    "卦序": 23,
    "上卦": "艮",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "丙", "丙", "丙"],
    "纳甲地支": ["未", "巳", "卯", "戌", "子", "寅"],
    "卦宫": "乾",
    "世应下标": [4, 1]
  },
  "复": {
    "编码": "100000",
    "卦序": 24,
    "上卦": "坤",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "癸", "癸", "癸"],
    "纳甲地支": ["子", "寅", "辰", "丑", "亥", "酉"],
    "卦宫": "坤",
    "世应下标": [0, 3]
  },
  "无妄": {
    "编码": "100111",
    "卦序": 25,
    "上卦": "乾",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "壬", "壬", "壬"],
    "纳甲地支": ["子", "寅", "辰", "午", "申", "戌"],
    "卦宫": "巽",
    "世应下标": [3, 0]
  },
  "大畜": {
    "编码": "111001",
    "卦序": 26,
    "上卦": "艮",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "丙", "丙", "丙"],
    "纳甲地支": ["子", "寅", "辰", "戌", "子", "寅"],
    "卦宫": "艮",
    "世应下标": [1, 4]
  },
  "颐": {
    "编码": "100001",
    "卦序": 27,
    "上卦": "艮",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "丙", "丙", "丙"],
    "纳甲地支": ["子", "寅", "辰", "戌", "子", "寅"],
    "卦宫": "巽",
    "世应下标": [3, 0]
  },
  "大过": {
    "编码": "011110",
    "卦序": 28,
    "上卦": "兑",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "丁", "丁", "丁"],
    "纳甲地支": ["丑", "亥", "酉", "亥", "酉", "未"],
    "卦宫": "震",
    "世应下标": [3, 0]
  },
  "坎": {
    "编码": "010010",
    "卦序": 29,
    "上卦": "坎",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "戊", "戊", "戊"],
    "纳甲地支": ["寅", "辰", "午", "申", "戌", "子"],
    "卦宫": "坎",
    "世应下标": [5, 2]
  },
  "离": {
    "编码": "101101",
    "卦序": 30,
    "上卦": "离",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "乙", "乙", "乙"],
    "纳甲地支": ["卯", "丑", "亥", "酉", "未", "巳"],
    "卦宫": "离",
    "世应下标": [5, 2]
  },
  "咸": {
    "编码": "001110",
    "卦序": 31,
    "上卦": "兑",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "丁", "丁", "丁"],
    "纳甲地支": ["辰", "午", "申", "亥", "酉", "未"],
    "卦宫": "兑",
    "世应下标": [2, 5]
  },
  "恒": {
    "编码": "011100",
    "卦序": 32,
    "上卦": "震",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "庚", "庚", "庚"],
    "纳甲地支": ["丑", "亥", "酉", "午", "申", "戌"],
    "卦宫": "震",
    "世应下标": [2, 5]
  },
  "遁": {
    "编码": "001111",
    "卦序": 33,
    "上卦": "乾",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "壬", "壬", "壬"],
    "纳甲地支": ["辰", "午", "申", "午", "申", "戌"],
    "卦宫": "乾",
    "世应下标": [1, 4]
  },
  "大壮": {
    "编码": "111100",
    "卦序": 34,
    "上卦": "震",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "庚", "庚", "庚"],
    "纳甲地支": ["子", "寅", "辰", "午", "申", "戌"],
    "卦宫": "坤",
    "世应下标": [3, 0]
  },
  "晋": {
    "编码": "000101",
    "卦序": 35,
    "上卦": "离",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "乙", "乙", "乙"],
    "纳甲地支": ["未", "巳", "卯", "酉", "未", "巳"],
    "卦宫": "乾",
    "世应下标": [3, 0]
  },
  "明夷": {
    "编码": "101000",
    "卦序": 36,
    "上卦": "坤",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "癸", "癸", "癸"],
    "纳甲地支": ["卯", "丑", "亥", "丑", "亥", "酉"],
    "卦宫": "坎",
    "世应下标": [3, 0]
  },
  "家人": {
    "编码": "101011",
    "卦序": 37,
    "上卦": "巽",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "辛", "辛", "辛"],
    "纳甲地支": ["卯", "丑", "亥", "未", "巳", "卯"],
    "卦宫": "巽",
    "世应下标": [1, 4]
  },
  "睽": {
    "编码": "110101",
    "卦序": 38,
    "上卦": "离",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "乙", "乙", "乙"],
    "纳甲地支": ["巳", "卯", "丑", "酉", "未", "巳"],
    "卦宫": "艮",
    "世应下标": [3, 0]
  },
  "蹇": {
    "编码": "001010",
    "卦序": 39,
    "上卦": "坎",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "戊", "戊", "戊"],
    "纳甲地支": ["辰", "午", "申", "申", "戌", "子"],
    "卦宫": "兑",
    "世应下标": [3, 0]
  },
  "解": {
    "编码": "010100",
    "卦序": 40,
    "上卦": "震",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "庚", "庚", "庚"],
    "纳甲地支": ["寅", "辰", "午", "午", "申", "戌"],
    "卦宫": "震",
    "世应下标": [1, 4]
  },
  "损": {
    "编码": "110001",
    "卦序": 41,
    "上卦": "艮",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "丙", "丙", "丙"],
    "纳甲地支": ["巳", "卯", "丑", "戌", "子", "寅"],
    "卦宫": "艮",
    "世应下标": [2, 5]
  },
  "益": {
    "编码": "100011",
    "卦序": 42,
    "上卦": "巽",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "辛", "辛", "辛"],
    "纳甲地支": ["子", "寅", "辰", "未", "巳", "卯"],
    "卦宫": "巽",
    "世应下标": [2, 5]
  },
  "夬": {
    "编码": "111110",
    "卦序": 43,
    "上卦": "兑",
    "下卦": "乾",
    "纳甲天干": ["甲", "甲", "甲", "丁", "丁", "丁"],
    "纳甲地支": ["子", "寅", "辰", "亥", "酉", "未"],
    "卦宫": "坤",
    "世应下标": [4, 1]
  },
  "姤": {
    "编码": "011111",
    "卦序": 44,
    "上卦": "乾",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "壬", "壬", "壬"],
    "纳甲地支": ["丑", "亥", "酉", "午", "申", "戌"],
    "卦宫": "乾",
    "世应下标": [0, 3]
  },
  "萃": {
    "编码": "000110",
    "卦序": 45,
    "上卦": "兑",
    "下卦": "坤",
    "纳甲天干": ["乙", "乙", "乙", "丁", "丁", "丁"],
    "纳甲地支": ["未", "巳", "卯", "亥", "酉", "未"],
    "卦宫": "兑",
    "世应下标": [1, 4]
  },
  "升": {
    "编码": "011000",
    "卦序": 46,
    "上卦": "坤",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "癸", "癸", "癸"],
    "纳甲地支": ["丑", "亥", "酉", "丑", "亥", "酉"],
    "卦宫": "震",
    "世应下标": [3, 0]
  },
  "困": {
    "编码": "010110",
    "卦序": 47,
    "上卦": "兑",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "丁", "丁", "丁"],
    "纳甲地支": ["寅", "辰", "午", "亥", "酉", "未"],
    "卦宫": "兑",
    "世应下标": [0, 3]
  },
  "井": {
    "编码": "011010",
    "卦序": 48,
    "上卦": "坎",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "戊", "戊", "戊"],
    "纳甲地支": ["丑", "亥", "酉", "申", "戌", "子"],
    "卦宫": "震",
    "世应下标": [4, 1]
  },
  "革": {
    "编码": "101110",
    "卦序": 49,
    "上卦": "兑",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "丁", "丁", "丁"],
    "纳甲地支": ["卯", "丑", "亥", "亥", "酉", "未"],
    "卦宫": "坎",
    "世应下标": [3, 0]
  },
  "鼎": {
    "编码": "011101",
    "卦序": 50,
    "上卦": "离",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "乙", "乙", "乙"],
    "纳甲地支": ["丑", "亥", "酉", "酉", "未", "巳"],
    "卦宫": "离",
    "世应下标": [1, 4]
  },
  "震": {
    "编码": "100100",
    "卦序": 51,
    "上卦": "震",
    "下卦": "震",
    "纳甲天干": ["庚", "庚", "庚", "庚", "庚", "庚"],
    "纳甲地支": ["子", "寅", "辰", "午", "申", "戌"],
    "卦宫": "震",
    "世应下标": [5, 2]
  },
  "艮": {
    "编码": "001001",
    "卦序": 52,
    "上卦": "艮",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "丙", "丙", "丙"],
    "纳甲地支": ["辰", "午", "申", "戌", "子", "寅"],
    "卦宫": "艮",
    "世应下标": [5, 2]
  },
  "渐": {
    "编码": "001011",
    "卦序": 53,
    "上卦": "巽",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "辛", "辛", "辛"],
    "纳甲地支": ["辰", "午", "申", "未", "巳", "卯"],
    "卦宫": "艮",
    "世应下标": [2, 5]
  },
  "归妹": {
    "编码": "110100",
    "卦序": 54,
    "上卦": "震",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "庚", "庚", "庚"],
    "纳甲地支": ["巳", "卯", "丑", "午", "申", "戌"],
    "卦宫": "兑",
    "世应下标": [2, 5]
  },
  "丰": {
    "编码": "101100",
    "卦序": 55,
    "上卦": "震",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "庚", "庚", "庚"],
    "纳甲地支": ["卯", "丑", "亥", "午", "申", "戌"],
    "卦宫": "坎",
    "世应下标": [4, 1]
  },
  "旅": {
    "编码": "001101",
    "卦序": 56,
    "上卦": "离",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "乙", "乙", "乙"],
    "纳甲地支": ["辰", "午", "申", "酉", "未", "巳"],
    "卦宫": "离",
    "世应下标": [0, 3]
  },
  "巽": {
    "编码": "011011",
    "卦序": 57,
    "上卦": "巽",
    "下卦": "巽",
    "纳甲天干": ["辛", "辛", "辛", "辛", "辛", "辛"],
    "纳甲地支": ["丑", "亥", "酉", "未", "巳", "卯"],
    "卦宫": "巽",
    "世应下标": [5, 2]
  },
  "兑": {
    "编码": "110110",
    "卦序": 58,
    "上卦": "兑",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "丁", "丁", "丁"],
    "纳甲地支": ["巳", "卯", "丑", "亥", "酉", "未"],
    "卦宫": "兑",
    "世应下标": [5, 2]
  },
  "涣": {
    "编码": "010011",
    "卦序": 59,
    "上卦": "巽",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "辛", "辛", "辛"],
    "纳甲地支": ["寅", "辰", "午", "未", "巳", "卯"],
    "卦宫": "离",
    "世应下标": [4, 1]
  },
  "节": {
    "编码": "110010",
    "卦序": 60,
    "上卦": "坎",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "戊", "戊", "戊"],
    "纳甲地支": ["巳", "卯", "丑", "申", "戌", "子"],
    "卦宫": "坎",
    "世应下标": [0, 3]
  },
  "中孚": {
    "编码": "110011",
    "卦序": 61,
    "上卦": "巽",
    "下卦": "兑",
    "纳甲天干": ["丁", "丁", "丁", "辛", "辛", "辛"],
    "纳甲地支": ["巳", "卯", "丑", "未", "巳", "卯"],
    "卦宫": "艮",
    "世应下标": [3, 0]
  },
  "小过": {
    "编码": "001100",
    "卦序": 62,
    "上卦": "震",
    "下卦": "艮",
    "纳甲天干": ["丙", "丙", "丙", "庚", "庚", "庚"],
    "纳甲地支": ["辰", "午", "申", "午", "申", "戌"],
    "卦宫": "兑",
    "世应下标": [3, 0]
  },
  "既济": {
    "编码": "101010",
    "卦序": 63,
    "上卦": "坎",
    "下卦": "离",
    "纳甲天干": ["乙", "乙", "乙", "戊", "戊", "戊"],
    "纳甲地支": ["卯", "丑", "亥", "申", "戌", "子"],
    "卦宫": "坎",
    "世应下标": [2, 5]
  },
  "未济": {
    "编码": "010101",
    "卦序": 64,
    "上卦": "离",
    "下卦": "坎",
    "纳甲天干": ["戊", "戊", "戊", "乙", "乙", "乙"],
    "纳甲地支": ["寅", "辰", "午", "酉", "未", "巳"],
    "卦宫": "离",
    "世应下标": [2, 5]
  }
};

List<String> _tianGuanDiZhi = [
  "甲子",
  "乙丑",
  "丙寅",
  "丁卯",
  "戊辰",
  "己巳",
  "庚午",
  "辛未",
  "壬申",
  "癸酉",
  "甲戌",
  "乙亥",
  "丙子",
  "丁丑",
  "戊寅",
  "己卯",
  "庚辰",
  "辛巳",
  "壬午",
  "癸未",
  "甲申",
  "乙酉",
  "丙戌",
  "丁亥",
  "戊子",
  "己丑",
  "庚寅",
  "辛卯",
  "壬辰",
  "癸巳",
  "甲午",
  "乙未",
  "丙申",
  "丁酉",
  "戊戌",
  "己亥",
  "庚子",
  "辛丑",
  "壬寅",
  "癸卯",
  "甲辰",
  "乙巳",
  "丙午",
  "丁未",
  "戊申",
  "己酉",
  "庚戌",
  "辛亥",
  "壬子",
  "癸丑",
  "甲寅",
  "乙卯",
  "丙辰",
  "丁巳",
  "戊午",
  "己未",
  "庚申",
  "辛酉",
  "壬戌",
  "癸亥"
];
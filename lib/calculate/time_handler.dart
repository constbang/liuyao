import 'package:liuyao/calculate/data_map.dart';

// 返回：干支年、支月、干支日、旬空
(String?, String?, String?, String?) timeHandler(String time) {
  RegExp regExp = RegExp("^\\d{8}\$");
  if (regExp.hasMatch(time)) {
    // 输入的时间戳
    int sjc = DateTime.parse(time).millisecondsSinceEpoch;
    // 1970年1月2日0分零秒 为壬午日
    // int sjc1970 = DateTime.parse("1970-01-02 00:00:00").millisecondsSinceEpoch;
    // 1901年1月4日0分零秒 为壬午日
    int sjc1970 = DateTime.parse("1901-01-04 00:00:00").millisecondsSinceEpoch;
    // 相差天数
    int day = (sjc - sjc1970) ~/ (1000 * 60 * 60 * 24);

    int index = (day + DataMap.tianGanDiZhi.indexOf('壬午')) % 60;
    String ganZhiRi = DataMap.tianGanDiZhi[index];

    var nianYue = _getDiZhiNianYue(DateTime.parse(time));

    return (nianYue.$1, nianYue.$2, ganZhiRi, _xunKong(ganZhiRi));
  }

  // 给时时间前后家一个字符
  String myTime = "。$time。";
  List<int> indexList = []; // 地支出现的下标
  for (var i = 0; i < myTime.length; i++) {
    if (DataMap.diZhi.keys.contains(myTime[i])) {
      indexList.add(i);
    }
  }
  String? nian;
  String? yue;
  String? ri;
  for (var i = 0; i < indexList.length; i++) {
    var index = indexList[i];
    if (myTime[indexList[i] + 1] == "年") {
      if (DataMap.tianGanDiZhi.contains(myTime[index - 1] + myTime[index])) {
        nian = myTime[index - 1] + myTime[index];
      } else {
        nian = myTime[index];
      }
    }
    if (myTime[index + 1] == "月") {
      if (DataMap.tianGanDiZhi.contains(myTime[index - 1] + myTime[index])) {
        yue = myTime[index - 1] + myTime[index];
      } else {
        yue = myTime[index];
      }
    }
    if (myTime[index + 1] == "日") {
      if (DataMap.tianGanDiZhi.contains(myTime[index - 1] + myTime[index])) {
        ri = myTime[index - 1] + myTime[index];
      }
    }
  }

  return (nian, yue, ri, ri == null ? null : _xunKong(ri));
}

// 获取干支年、地支月
(String, String) _getDiZhiNianYue(DateTime dateTime) {
  // Map diZhiYue = {
  // "立春": _sum(dateTime, "立春"), //寅月
  // "惊蛰": _sum(dateTime, "惊蛰"), //卯月
  // "清明": _sum(dateTime, "清明"), //辰月
  // "立夏": _sum(dateTime, "立夏"), //巳月
  // "芒种": _sum(dateTime, "芒种"), //午月
  // "小暑": _sum(dateTime, "小暑"), //未月
  // "立秋": _sum(dateTime, "立秋"), //申月
  // "白露": _sum(dateTime, "白露"), //酉月
  // "寒露": _sum(dateTime, "寒露"), //戌月
  // "立冬": _sum(dateTime, "立冬"), //亥月
  // "大雪": _sum(dateTime, "大雪"), //子月
  // "小寒": _sum(dateTime, "小寒"), //丑月
  // };

  // 地支
  List diZhi = ["寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥", "子", "丑"];
  List yueGan = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];

  // 地支月时间戳
  List<int> diZhiYue = [
    _sum(dateTime, "立春"),
    _sum(dateTime, "惊蛰"),
    _sum(dateTime, "清明"),
    _sum(dateTime, "立夏"),
    _sum(dateTime, "芒种"),
    _sum(dateTime, "小暑"),
    _sum(dateTime, "立秋"),
    _sum(dateTime, "白露"),
    _sum(dateTime, "寒露"),
    _sum(dateTime, "立冬"),
    _sum(dateTime, "大雪"),
    _sum(dateTime, "小寒"),
  ];
  // 如果时间小于立春，那么就是去年丑月
  // 如果时间大于立春，那么就依次对比
  // 年的公式，天干=（年份-3）/10的余数对应的天干；
  // 年的公式，地支=（年份-3）/12的余数对应的地支。

  // 年干支 月支 月干
  String ngz = "";
  String yz = "";
  String yg = "";
  // 冒泡排序diZhiYue
  for (int i = 0; i < diZhiYue.length - 1; i++) {
    for (int j = 0; j < diZhiYue.length - 1 - i; j++) {
      if (diZhiYue[j] > diZhiYue[j + 1]) {
        int temp = diZhiYue[j];
        diZhiYue[j] = diZhiYue[j + 1];
        diZhiYue[j + 1] = temp;

        String temp2 = diZhi[j];
        diZhi[j] = diZhi[j + 1];
        diZhi[j + 1] = temp2;
      }
    }
  }
  // 判断时间获取干支
  for (var i = 0; i < 12; i++) {
    if (dateTime.millisecondsSinceEpoch >= diZhiYue[i]) {
      ngz = _getYearGanZhi(dateTime.year);
      var ygIndex = ((dateTime.year % 10 + 2) * 2 + i - 1) % 10;
      yg = yueGan[ygIndex];
      yz = diZhi[i];
    }
  }

  // 如果 时间立春前面：年干支为上一年 否则为本年

  // 获取寅月的下标
  if (dateTime.millisecondsSinceEpoch < diZhiYue[diZhi.indexOf("寅")]) {
    ngz = _getYearGanZhi(dateTime.year - 1);
  }

  return (ngz, yg + yz);
}

// 计算寿星公式，返回时间戳
int _sum(DateTime dateTime, String name) {
  // 获取年
  int year = dateTime.year;

  // 判断世纪 ture：21世纪、false：20世纪
  bool sj = year > 2000;

  // 取年的后两位
  int y = double.parse(year.toString().substring(2)).toInt();

  // 要减去的L 如果小寒大寒立春雨水 那么L为：(y - 1) ~/ 4
  int l = _special2.contains(name) ? (y - 1) ~/ 4 : y ~/ 4;

  // 要假的D值
  double d = 0.2422;

  // 获取C值
  double c = sj ? _jq24[name]["C21"] : _jq24[name]["C20"];

  // 如果是2000年 并且小寒大寒立春雨水 那么按20世纪的算
  // if (year == 2000 && _special2.contains(name)) {
  //   c = _jq24[name]["C20"];
  // }
  // 计算  [Y×D+C]-L
  var day = (y * d + c - l).toInt();
  if (_special1.containsKey(year)) {
    Map<String, int> map = _special1[year];
    if (map.containsKey(name)) {
      day = map[name]! + day;
    }
  }

  int month = _jq24[name]["M"];

  String monthString = month < 10 ? "0$month" : "$month";
  String dayString = day < 10 ? "0$day" : "$day";

  return DateTime.parse("$year$monthString$dayString").millisecondsSinceEpoch;
}

// 特殊情况1
Map<int, dynamic> _special1 = {
  2026: {"雨水": -1},
  2084: {"春风": 1},
  1911: {"立夏": 1},
  2008: {"小满": 1},
  1902: {"芒种": 1},
  1928: {"夏至": 1},
  1925: {"小暑": 1},
  2016: {"小暑": 1},
  1922: {"大暑": 1},
  2002: {"立秋": 1},
  1927: {"白露": 1},
  1942: {"秋分": 1},
  2089: {"霜降": 1, "立冬": 1},
  1978: {"小雪": 1},
  1954: {"大雪": 1},
  1918: {"冬至": -1},
  2021: {"冬至": -1},
  1982: {"小寒": 1},
  2019: {"小寒": -1},
  2000: {"大寒": 1},
  2082: {"大寒": 1},
};

// 特殊情况  小寒、大寒、立春、雨水、
// 2000年按20世纪计算
// 任意年 L = (Y-1)~/4
List<String> _special2 = ["小寒", "大寒", "立春", "雨水"];

/// [Y×D+C]-L
/// Y:年的后两位
/// D:0.2422
/// C：c值
/// L=Y/4
Map<String, dynamic> _jq24 = {
  "立春": {"C20": 4.6295, "C21": 3.87, "M": 2},
  "惊蛰": {"C20": 6.3826, "C21": 5.63, "M": 3},
  "清明": {"C20": 5.59, "C21": 4.81, "M": 4},
  "立夏": {"C20": 6.318, "C21": 5.52, "M": 5},
  "芒种": {"C20": 6.5, "C21": 5.678, "M": 6},
  "小暑": {"C20": 7.928, "C21": 7.108, "M": 7},
  "立秋": {"C20": 28.35, "C21": 7.5, "M": 8},
  "白露": {"C20": 8.44, "C21": 7.646, "M": 9},
  "寒露": {"C20": 9.098, "C21": 8.318, "M": 10},
  "立冬": {"C20": 8.218, "C21": 7.438, "M": 11},
  "大雪": {"C20": 7.9, "C21": 7.18, "M": 12},
  "小寒": {"C20": 6.11, "C21": 5.4055, "M": 1},
};

// 根据年份获取干支
String _getYearGanZhi(int year) {
  // 年的公式，天干=（年份-3）/10的余数对应的天干；
  // 年的公式，地支=（年份-3）/12的余数对应的地支。
  var gan = (year - 3) % 10;
  var zhi = (year - 3) % 12;
  String tg = "癸甲乙丙丁戊己庚辛壬";
  String dz = "亥子丑寅卯辰巳午未申酉戌";
  return tg[gan] + dz[zhi];
}

// 更加天干地支获取旬空
String _xunKong(String ganZhi) {
  String xk = "";
  int index = DataMap.tianGanDiZhi.indexOf(ganZhi);
  for (var i = index; i < DataMap.tianGanDiZhi.length; i++) {
    if (DataMap.tianGanDiZhi[i][0] == "癸") {
      if (i == 59) {
        xk = "子丑";
        return xk;
      }
      xk = DataMap.tianGanDiZhi[i + 1][1] + DataMap.tianGanDiZhi[i + 2][1];
      return xk;
    }
  }
  print(xk);
  return xk;
}

import 'dart:convert';
import 'package:liuyao/calculate/data_map.dart';
import 'package:liuyao/liuyao.dart';
import 'package:test/test.dart';

void main() {
  // 输入卦主卦变卦简单测试
  test('输入文字。返回主卦、变卦、卦宫', () {
    LiuYao liuYao = LiuYao(divination: '乾为天坤为低', time: '');
    print(liuYao.getGongZhuBianGua());
    expect(
      jsonEncode(liuYao.getGongZhuBianGua()),
      '{"卦宫":"乾","主卦":"乾","变卦":"坤"}',
    );
  });
  // 根据卦名 卦A卦B或者卦A 所以的卦象进行测试
  test('a卦b卦||a卦。返回主卦、变卦、卦宫 ', () {
    List<String> gua64 = DataMap.liuShiSiGua.keys.toList();
    List<String> list = [];
    for (var i = 0; i < 64; i++) {
      for (var j = 0; j < 64; j++) {
        if (gua64[i] == gua64[j]) {
          list.add(gua64[i]);
        } else {
          list.add(gua64[i] + gua64[j]);
        }
      }
    }
    for (var i = 0; i < list.length; i++) {
      // 兑为泽变乾为天
      LiuYao liuYao = LiuYao(divination: list[i], time: '');
      print(jsonEncode(liuYao.getGongZhuBianGua()));
    }
    expect(true, true);
  });
  // 根据编码进行宫主变测试
  test('输入编码。返回主卦、变卦、卦宫', () {
    // 64的平方4096
    String string = '\'"XO';
    List<String> arr = [];
    for (var a = 0; a < 4; a++) {
      String aa = string[a];
      for (var b = 0; b < 4; b++) {
        String bb = string[b];
        for (var c = 0; c < 4; c++) {
          String cc = string[c];
          for (var d = 0; d < 4; d++) {
            String dd = string[d];
            for (var e = 0; e < 4; e++) {
              String ee = string[e];
              for (var f = 0; f < 4; f++) {
                String ff = string[f];
                arr.add([aa, bb, cc, dd, ee, ff].join());
              }
            }
          }
        }
      }
    }
    for (var i = 0; i < arr.length; i++) {
      LiuYao liuYao = LiuYao(divination: arr[i], time: '');
      print(jsonEncode(liuYao.getGongZhuBianGua()));
    }
    expect(true, true);
  });

  // 时间测试
  test('输入时间测试', () {
    LiuYao liuYao = LiuYao(divination: '', time: '20230204');
    print(jsonEncode(liuYao.getGanZhiTime()));
    expect(true, true);
  });
  // 时间测试
  test('输入干支时间测试', () {
    LiuYao liuYao = LiuYao(divination: '', time: '甲子年丑月丙寅日');
    print(jsonEncode(liuYao.getGanZhiTime()));
    expect(true, true);
  });

  test('卦', () {
    // 输入时间和卦象
    // 输入时间和卦象
    LiuYao liuYao = LiuYao(divination: 'OO\'"\'\'', time: '20230913');
    Map time = liuYao.getGanZhiTime();
    Map gong = liuYao.getGuaGong();
    Map zhu = liuYao.getZhuGua();
    Map? bian = liuYao.getbianGua();

    // 主卦六神
    List list1 = List.from(zhu['六爻'].map((e) => e['六神'] + '　'));
    // 主卦六亲、地支、五行、爻、世应
    List list2 = List.from(zhu['六爻'].map((e) {
      String shiYao = e['世爻'] ? '世' : '';
      String yingYao = e['应爻'] ? '应' : '';
      String shiYing = (shiYao + yingYao).isEmpty ? '　' : shiYao + yingYao;
      return "　${e['六亲']}${e['地支']}${e['五行']}　${e['阴阳'] ? '---' : '- -'}$shiYing";
    }));
    // 卦宫六亲、地支、五行
    List? list3;
    // 判断六亲是否都存在
    List<String> liuQins = List.from(zhu['六爻'].map((e) => e['六亲']));
    bool flag = liuQins.toSet().toList().length == 5;
    if (flag) {
      list3 = null;
    } else {
      list3 = List.from(gong['六爻'].map((e) {
        String str = "${e['六亲']}${e['地支']}${e['五行']}";
        return liuQins.contains(e['六亲']) ? "　　　　" : str;
      }));
    }
    // 变卦六亲、地支、五行、爻、
    List? list4;
    if (bian == null) {
      list4 = null;
    } else {
      list4 = List.from(bian['六爻'].map((e) {
        return "　${e['六亲']}${e['地支']}${e['五行']}　${e['阴阳'] ? '---' : '- -'}";
      }));
    }
    // 六爻字符串拼接
    String ly = '';
    for (var i = 5; i > -1; i--) {
      ly +=
          "${list1[i]}${list3 == null ? '' : list3[i]}${list2[i]}${list4 == null ? '' : list4[i]}\n";
    }
    print("${time['年']}年${time['月']}月${time['日']}日（${time['旬空']}）旬空");
    print(
        "得（${gong['卦名']}宫) ${zhu['卦名']}${bian == null ? '' : '之'}${bian == null ? '' : bian['卦名']} ");
    print(ly);
    expect(true, true);
  });
}

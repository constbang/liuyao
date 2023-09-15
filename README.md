# 六爻装卦

liuyao是一款无第三方依赖的装卦工具。根据《易经》六爻装卦理论，通过输入时间和已有的卦象，自动生成主卦、变卦、卦宫。包括纳甲装六神、配六亲、按适应等

## 示例

    import 'package:liuyao/liuyao.dart';
     
    void main() {
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
        ly +="${list1[i]}${list3 == null ? '' : list3[i]}${list2[i]}${list4 == null ? '' : list4[i]}\n";
      }
      print("${time['年']}年${time['月']}月${time['日']}日（${time['旬空']}）旬空");
      print("得（${gong['卦名']}宫) ${zhu['卦名']}${bian == null ? '' : '之'}${bian == null ? '' : bian['卦名']} ");
      print(ly);
   
    }
输出结果

    癸卯年辛酉月甲戌日（申酉）旬空
    得（巽宫) 小畜之渐 
    玄武　　　　　　兄弟卯木　---　　兄弟卯木　---
    白虎　　　　　　子孙巳火　---　　子孙巳火　---
    腾蛇　　　　　　妻财未土　- -应　妻财未土　- -
    勾陈　官鬼酉金　妻财辰土　---　　官鬼申金　---
    朱雀　　　　　　兄弟寅木　---　　子孙午火　- -
    青龙　　　　　　父母子水　---世　妻财辰土　- -

## 参数说明

- 时间格式支持
  - "20120227"
  - （干支）年（干支）月（干支）日
  - （支）月（干支）日
- 占卦格式支持
  - ''XO""（少阴、少阳、老阴、老阳 6位）
  - ??卦??（？：其它字符，卦：卦名）
  - ??卦1??卦2??（？：其它字符，卦1：本卦名，卦2：变卦名）

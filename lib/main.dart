import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
 
void main(){
  runApp(GyulHapMain());
}

// List<String> gameMaker(){
//   List<String> data = new List(9);
//   var number = ['000', '001', '002', '010', '011', '012', '020', '021', '022', 
//                 '100', '101', '102', '110', '111', '112', '120', '121', '122', 
//                 '200', '201', '202', '210', '211', '212', '220', '221', '222'];

//   /* 난수생성 */
//   for(int i=0; i<9; i++){
//     int idx = Random().nextInt(27); // 0~26
//     data[i] = number[idx];
//     for(int j=0; j<i; j++){
//       if(data[j]==data[i]){
//         i--;
//       }
//     }
//   }
//   return data;
// }

Map<String,List<String>> gameMaker(){
  Map<String,List<String>> dataSet = {'data':[], 'ansList':[]};
  List<String> data = new List(9);
  var number = ['000', '001', '002', '010', '011', '012', '020', '021', '022', 
                '100', '101', '102', '110', '111', '112', '120', '121', '122', 
                '200', '201', '202', '210', '211', '212', '220', '221', '222'];             

  /* 문제data생성 */
  for(int i=0; i<9; i++){
    int idx = Random().nextInt(27); // 0~26
    data[i] = number[idx];
    for(int j=0; j<i; j++){
      if(data[j]==data[i]){
        i--;
      }
    }
  }
  print(data);
  dataSet['data'] = data;
  
  List<String> ansList = []; /* 여러개의 answer 저장 */
  String answer;

  /* 정답생성 */
  for(int a=0; a<9; a++){
    for(int b=a+1; b<9; b++){
      for(int c=b+1; c<9; c++){
        int val = 0;
        for(int i=0; i<3; i++){
          val += int.tryParse(data[a].substring(i,i+1))+int.tryParse(data[b].substring(i,i+1))+int.tryParse(data[c].substring(i,i+1));
          if(val%3!=0) break;
        }
        if(val%3==0){
          answer = (a+1).toString()+(b+1).toString()+(c+1).toString(); /* 이미지의 숫자인덱스(1, 2, ..., 9) */
          ansList.add(answer);
        }
      }
    }
  }

  int hapCnt = ansList.length; /* 합의 갯수 */
  print('합의갯수: $hapCnt');
  dataSet['ansList'] = ansList; /* 정답리스트 */
  print(dataSet);
  return dataSet;
}

class GyulHapMain extends StatefulWidget {
  @override
  _GyulHapMainState createState() => _GyulHapMainState();
}

class _GyulHapMainState extends State<GyulHapMain> {

  Map<String,List<String>> gamePanel = gameMaker();
  //print(gamePanel);
  //print(ansList);
  List<bool> isCheck = [false,false,false,false,false,false,false,false,false];
  int checkCnt = 0;

  int funcCellChecked(int n){
    int cellNo = n;
    setState(() {
      if(checkCnt<3 && checkCnt>=0){
        isCheck[cellNo-1] = !isCheck[cellNo-1]; 
        isCheck[cellNo-1]?checkCnt++:checkCnt--; 
        print(checkCnt);
      }else{
        if(isCheck[cellNo-1]==true){
          isCheck[cellNo-1]=false;
          checkCnt--;
        } else print('Message: 3개까지만 선택할 수 있습니다. $checkCnt');
      }
    });
    return 0;
  }

  @override
  Widget build(BuildContext context) {

    List<String> data = new List(9);
    data = gamePanel['data'];
    List<String> ansList = new List(9); 
    ansList = gamePanel['ansList'];
    
    return MaterialApp(
      title: 'Title test',
      home: Scaffold(
        body: 
        GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            FlatButton( /* 1 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[0] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[0]}.jpg'),),), 
                //onPressed: () => setState(() {isCheck[0] = !isCheck[0]; isCheck[0]?checkCnt++:checkCnt--; print(checkCnt);}),
                onPressed:(){funcCellChecked(1);},
            ),
            FlatButton( /* 2 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[1] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[1]}.jpg'),),), 
                onPressed:(){funcCellChecked(2);},
            ),
            FlatButton( /* 3 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[2] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[2]}.jpg'),),), 
                onPressed:(){funcCellChecked(3);},
            ),
            FlatButton( /* 4 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[3] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[3]}.jpg'),),), 
                onPressed:(){funcCellChecked(4);},
            ),
            FlatButton( /* 5 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[4] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[4]}.jpg'),),), 
                onPressed:(){funcCellChecked(5);},
            ),
            FlatButton( /* 6 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[5] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[5]}.jpg'),),), 
                onPressed:(){funcCellChecked(6);},
            ),
            FlatButton( /* 7 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[6] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[6]}.jpg'),),), 
                onPressed:(){funcCellChecked(7);},
            ),
            FlatButton( /* 8 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[7] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[7]}.jpg'),),), 
                onPressed:(){funcCellChecked(8);},
            ),
            FlatButton( /* 9 */ 
              padding: EdgeInsets.fromLTRB(2.5,2.5,2.5,2.5), color: Colors.teal,
              child: 
                Center(child: AnimatedOpacity(opacity: isCheck[8] ? 0.3 : 1.0, duration: Duration(milliseconds: 100), child: Image.asset('assets/${data[8]}.jpg'),),), 
                onPressed:(){funcCellChecked(9);},
            ),
          ]
        ),
      ),
    );
  }
}



// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     Map<String,List<String>> gamePanel = gameMaker();
//     print(gamePanel);
//     List<String> data = new List(9);
//     data = gamePanel['data'];
//     List<String> ansList = new List(9); 
//     ansList = gamePanel['ansList'];
//     //print(ansList);

//     double opacityValue = 1.0;

//     return MaterialApp(
//       title: 'Title test',
//       home: Scaffold(
//         body: 
//         GridView.count(
//           crossAxisCount: 3,
//           children: <Widget>[
//             FlatButton( /* 1 */
//               padding: EdgeInsets.zero,
//               child: 
//                 Center(child: Image.asset('assets/${data[0]}.jpg'),), 
//                 onPressed: () => setState((){
//                   opacityValue = 1.0;
//                 }),
//             ),
//             FlatButton(child: Center(child: Image.asset('assets/${data[1]}.jpg'),), onPressed: () => print('2'),),
//             Container(child: Center(child: Image.asset('assets/${data[2]}.jpg'),)),
//             Container(child: Center(child: Image.asset('assets/${data[3]}.jpg'),)),
//             Container(child: Center(child: Image.asset('assets/${data[4]}.jpg'),)),
//             Container(child: Center(child: Image.asset('assets/${data[5]}.jpg'),)),
//             Container(child: Center(child: Image.asset('assets/${data[6]}.jpg'),)),
//             Container(child: Center(child: Image.asset('assets/${data[7]}.jpg'),)),
//             Container(child: Center(child: Image.asset('assets/${data[8]}.jpg'),)),
//           ]
//         ),
//       ),
//     );
//   }
// }
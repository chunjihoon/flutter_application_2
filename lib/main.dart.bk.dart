/* 자기소개 화면 */

import 'package:flutter/material.dart';
 
void main(){
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection=Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '천지훈 (Chun Ji Hun)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                 '프로그래머, 경력:2019.07~',
                 style: TextStyle(
                   color: Colors.grey[700],
                 ),
                ),
              ],
            ),
          ),
          Icon(Icons.star,
            color: Colors.red[500],
          ),
          Text('30'),
        ],
      ),
    );
 
    //Color color=Theme.of(context).primaryColor;
 
    Widget buttonSection=Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(Colors.deepOrange, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.deepOrange, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.deepOrange, Icons.share, 'SHARE'),
        ],
      ),
    );
 
    Widget textSection=Container(
      padding: const EdgeInsets.all(35),
      child: Text(
            '경력 1년 6개월차 프로그래머 천지훈입니다. '
            '주 사용기술은 C/C++(Pro C), SQL(Oracle) 입니다. '
            '이 외에 Java, javascript, Node.js, Python, Flutter, MariaDB 등을 사용하여 '
            '프로젝트를 진행한 경험이 있습니다.',
        softWrap: true,
      ),
    );
 
    return MaterialApp(
      title: 'Title test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Introduce for Myself'),
          backgroundColor: Colors.deepOrange,
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('assets/2019jihun_small_darker.png',
              width: 600,
              height: 240,
              fit: BoxFit.scaleDown,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
 
  Column _buildButtonColumn(Color color, IconData icon, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
          ),
        ),
      ],
    );
  }
}
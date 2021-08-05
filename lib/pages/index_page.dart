import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'system_page.dart';
import 'project_page.dart';
import 'public_page.dart';
import 'my_page.dart';

class IndexPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }


}


class _IndexPageState extends State<IndexPage> {


  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.alarm),
      label: "公众号",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.calendar),
      label: "体系",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.ticket),
      label: "项目",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.mail),
      label: "我的",
    )
  ];

  int currentIndx = 0;
  var currentPage;

  final List tabBodies = [
    HomePage(),
    PublicPage(),
    SystemPage(),
    ProjectPage(),
    MyPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndx,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndx = index;
            currentPage = tabBodies[index];
          });
        },
      ),
    );
  }
  @override
  void initState() {
    currentPage = tabBodies[currentIndx];
    super.initState();
  }

}



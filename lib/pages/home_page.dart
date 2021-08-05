import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = "欢迎来到WanAndroid";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "类型",
                    helperText: "请输入你喜欢的类型"),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: () {
                  getHttp().then((value){
                    setState(() {
                      showText = value;
                    });
                  });
                },
                child: Text("确定"),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future getHttp() async{
    try{
      Response response = await Dio().get("https://www.wanandroid.com/article/list/1/json");
      return response.data.toString();
    }catch(e){
      return e.toString();
    }
  }
}

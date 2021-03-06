import 'package:flutter/material.dart';
import 'package:flutter_share/refreshData/refresh_data.dart';
import 'package:flutter_share/stateManager/models/cart.dart';
import 'package:flutter_share/stateManager/models/catalog.dart';
import 'package:flutter_share/stateManager/screens/cart.dart';
import 'package:flutter_share/stateManager/screens/catalog.dart';
import 'package:provider/provider.dart';

import 'animatedIcon/AnimatedIconPage.dart';
import 'animatedSwitcher/AnimatedSwitcherCounterRoute.dart';
import 'flutterSearch/searchbarview.dart';
import 'nestedScrollView/DemoOne.dart';
import 'nestedScrollView/DemoTwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


 /*   return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
*/
    ///MultiProvider 可以提供多个 model
    return MultiProvider(
      providers: [
        ///不变的数据类型，使用 model 就足够了
        Provider(builder: (context) => CatalogModel()),

        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            builder: (context, catalog, previousCart) =>
                CartModel(catalog, previousCart)),
      ],

      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/catalog': (context) => MyCatalog(),    ///类别
          '/cart': (context) => MyCart(),
        },
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );





  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:     ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[

      FlatButton(
      color: Colors.blue,
        highlightColor: Colors.blue[700],
        colorBrightness: Brightness.dark,
        splashColor: Colors.grey,
        child: Text("下拉刷新上滑加载数据"),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: () {
          //导航到新路由
          Navigator.push( context,
              new MaterialPageRoute(builder: (context) {
                return new RefreshDataPage();
              }));
          //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

        },

      ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("NestedScrollViewDemo"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new NestedScrollViewDemoOne();
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },

          ),


          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("全局状态管理"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {

              Navigator.pushNamed(context, "/catalog");



            },

          ),


          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Flutter 搜索页面"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new SearchBarView();
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },

          ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Flutter AnimatedIcon "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new AnimatedIconPage();
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },

          ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Flutter AnimatedSwitcher Demo "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: AnimatedSwitcherCounterRoute(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },

          ),





        ]
    )
    );
  }


}

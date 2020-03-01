import 'package:flutter/material.dart';

class Demo extends MaterialPageRoute<Null> {
  Demo() : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('TeleMRT - Демо'),
      ),
      body: Container(
        color: Colors.indigo,
        child: Center(

          child: Column(

            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('assets/demo/bor.jpeg'),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 55.0),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "+7 902 123 123",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 20.0
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 55.0
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.indigo,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                          "juhnowski@gmail.com",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.indigo
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Предупреждение: ЦРБ-1 г.Бор'),
                      subtitle: Text('Давление в контуре близко к критическому'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Оформить вызов'),
                          onPressed: () {
                            Navigator.push(context, OrderPage());
                          },
                        ),
                        FlatButton(
                          child: const Text('Вход'),
                          onPressed: () {
                            Navigator.push(context, MainPage());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  });
}



class MainPage extends MaterialPageRoute<Null> {
  MainPage() : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Датчики"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.warning),
                    title: Text('МРТ-1 Датчик №1'),
                    subtitle: Text('Давление в контуре близко к критическому'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Оформить вызов'),
                        onPressed: () {
                          Navigator.push(context, OrderPage());
                        },
                      ),
                      FlatButton(
                        child: const Text('Состояние'),
                        onPressed: () {
                          Navigator.push(context, ViewPage1());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.check),
                    title: Text('МРТ-2 Датчик №1'),
                    subtitle: Text('Давление в норме'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Состояние'),
                        onPressed: () {
                          Navigator.push(context, ViewPage2());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.check),
                    title: Text('МРТ-2 Датчик №2'),
                    subtitle: Text('Давление в норме'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Состояние'),
                        onPressed: () {
                          Navigator.push(context, ViewPage3());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.check),
                    title: Text('МРТ-2 Датчик №3'),
                    subtitle: Text('Давление в норме'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Состояние'),
                        onPressed: () {
                          Navigator.push(context, ViewPage4());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}

class ViewPage1 extends MaterialPageRoute<Null> {
  ViewPage1() : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("МРТ-1 Датчик №1"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Image.asset('assets/demo/dat1.jpg'),
      ),
    );
  });
}

class ViewPage2 extends MaterialPageRoute<Null> {
  ViewPage2() : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("МРТ-2 Датчик №1"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Image.asset('assets/demo/dat2.jpg'),
      ),
    );
  });
}

class ViewPage3 extends MaterialPageRoute<Null> {
  ViewPage3() : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("МРТ-2 Датчик №2"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Image.asset('assets/demo/dat2.jpg'),
      ),
    );
  });
}

class ViewPage4 extends MaterialPageRoute<Null> {
  ViewPage4() : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("МРТ-2 Датчик №3"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Image.asset('assets/demo/dat3.jpg'),
      ),
    );
  });
}


class ViewPage5 extends MaterialPageRoute<Null> {
  ViewPage5() : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("МРТ-2 Датчик №4"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Image.asset('assets/demo/dat4.jpg'),
      ),
    );
  });
}

class OrderPage extends MaterialPageRoute<Null> {
  OrderPage() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Вызов оформлен"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset('assets/demo/mrt.jpg'),
            Text(''),
            Text('Акт работ №123/1'),
            Text(''),
            Text(
                'В рамках договора на обслуживание аппарата МРТ производства Siemens ООО "Телеметрия МРТ" произведет заправку контура аппарата теплоносителем в объеме 1.2 литра.'),
            Text(
                'Стоимость работ и материалов будет предоставлена в Акте выполненых работ. Работы планируется произвести 12 июня 2020 года с 8:00 до 8:15.'),
            Text(''),
            Text(''),
            Text(''),
            Text('ФИО сотрудника: Юхновский И.А.'),
            Text(''),
            Text('сотовый: 8-902-7-123-123'),
            Text(''),
            Text(''),
            Text('Спасибо за обращение!'),
          ],
        ),
      ),
    );
  });
}
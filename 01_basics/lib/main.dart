import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          title: Text("First statefull app"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              //ДЗ: Чем отличается padding от margin?

              // padding - отступы от краев контейнера до элементов внутри контейнера
              // margin - отступы от краев до элементов снаружи
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Tap \"+\" to increment",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Container(
                      //Размер контейнера фиксированный, но ведь может быть и такое,
                      //когда экран большой, а размер элемента не соответствует виду.
                      //ДЗ: Каким образом можно вывести размер элемента(кнопки) относительно экрана?

                      // Можно воспользоваться mediaquery для получения размера экрана, и от размера взять нужный процент
                      // width: MediaQuery.of(context).size.width * 0.01
                      width: 128,
                      height: 48,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(6)),
                      child: CounterWidget()),
                  Text("Tap \"-\" to decrement",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              )),
        ),
      ),
    );
  }
}

//ДЗ: Что такое  Statefull?

// виджет statefull может хранить состояние и перестраивает свой UI если состояние поменяется
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

// ДЗ: Почему и в каких случаях перед объявлением класса ставится знак
// нижнего подчеркивания?

// Нижним подчеркиванием обозначается приватные свойства или методы класса
class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 50;

  void _increment() {
    setState(() => _counter++);
  }

  void _decrement() {
    setState(() => _counter--);
  }

  @override
  //ДЗ: Что такое context?

  // параметр context описывает расположение виджета в дереве Widget Tree
  // служит для получения информации из виджетов которые "выше" в иерархии, например (как я понял)
  // состояния от виджета - предка
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              _decrement();
            }),
        Expanded(
            child: Center(
          child: Text("$_counter", style: TextStyle(fontSize: 24)),
        )),
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _increment();
            }),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String text1 = "";
  int angka1 = 0;

  void angkaPressed(int angka) {
    setState(() {
      text1 += "$angka";
    });
  }

  void addOpr(String opr) {
    print("tambahkan operator: $opr");
  }

  void addComa() {
    print("tambah koma");
  }

  void btnActionPressed(String action) {
    switch (action) {
      case "C":
        setState(() {
          text1 = "";
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kalkulator",
        ),
      ),
      body: Column(
        children: [
          Text(
            text1,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderBtnAngka(1),
                    renderBtnAngka(2),
                    renderBtnAngka(3),
                    renderBtnOperator("/"),
                    renderBtnAction("<-"),
                    renderBtnAction("C"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderBtnAngka(4),
                    renderBtnAngka(5),
                    renderBtnAngka(6),
                    renderBtnOperator("X"),
                    renderBtnOperator2("("),
                    renderBtnOperator2(")"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderBtnAngka(7),
                    renderBtnAngka(8),
                    renderBtnAngka(9),
                    renderBtnOperator("-"),
                    renderBtnAction("X2"),
                    renderBtnAction("V"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderBtnAngka(0),
                    renderBtnKoma(),
                    renderPersen(),
                    renderBtnOperator("+"),
                    renderBtnAction("=", width: 84),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderBtnOperator(String opr) {
    return genericButtonContainer(
      child: ElevatedButton(
        onPressed: () {
          addOpr(opr);
        },
        child: Text(opr),
      ),
    );
  }

  Widget renderBtnAngka(int angka) {
    return genericButtonContainer(
      child: ElevatedButton(
        onPressed: () {
          angkaPressed(angka);
        },
        child: Text("$angka"),
      ),
    );
  }

  Widget genericButtonContainer({child: Widget, double width = 40}) {
    print("generic button with width: $width");
    // print(width);
    return Container(
      width: width,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: child,
    );
  }

  Widget renderBtnKoma() {
    return genericButtonContainer(
      child: ElevatedButton(
        onPressed: () {
          addComa();
        },
        child: Text(","),
      ),
    );
  }

  Widget renderPersen() {
    return genericButtonContainer(
      child: ElevatedButton(
        onPressed: () {},
        child: Text("%"),
      ),
    );
  }

  Widget renderBtnOperator2(String opr) {
    return genericButtonContainer(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(opr),
      ),
    );
  }

  Widget renderBtnAction(String s, {double width = 40}) {
    return genericButtonContainer(
      child: ElevatedButton(
        onPressed: () {
          btnActionPressed(s);
        },
        child: Text(s),
      ),
      width: width,
    );
  }
}

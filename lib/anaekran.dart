import 'package:flutter/material.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  num sayi1 = 0, sayi2 = 0, sonuc = 00;
  TextEditingController t1 = TextEditingController();

  List<String> yapilacaklar = ["Uyan"];
  int deger = 1;
  toDo() {
    setState(() {
      yapilacaklar.insert(deger, t1.text);
      deger++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(sonuc.toString()),
            TextField(
              controller: t1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: toDo,
                  child: Text("Listeye ekle"),
                ),
              ],
            ),
            Text(
              yapilacaklar.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

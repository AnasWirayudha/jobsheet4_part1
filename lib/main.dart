import 'package:flutter/material.dart';
import 'package:jobsheet4_part1/widgets/HasilAkhir.dart';
import 'package:jobsheet4_part1/widgets/InputSuhu.dart';
import 'package:jobsheet4_part1/widgets/RiwayatPerhitungan.dart';
import 'package:jobsheet4_part1/widgets/TargetPerhitungan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State < MyApp > createState() => _MyAppState();
}

class _MyAppState extends State < MyApp > {
  TextEditingController etInput = new TextEditingController();
  List < String > listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropdown = "Kelvin";
  double hasilPerhitungan = 0;
  List < String > listHasil = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konverter Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                InputSuhu(etInput: etInput),
                const SizedBox(height: 8),
                  TargetPerhitungan(
                    selectedDropdown: selectedDropdown,
                    listSatuanSuhu: listSatuanSuhu,
                    onDropdownChanged: onDropdownChanged,
                  ),
                  const SizedBox(height: 10),
                    Text(
                      "Hasil",
                      style: TextStyle(fontSize: 20),
                    ),
                    HasilAkhir(hasilPerhitungan: hasilPerhitungan),
                    const SizedBox(height: 10),
                      const Text(
                          "Riwayat Konversi",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                          RiwayatPerhitungan(listHasil: listHasil),
              ],
            ),
        ),
      ),
    );
  }


  void onDropdownChanged(Object ? value) {
    return setState(() {
      selectedDropdown = value.toString();
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            break;
          case "Reamur":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            break;
          case "Fahrenheit":
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listHasil.add(selectedDropdown +
          " : " + hasilPerhitungan.toString());
      }
    });
  
  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case 'Kelvin':
            hasilPerhitungan = int.parse(etInput.text) + 273.15;

            break;
          case 'Reamur':
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;

            break;
          case 'Fahrenheit':
            hasilPerhitungan = int.parse(etInput.text) * 9 / 5 + 32;

            break;
        }
        listHasil.add(etInput.text +
            " Celcius ke " +
            selectedDropdown +
            "hasil perhitungan  : " +
            hasilPerhitungan.toString());
      }
    });
  }

  onDropdownChanged(Object? value) {
    setState(() {
      selectedDropdown = value.toString();
    });
  }
  }
}

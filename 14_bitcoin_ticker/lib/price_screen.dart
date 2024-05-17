import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform; // show != hide
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';

  // Android material
  DropdownButton androidDropdownButton() {
    List<DropdownMenuItem> dropdownItem = [];
    // Alternative for loop:
    // for (int i =0; i< currencyList.length; i++) {String currency = currencyList[i];}
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItem.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: dropdownItem,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value;
          },
        );
      },
    );
  }

  // IOS cupertino
  Widget iosCupertinoPicker() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {},
        children: pickerItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: androidDropdownButton()
              // Since I'm testing the app on Chrome and not Android/IOS, the line of code below will give me error!
              // Platform.isAndroid ? androidDropdownButton() : iosCupertinoPicker()
              ),
        ],
      ),
    );
  }
}

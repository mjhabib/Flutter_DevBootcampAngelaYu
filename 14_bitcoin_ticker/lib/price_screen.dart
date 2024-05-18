// import 'package:flutter/cupertino.dart';
// import 'dart:io' show Platform; // show != hide
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  double coinRate = 0;

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
            getData();
          },
        );
      },
    );
  }

  // IOS cupertino
  // Widget iosCupertinoPicker() {
  //   List<Widget> pickerItems = [];
  //   for (String currency in currenciesList) {
  //     var newItem = Text(currency);
  //     pickerItems.add(newItem);
  //   }
  //   return CupertinoPicker(
  //       backgroundColor: Colors.lightBlue,
  //       itemExtent: 32,
  //       onSelectedItemChanged: (selectedIndex) {},
  //       children: pickerItems);
  // }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // One-Time only
    getData();
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? '?' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
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
          makeCards(),
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

class CryptoCard extends StatelessWidget {
  final String? value;
  final String selectedCurrency;
  final String cryptoCurrency;

  const CryptoCard({
    super.key,
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

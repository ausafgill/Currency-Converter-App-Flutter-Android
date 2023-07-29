import 'package:currency_converter/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class USDtoany extends StatefulWidget {
  final rates;
  final Map currencies;
  USDtoany({required this.currencies, required this.rates});

  @override
  State<USDtoany> createState() => _USDtoanyState();
}

final usdController = TextEditingController();
String initialval = 'AUD';
String answer = 'Converted USD will be Shown Here.';

class _USDtoanyState extends State<USDtoany> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.yellow.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              "USD To Any Currency",
              style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: usdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Enter USD',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 1,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 1,
                        ))),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButton(
                      value: initialval,
                      items: widget.currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        initialval = newVal!;
                        setState(() {});
                      }),
                ),
                SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      answer = usdController.text +
                          ' USD = ' +
                          convertedUsd(
                              widget.rates, usdController.text, initialval) +
                          ' ' +
                          initialval;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'CONVERT',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              answer,
              style: GoogleFonts.poppins(fontSize: 18),
            ),
          ],
        ));
  }
}

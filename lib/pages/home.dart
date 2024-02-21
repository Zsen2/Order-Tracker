import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _dropdownValue1 = 'Apple';
  String _dropdownValue2 = 'kg';
  String _dropdownValue3 = 'Ramen Dojo';

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    var fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
    var customers = ['Ramen Dojo', 'Sambal', 'Banri', 'Cafeteria'];
    var units = ['kg', 'piece'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              //////////////////////////////// fruit/vegetables dropdown
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12), // Adjusted padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(10),
                        isExpanded: true,
                        value: _dropdownValue1,
                        elevation: 16,
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropdownValue1 = newValue!;
                          });
                        },
                        items: fruits
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              //////////////////////////////// quantity textfield
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Quantity',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  //////////////////////////////// quantity-units dropdown
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 12, right: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(10),
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: _dropdownValue2,
                        elevation: 16,
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropdownValue2 = newValue!;
                          });
                        },
                        items:
                            units.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              //////////////////////////////// Customers dropdown
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12), // Adjusted padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(10),
                        isExpanded: true,
                        value: _dropdownValue3,
                        elevation: 16,
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropdownValue3 = newValue!;
                          });
                        },
                        items: customers
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              //////////////////////////////// Date Picker
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 55,
                      child: TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: 'DATE',
                          prefixIcon: const Icon(Icons.calendar_today),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100));
                          if (pickedDate != null) {
                            dateController.text = pickedDate.toString();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              ///////////////////////////// Price TextField
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Price',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed code here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                          side: const BorderSide(
                              width: 1), // Adjust the color and width as needed
                        ),
                      ),
                      child: const Text('Add Order'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

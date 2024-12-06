import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String? Function(String?)? validator; // Accept custom validator
  final List<String> items; // Accept list of items
  final String? label; // Accept label text
  final String? text; // Accept label text
  final ValueChanged<String?> onChanged; // Callback to return selected value

  const CustomDropDown({
    Key? key,
    this.validator,
    required this.items,
    this.label = 'Select an item',
    this.text = 'Select an item',
    required this.onChanged, // onChanged to send back selected value
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.text ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                ' *',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: widget.label, // Label is passed dynamically
              border: InputBorder.none, // Remo
              filled: true,
              fillColor: Colors.white, // Set background color to white
            ),
            value: selectedValue,
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
              widget.onChanged(newValue); // Pass the selected value back
            },
            validator: widget.validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an item'; // Default validation message
                  }
                  return null;
                },
          ),
        ],
      ),
    );
  }
}

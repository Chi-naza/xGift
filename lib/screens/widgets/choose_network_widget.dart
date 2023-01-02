import 'package:flutter/material.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/constants/app_dimensions.dart';

class ChooseNetworkDropDown extends StatefulWidget {

  ChooseNetworkDropDown({Key? key}) : super(key: key);

  String networkChoice = '';

  @override
  State<ChooseNetworkDropDown> createState() => _ChooseNetworkDropDownState();
}

class _ChooseNetworkDropDownState extends State<ChooseNetworkDropDown> {

  // DropDowns
  var typeOfNetworks = ["Choose Network", "MTN", " 9 Mobile", "Glo", "Airtel", "Etisalat"];
  String currNetwork = "Choose Network";


  @override
  Widget build(BuildContext context) {
    // Choose Network
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // network TEXT
        const Text(
          'Network',
          style: TextStyle(
            color: GiftColors.textMainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: GiftDim.size3),
        // DropdownList wrapped in a Container widget
        Container(
          decoration: BoxDecoration(
            color: GiftColors.inputBoxColor,
            borderRadius: BorderRadius.circular(GiftDim.size4*1.5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: GiftDim.size12),
            // Wrapping dropdown button widget with this: to remove the persitent underline
            child: DropdownButtonHideUnderline(
              child: DropdownButton(                            
                isExpanded: false,
                icon: Icon(Icons.keyboard_arrow_down, size: GiftDim.size25),  
                value: currNetwork,
                items: typeOfNetworks.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(), 
                onChanged: (String? newValue){
                  setState(() {
                    currNetwork = newValue!;
                    widget.networkChoice = newValue;
                  });
                },
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
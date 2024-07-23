import 'package:flutter/material.dart';
import 'package:myapp/database/validation.dart';



class CustomTextFields extends StatelessWidget {
  const CustomTextFields({super.key, 
    required this.nameController,
    required this.ageController,
    required this.phoneController,
    required this.addressController,
  });

  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNameTextField(),
        _buildAgeTextField(),
        _buildPhoneTextField(),
        _buildAddressTextField(),
      ],
    );
  }

  Widget _buildNameTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: Validations.nameValidator,
        controller: nameController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 2,
            ),
          ),
          labelText: "Name",
          hintText: "Enter Name",
        ),
      ),
    );
  }

  Widget _buildAgeTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: Validations.ageValidator,
        controller: ageController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 2,
            ),
          ),
          labelText: "Age",
          hintText: "Enter your age",
        ),
      ),
    );
  }

  Widget _buildPhoneTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: Validations.phoneValidator,
        controller: phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 2,
            ),
          ),
          labelText: "Contact",
          hintText: "Enter your contact number",
        ),
      ),
    );
  }

  Widget _buildAddressTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: Validations.addressValidator,
        controller: addressController,
        maxLines: 5,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 2,
            ),
          ),
          labelText: "Address",
          hintText: "Enter the Address Include Pin",
        ),
      ),
    );
  }
}
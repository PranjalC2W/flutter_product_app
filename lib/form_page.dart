import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _gender;
  String? _country;
  String? _state;
  String? _city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white, 
          ),
        ),
        backgroundColor: Colors.teal, 
      ),
      body: Container(
        color: const Color.fromARGB(255, 196, 232, 229), 
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(fontFamily: 'Roboto'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter a valid name'
                    : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontFamily: 'Roboto'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                validator: (value) => value == null || !value.contains('@')
                    ? 'Enter a valid email'
                    : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(fontFamily: 'Roboto'), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                validator: (value) => value == null || value.length != 10
                    ? 'Enter a valid phone number'
                    : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(fontFamily: 'Roboto'), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                ],
                onChanged: (value) => setState(() => _gender = value),
                validator: (value) => value == null ? 'Select a gender' : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _country,
                decoration: InputDecoration(
                  labelText: 'Country',
                  labelStyle: TextStyle(fontFamily: 'Roboto'), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'USA', child: Text('USA')),
                  DropdownMenuItem(value: 'India', child: Text('India')),
                ],
                onChanged: (value) => setState(() => _country = value),
                validator: (value) => value == null ? 'Select a country' : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _state,
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(fontFamily: 'Roboto'), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Gujrat', child: Text('Gujrat')),
                  DropdownMenuItem(value: 'Maharashtra', child: Text('Maharashtra')),
                ],
                onChanged: (value) => setState(() => _state = value),
                validator: (value) => value == null ? 'Select a state' : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _city,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(fontFamily: 'Roboto'), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Pune', child: Text('Pune')),
                  DropdownMenuItem(value: 'Mumbai', child: Text('Mumbai')),
                ],
                onChanged: (value) => setState(() => _city = value),
                validator: (value) => value == null ? 'Select a city' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Form submitted successfully!',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        backgroundColor: Colors.green.shade700, 
                        duration: const Duration(seconds: 3), 
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      ),
                    );

                   
                    _nameController.clear();
                    _emailController.clear();
                    _phoneController.clear();
                    setState(() {
                      _gender = null;
                      _country = null;
                      _state = null;
                      _city = null;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700, 
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

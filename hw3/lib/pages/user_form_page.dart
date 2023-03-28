import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw3/pages/user_info_page.dart';

import '../models/User.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final List<String> _countries = ['Russia', 'Usa', 'China', 'India'];
  String? _selectedCountry = '';
  bool _isObscureText = true;

  User newUser = User(
    '',
    '',
    '',
    '',
    '',
    '',
  );

  final _keyForm = GlobalKey<FormState>();
  final _keyScaffold = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passConfirmFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passConfirmController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _passConfirmFocus.dispose();
    super.dispose();
  }

  void _changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode focusNode) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: const Text('Register page'),
        centerTitle: true,
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) =>
                  _changeFocus(context, _nameFocus, _phoneFocus),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                  onPressed: () {
                    _nameController.clear();
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                ),
                labelText: 'Full name *',
                hintText: 'Why do people call you?',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              validator: _validateName,
              onSaved: (value) {
                newUser.name = value!;
              },
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              focusNode: _phoneFocus,
              controller: _phoneController,
              onFieldSubmitted: (_) =>
                  _changeFocus(context, _phoneFocus, _emailFocus),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {
                    _phoneController.clear();
                  },
                ),
                labelText: 'Phone Nunber *',
                hintText: 'Enter a Phone Number',
                helperText: 'Phone Format(xxx-xxx-xxxx)',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.phone,
              validator: _validatePhone,
              onSaved: (value) {
                newUser.phone = value!;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              focusNode: _emailFocus,
              controller: _emailController,
              onFieldSubmitted: (_) =>
                  _changeFocus(context, _emailFocus, _passwordFocus),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                label: Text('Email Address'),
              ),
              validator: _validateEmail,
              onSaved: (value) {
                newUser.email = value!;
              },
            ),
            const SizedBox(height: 15.0),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map),
                hintText: 'Select Your Country',
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (country) {
                _selectedCountry = country;
              },
              onSaved: (value) {
                newUser.country = value!;
              },
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Life story'),
                helperText: 'No more than 100 symbols',
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              maxLines: 3,
              onSaved: (value) {
                newUser.about = value!;
              },
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              focusNode: _passwordFocus,
              controller: _passwordController,
              onFieldSubmitted: (_) =>
                  _changeFocus(context, _passwordFocus, _passConfirmFocus),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscureText = !_isObscureText;
                    });
                  },
                ),
                icon: const Icon(Icons.security),
                hintText: 'Enter Password',
              ),
              validator: _validatePassword,
              obscureText: _isObscureText,
              onSaved: (value) {
                newUser.password = value!;
              },
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              focusNode: _passConfirmFocus,
              controller: _passConfirmController,
              decoration: const InputDecoration(
                icon: Icon(Icons.edit),
                hintText: 'Confirm Password',
              ),
              validator: _validatePassword,
              obscureText: _isObscureText,
            ),
            const SizedBox(height: 17.0),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(String? input) {
    if (input == null) {
      return 'Full name is required';
    } else if (input.isEmpty) {
      return 'Full name is required';
    } else {
      return null;
    }
  }

  String? _validateEmail(String? input) {
    if (input == null) {
      return 'Enter an email address';
    } else if (!input.contains('@')) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  String? _validatePhone(String? input) {
    if (input == null) {
      return 'Enter a phone number';
    } else if (input.length < 5) {
      return 'Enter a valid phone format';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? input) {
    if (_passConfirmController.text != _passwordController.text) {
      return 'Passwords do not match';
    }
    if (input == null) {
      return 'Enter a password';
    } else if (input.length <= 6) {
      return 'Enter at least 7 characters';
    } else {
      return null;
    }
  }

  void _submitForm() {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return UserInfoPage(
              userInfo: newUser,
            );
          },
        ),
      );
    }
  }
}

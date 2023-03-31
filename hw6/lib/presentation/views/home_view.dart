import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enteties/person/person.dart';
import '../bloc/counter_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Work 6'),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterCubit, Person>(
        builder: (context, count) {
          return ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill the form.';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) =>
                          context.read<CounterCubit>().saveName(value!),
                    ),
                    TextFormField(
                      controller: _surnameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Surname',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill the form.';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) =>
                          context.read<CounterCubit>().saveSurname(value!),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  icon: const Icon(Icons.save)),
              const SizedBox(
                height: 15,
              ),
              const Text('Use Buttons to increment/decrement the person value'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () =>
                          context.read<CounterCubit>().decrementCounter(),
                      icon: const Icon(Icons.remove)),
                  Text('${context.read<CounterCubit>().state.counter}'),
                  IconButton(
                      onPressed: () =>
                          context.read<CounterCubit>().incrementCounter(),
                      icon: const Icon(Icons.add)),
                ],
              ),
              PersonDataList(),
            ],
          );
        },
      ),
    );
  }
}

class PersonDataList extends StatelessWidget {
  const PersonDataList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Person characteristics: '),
        Text('Counter: ${context.read<CounterCubit>().state.counter}'),
        Text('Name: ${context.read<CounterCubit>().state.firstName}'),
        Text('Surname: ${context.read<CounterCubit>().state.lastName}'),
      ],
    );
  }
}

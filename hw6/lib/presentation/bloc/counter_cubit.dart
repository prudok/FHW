import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enteties/person/person.dart';

class CounterCubit extends Cubit<Person> {
  CounterCubit()
      : super(
          const Person(
            firstName: '',
            lastName: '',
          ),
        );

  void incrementCounter() => emit(state.copyWith(counter: state.counter + 1));

  void decrementCounter() => emit(state.copyWith(counter: state.counter - 1));

  void saveName(String name) => emit(state.copyWith(firstName: name));

  void saveSurname(String surname) => emit(state.copyWith(lastName: surname));
}

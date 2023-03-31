import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/bloc/counter_cubit.dart';
import '../presentation/views/home_view.dart';

class Hw6 extends StatelessWidget {
  const Hw6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const HomeView(),
      ),
    );
  }
}

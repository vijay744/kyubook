import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyubook/presentation/bloc/character_bloc.dart';
import 'package:kyubook/presentation/bloc/character_state.dart';
import 'package:kyubook/presentation/screens/character_list_page.dart';

import 'data/repositories/character_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // required this widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MyHomPage();
  }
}

class MyHomPage extends StatefulWidget {
  const MyHomPage({Key? key}) : super(key: key);

  @override
  _MyHomPageState createState() => _MyHomPageState();
}

class _MyHomPageState extends State<MyHomPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Rick n Morty'),
            backgroundColor: Colors.black,
          ),
          body: BlocProvider(
            create: (ctx) => CharacterBloc(CharacterLoading(),
                repository: FetchRickNMortyRepositoryImpl()),
            child: RickAndMortyChacactersListWidget(),
          )),
    );
  }
}

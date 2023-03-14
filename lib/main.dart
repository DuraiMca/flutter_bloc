import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/Screens/album_screen.dart';
import 'package:simple_bloc/bloc/album_bloc.dart';

import 'Services/services.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AlbumBloc(albumsrepo: AlbumServices()),
        child: AlbumScreen(),
      ),
    );
  }
}

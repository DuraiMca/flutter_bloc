import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/bloc/album_bloc.dart';

import '../models/_albummodel.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
   
  }

  _loadAlbums() async {
    
    BlocProvider.of<AlbumBloc>(context).add(AlbumEvent.fetchAlbum);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc Example")),
      body: _body(),
    );
  }
}

_body() {
  return Column(
    children: [
      BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
            print(state);
           
           if(state is AlbumLoadError){
            print("error");
          return Text("Error");
         }
         if(state is AlbumLoaded){
          List<AlbumModel> list=state.list;
          return _list(list);
         }

         
          return CircularProgressIndicator();
        },
      )
    ],
  );
}

Widget _list(List<AlbumModel> list) {

  return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            AlbumModel albumModel = list[index];
            return Text(albumModel.title);
          }));
}

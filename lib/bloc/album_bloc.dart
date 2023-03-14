import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_bloc/Services/services.dart';
import 'package:simple_bloc/models/_albummodel.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {

  final  AlbumsRepo albumsrepo;
  List<AlbumModel>?list;
  AlbumBloc({required this.albumsrepo}) : super(AlbumInitial()){
     on<AlbumEvent>((event, emit) async {
      switch (event) {
      case AlbumEvent.fetchAlbum:
        emit( AlbumLoading());
        list = await albumsrepo.getAlbumList();
        emit(AlbumLoaded(list: list!));
        break;
    }
     });
   

  }

    
  }

     
  
  
  

  


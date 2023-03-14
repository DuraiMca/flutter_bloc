part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
  
  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}
class AlbumLoaded extends AlbumState {
  
   final List<AlbumModel> list;
   const AlbumLoaded({required this.list});
}
class AlbumLoadError extends AlbumState {
  final error;
  const AlbumLoadError(this.error);
}



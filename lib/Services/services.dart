import 'package:http/http.dart';
import 'package:simple_bloc/models/_albummodel.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsRepo {
  Future<List<AlbumModel>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  static const URL = "jsonplaceholder.typicode.com";
  static const PATH = "albums";
  @override
  Future<List<AlbumModel>> getAlbumList() async {
    Uri uri = Uri.https(URL, PATH);
    Response response = await http.get(uri);

    List<AlbumModel> album = albumModelFromJson(response.body);
    return album;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final chistesProvider = FutureProvider<List<String>>((ref) async {
  final dio = Dio();
  const numera = 1;
  const url = 'https://tesis-xz3b.onrender.com/joke/getOneNum/$numera';

  final response = await dio.get(url);

  return response.data;
});

// final mostrarChiste = FutureProvider.autoDispose<List<Joke>>((ref) async {
//   final numeracionChiste = 1;
// });

final currentIndexProvider = StateProvider<int>((ref) => 0);

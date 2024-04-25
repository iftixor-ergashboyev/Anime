import 'package:anime/data/repository/local_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class IntroProvider extends ChangeNotifier {
  static final _repo = LocalRepositoryImpl();

  Future<bool> get state => _repo.isFirstTime();

  bool introState = false;

  void getState() async {
    introState = await _repo.isFirstTime();
  }

  void _savedState(bool state) async {
    await _repo.saveIntro(state);
  }
}
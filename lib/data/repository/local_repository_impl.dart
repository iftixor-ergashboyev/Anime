import 'package:anime/data/local/cache_manager.dart';
import '../../domain/repository/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final _cache = CacheManager();
  @override
  Future<bool> isFirstTime() async {
   return _cache.getIntroState();
  }

  @override
  Future<void> saveIntro(bool firstTime) async {
    await _cache.saveIntroState(firstTime);
  }
}
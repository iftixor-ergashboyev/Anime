abstract class LocalRepository {
  Future<bool> isFirstTime();
  Future<void> saveIntro(bool firstTime);
}
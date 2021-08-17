import '../dataSource/firebase_auth_data_source.dart';

class AuthRepo{
  FirebaseAuthDataSource firebaseDataSource;

  AuthRepo(this.firebaseDataSource);

  Future<void> signUp(String email, String password) async {
   await firebaseDataSource.signUp(email, password);
  }

  Future<void> login(String email, String password) async {
   await firebaseDataSource.login(email, password);
  }

}
import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setUpServiceLocator() {
  getit.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getit.registerSingleton<AuthRepo>(
      AuthRepoImpl(getit.get<FirebaseAuthServices>()));
  // getit.registerSingleton<ApiServices>(ApiServices(Dio()));
  // getit.registerSingleton<SearchRepoImpl>(SearchRepoImpl(apiServices: ApiServices(Dio())));

  // getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getit.get<ApiServices>()));
}

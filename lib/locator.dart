import 'package:crypto_app/features/home/data/repository/crypto_repository_impl.dart';
import 'package:crypto_app/features/home/data/source/api_provider.dart';
import 'package:crypto_app/features/home/domain/repository/crypto_repository.dart';
import 'package:crypto_app/features/home/domain/usecase/get_crypto_usecase.dart';
import 'package:crypto_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  //* Repository
  locator.registerSingleton<CryptoRepository>(
    CryptoRepositoryImpl(apiProvider: locator()),
  );

  //* UseCase
  locator.registerSingleton<GetCryptoUseCase>(
    GetCryptoUseCase(cryptoRepository: locator()),
  );

  //* Bloc
  locator.registerSingleton<HomeBloc>(
    HomeBloc(getCryptoUseCase: locator()),
  );
}

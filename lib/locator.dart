import 'package:crypto_app/features/detail/data/repository/detail_repository_impl.dart';
import 'package:crypto_app/features/detail/data/source/detail_api_provider.dart';
import 'package:crypto_app/features/detail/domain/repository/detail_repository.dart';
import 'package:crypto_app/features/detail/domain/usecase/get_detail_usecase.dart';
import 'package:crypto_app/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:crypto_app/features/home/data/repository/crypto_repository_impl.dart';
import 'package:crypto_app/features/home/data/source/api_provider.dart';
import 'package:crypto_app/features/home/domain/repository/crypto_repository.dart';
import 'package:crypto_app/features/home/domain/usecase/get_crypto_usecase.dart';
import 'package:crypto_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<DetailApiProvider>(DetailApiProvider());

  //* Repository
  locator.registerSingleton<CryptoRepository>(
    CryptoRepositoryImpl(apiProvider: locator()),
  );
  locator.registerSingleton<DetailRepository>(DetailRepositoryImpl(locator()));

  //* UseCase
  locator.registerSingleton<GetCryptoUseCase>(
    GetCryptoUseCase(cryptoRepository: locator()),
  );
  locator.registerSingleton<GetDetailUseCase>(GetDetailUseCase(locator()));

  //* Bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(getCryptoUseCase: locator()));
  locator.registerSingleton<DetailBloc>(DetailBloc(locator()));
}

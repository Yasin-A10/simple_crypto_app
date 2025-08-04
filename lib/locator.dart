import 'package:crypto_app/features/all_crypto/data/repository/all_crypto_repository_impl.dart';
import 'package:crypto_app/features/all_crypto/data/source/all_cryptos_api_provider.dart';
import 'package:crypto_app/features/all_crypto/domain/repository/all_crypto_repository.dart';
import 'package:crypto_app/features/all_crypto/domain/usecase/get_all_crypto_usecase.dart';
import 'package:crypto_app/features/all_crypto/presentation/bloc/all_crypto_bloc.dart';
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
  locator.registerSingleton<AllCryptosApiProvider>(AllCryptosApiProvider());

  //* Repository
  locator.registerSingleton<CryptoRepository>(
    CryptoRepositoryImpl(apiProvider: locator()),
  );
  locator.registerSingleton<DetailRepository>(DetailRepositoryImpl(locator()));
  locator.registerSingleton<AllCryptoRepository>(AllCryptoRepositoryImpl(locator()));

  //* UseCase
  locator.registerSingleton<GetCryptoUseCase>(
    GetCryptoUseCase(cryptoRepository: locator()),
  );
  locator.registerSingleton<GetDetailUseCase>(GetDetailUseCase(locator()));
  locator.registerSingleton<GetAllCryptoUseCase>(GetAllCryptoUseCase(locator()));

  //* Bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(getCryptoUseCase: locator()));
  locator.registerSingleton<DetailBloc>(DetailBloc(locator()));
  locator.registerSingleton<AllCryptoBloc>(AllCryptoBloc(locator()));
}

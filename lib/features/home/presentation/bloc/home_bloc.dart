import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/home/presentation/bloc/crypto_status.dart';
import 'package:crypto_app/features/home/domain/usecase/get_crypto_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCryptoUseCase getCryptoUseCase;

  HomeBloc({required this.getCryptoUseCase})
    : super(HomeState(cryptoStatus: CryptoLoading())) {

    on<LoadCryptoEvent>((event, emit) async {

      // emit loading state
      emit(state.copyWith(newCryptoStatus: CryptoLoading()));

      // call use case
      DataState dataState = await getCryptoUseCase();

      // emit success state
      if (dataState is DataSuccess) {
        emit(state.copyWith(newCryptoStatus: CryptoSuccess(cryptoEntity: dataState.data!)));
      }

      // emit error state
      if (dataState is DataFailed) {
        emit(state.copyWith(newCryptoStatus: CryptoError(message: dataState.error!)));
      }
    });
  }
}

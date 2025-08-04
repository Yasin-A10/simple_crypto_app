import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/all_crypto/presentation/bloc/all_crypto_status.dart';
import 'package:crypto_app/features/all_crypto/domain/usecase/get_all_crypto_usecase.dart';

part 'all_crypto_event.dart';
part 'all_crypto_state.dart';


class AllCryptoBloc extends Bloc<AllCryptoEvent, AllCryptoState> {
  final GetAllCryptoUseCase getAllCryptoUseCase;

  AllCryptoBloc(this.getAllCryptoUseCase)
      : super(AllCryptoState(allCryptoStatus: AllCryptoLoading())) {
    on<LoadAllCryptoEvent>((event, emit) async {
      emit(state.copyWith(newAllCryptoStatus: AllCryptoLoading()));

      DataState dataState = await getAllCryptoUseCase(event.start, event.limit);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
          newAllCryptoStatus: AllCryptoSuccess(dataState.data),
        ));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(
          newAllCryptoStatus: AllCryptoError(dataState.error!),
        ));
      }
    });
  }
}

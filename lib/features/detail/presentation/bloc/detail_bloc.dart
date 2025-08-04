import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/detail/presentation/bloc/detail_crypto_status.dart';
import 'package:crypto_app/features/detail/domain/usecase/get_detail_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';


class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailUseCase getDetailUseCase;

  DetailBloc(this.getDetailUseCase)
      : super(DetailState(detailCryptoStatus: DetailCryptoLoading())) {
    on<LoadDetailEvent>((event, emit) async {
      emit(state.copyWith(newDetailCryptoStatus: DetailCryptoLoading()));
      DataState dataState = await getDetailUseCase(event.start);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
          newDetailCryptoStatus: DetailCryptoSuccess(dataState.data),
        ));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(
          newDetailCryptoStatus: DetailCryptoError(dataState.error!),
        ));
      }
    });
  }
}

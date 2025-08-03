import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/detail/presentation/bloc/detail_crypto_status.dart';
import 'package:crypto_app/features/detail/domain/usecase/get_detail_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

// class DetailBloc extends Bloc<DetailEvent, DetailState> {
//   final GetDetailUseCase getDetailUseCase;

//   DetailBloc(this.getDetailUseCase)
//     : super(DetailState(detailCryptoStatus: DetailCryptoLoading())) {
//     on<DetailEvent>((event, emit) async {
//       // emit loading state
//       emit(state.copyWith(newDetailCryptoStatus: DetailCryptoLoading()));

//       // call use case
//       DataState dataState = await getDetailUseCase(event.start);

//       // emit success state
//       if (dataState is DataSuccess) {
//         emit(
//           state.copyWith(
//             newDetailCryptoStatus: DetailCryptoSuccess(dataState.data),
//           ),
//         );
//       }

//       // emit error state
//       if (dataState is DataFailed) {
//         emit(
//           state.copyWith(
//             newDetailCryptoStatus: DetailCryptoError(dataState.error!),
//           ),
//         );
//       }
//     });
//   }
// }

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailUseCase getDetailUseCase;

  DetailBloc(this.getDetailUseCase)
      : super(DetailState(detailCryptoStatus: DetailCryptoLoading())) {
    // اینجا نوع رویداد را LoadDetailEvent مشخص می‌کنیم
    on<LoadDetailEvent>((event, emit) async {
      // بار اول استیت را Loading می‌کنیم
      emit(state.copyWith(newDetailCryptoStatus: DetailCryptoLoading()));

      // حالا می‌توانیم مستقیم به event.start دسترسی داشته باشیم
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

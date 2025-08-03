import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/detail/domain/repository/detail_repository.dart';
import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';

class GetDetailUseCase {
  DetailRepository detailRepository;
  GetDetailUseCase(this.detailRepository);

  // for call detail repository method
  Future<DataState<CryptoEntity>> call(int start) async {
    return await detailRepository.fetchDetailData(start);
  }
}

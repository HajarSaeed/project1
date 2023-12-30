import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/list_by_category_id_model.dart';
import '../../../core/remote/service.dart';

part 'screen2_state.dart';

class Screen2Cubit extends Cubit<Screen2State> {
  Screen2Cubit() : super(Screen2Initial());

  ServiceApi serviceApi = ServiceApi();
  ListByCategoriesIdModel? listByCategoriesIdModel;

  getListByCategoriesId()async{
    final response = await serviceApi.getListByCategoryId(2);
    emit(ListLoadingState());
    response.fold((l) {
      emit(ListFailureState());
    }, (r) {
      listByCategoriesIdModel = r;
      emit(ListSuccessState());
    });
  }
}

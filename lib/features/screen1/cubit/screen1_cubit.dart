import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ssdinterview/core/remote/service.dart';

import '../../../core/models/categories_list_model.dart';

part 'screen1_state.dart';

class Screen1Cubit extends Cubit<Screen1State> {
  Screen1Cubit() : super(Screen1Initial());

  ServiceApi serviceApi = ServiceApi();
  CategoriesListModel? categoriesListModel;

  Future<void> getCategoriesList() async {
    emit(CategoriesListLoadingState());
    final response = await serviceApi.getCategoriesList();
    response.fold((l) {
      emit(CategoriesListFailureState());
    }, (r) {
      categoriesListModel = r;
      emit(CategoriesListSuccessState());
    });
  }

}

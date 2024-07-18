import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/store/data/repo/stores_repo_impl.dart';
import 'package:gas_station_app/features/store/presentation/manager/cubit/store_state.dart';
import 'package:gas_station_app/shared/models/store_model.dart';

class StoreCubit extends Cubit<StoresState> {
  StoreCubit() : super(StoresInitial());

  static StoreCubit get(context) => BlocProvider.of(context);

  List<StoreModel> storesList = <StoreModel>[];

  Future<void> getAllStoress() async {
    emit(LoadingStores());
    final result = await StoresRepoImpl().getAllStores();
    result.fold((failur) {
      return emit(ErrorStores(msgError: failur.errorMessage));
    }, (storemodel) {
      // if search before
      storesList.clear();
      storesList = <StoreModel>[];
      if (storemodel.storeList != []) {
        storesList = storemodel.storeList ?? <StoreModel>[];
      }
      return emit(SuccessStores());
    });
  }

  searchOfStore({required String searchText}) {
    var result =
        storesList.where((element) => element.name == searchText).toList();
    if (result.isNotEmpty) {
      storesList.clear();
      storesList = <StoreModel>[];
      for (var element in result) {
        storesList.add(element);
      }
      emit(SuccessStores());
    } else {
      emit(ErrorSearchStores());
    }
  }
}

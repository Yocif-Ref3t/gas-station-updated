
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/layout/presentation/manager/states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);


  int clickTab = 0 ;

  changeClickTab(int tab) {
    clickTab = tab ;
    emit( ChangeClickTabState());
  }
}

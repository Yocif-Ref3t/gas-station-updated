
abstract class StoresState {}

 class StoresInitial extends StoresState {}
 class LoadingStores extends StoresState {}
 class SuccessStores extends StoresState {}
 class ErrorStores extends StoresState {
  final String msgError ; 
  ErrorStores({ required this.msgError}) ;
}
 class ErrorSearchStores extends StoresState {}


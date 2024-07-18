
abstract class BranchesState {}

 class BranchesInitial extends BranchesState {}
 class LoadingBranches extends BranchesState {}
 class SuccessBranches extends BranchesState {}

 class ErrorBranches extends BranchesState {
  final String msgError ; 
  ErrorBranches({ required this.msgError}) ;
}
 class ErrorSearchBranches extends BranchesState {}

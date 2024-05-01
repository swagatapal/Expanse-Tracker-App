import 'package:bloc/bloc.dart';
import 'package:expanse_tracker/screens/add_expenses/bloc/create_categorybloc/create_category_event.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final ExpenseRepository expenseRepository;
  CreateCategoryBloc(this.expenseRepository) : super(CreateCategoryInitial()) {
    on<CreateCategoryEvent>((event, emit) async{
      emit(CreateCategoryLoading());
      try{
      emit(CreateCategorySuccess());
      }catch(e){
        emit(CreateCategoryFailure());
      }

    });
  }
}

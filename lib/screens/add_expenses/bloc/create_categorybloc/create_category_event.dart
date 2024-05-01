
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CreateCategoryEvent extends Equatable {
  const CreateCategoryEvent();

  @override
  List<Object> get props => [];
}


class CreateCategory extends CreateCategoryEvent{
  final Category category;
  const CreateCategory(this.category);
  @override
  List<Object> get props => [category];

}
import 'package:clot/src/features/home/data/model/categories_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  final List<CategoriesModel>? categoriesModel;
  final String errorMessage;

  const HomeState({this.errorMessage = 'Something went wrong', this.categoriesModel, required this.status});

  HomeState copyWith({HomeStatus? status, List<CategoriesModel>? categoriesModel, String? errorMessate}) => HomeState(errorMessage:  errorMessage, categoriesModel:categoriesModel??this.categoriesModel, status: status?? this.status);

  @override
  List<Object?> get props => [
        categoriesModel,
        status,
      ];
}

enum HomeStatus {
  loading,
  error,
  success
}
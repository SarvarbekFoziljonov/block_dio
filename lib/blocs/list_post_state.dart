import 'package:block_dio/models/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class ListPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListPostInit extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<Post> posts;
  final bool isDeleted;

  ListPostLoaded({ this.posts, this.isDeleted});
}

class ListPostError extends ListPostState {
  final error;

  ListPostError({ this.error});
}
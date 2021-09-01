import 'package:block_dio/blocs/creat_post_state.dart';
import 'package:block_dio/models/post_model.dart';
import 'package:block_dio/services/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate (Post post) async{
    print(post.toJson());
    emit(CreatePostLoading());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print(response);
    if(response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}
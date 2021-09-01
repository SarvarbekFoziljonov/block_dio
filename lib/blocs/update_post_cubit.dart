import 'package:block_dio/blocs/update_post_state.dart';
import 'package:block_dio/models/post_model.dart';
import 'package:block_dio/services/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());

  void apiPostUpdate(Post post) async{
    post.userId = 1;
    print(post.toJson());
    emit(UpdatePostLoading());
    final response = Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if(response != null) {
      emit(UpdatePostLoaded(isUpdate: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}
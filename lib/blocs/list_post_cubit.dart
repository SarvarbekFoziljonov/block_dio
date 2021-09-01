import 'package:block_dio/blocs/list_post_state.dart';
import 'package:block_dio/models/post_model.dart';
import 'package:block_dio/pages/creat_page.dart';
import 'package:block_dio/pages/update_page.dart';
import 'package:block_dio/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    print(response);
    if(response != null) {
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    } else {
      emit(ListPostError(error: "Couldn't fetch posts"));
    }
  }

  void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    print(response);
    if(response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
    if(result != null) {
      //BlocProvider.of<ListPostCubit>(context).apiPostList();
      apiPostList();
    }
  }

  void callUpdatePage(BuildContext context, Post post) async{
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
    if(result != null) {
      apiPostList();
    }
  }
}
class Post {
  int id;
  dynamic userId;
  String title;
  String body;

  Post({this.id, this.userId, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'body' : body,
    'userId' : userId,
  };
}
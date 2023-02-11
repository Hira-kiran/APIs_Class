// ignore_for_file: unnecessary_this, unnecessary_new, file_names, prefer_collection_literals

class CommentApiModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentApiModel({this.postId, this.id, this.name, this.email, this.body});

  CommentApiModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}

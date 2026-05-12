class Post {
  Post({this.id, required this.title, required this.body});

  final int? id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json["id"], title: json['title'], body: json['body']);
  } // converts json to dart object!

  Map<String, dynamic> toJson() {
    return {"title": title, "body": body};
  } // converts dart object to json!
}

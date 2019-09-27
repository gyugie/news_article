import 'dart:convert';

class Post{
  int post_id;
  String post_title;
  String post_description;
  String image_url;
  String created_date;
  String is_favorite;

  Post({
    this.post_id = 0, 
    this.post_title, 
    this.post_description,
    this.image_url, 
    this.created_date,
    this.is_favorite
    });

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
        post_id: map["post_id"], 
        post_title: map["post_title"], 
        post_description: map["post_description"], 
        image_url: map["image_url"],
        is_favorite: map["is_favorite"],
        created_date: map["created_date"]
        );
  }

   Map<String, dynamic> toJson() {
    return {
      "post_id": post_id, 
      "post_title": post_title, 
      "post_description": post_description, 
      "image_url": image_url,
      "is_favorite": is_favorite,
      "created_date":created_date
      };
  }

    @override
  String toString() {
    return 'post{post_id: $post_id, post_title: $post_title, post_description: $post_description, image_url: $image_url, is_favorite: ${is_favorite}, created_date:$created_date}';
  }

}

List<Post> postFromJson(String jsonData) {
  final result = json.decode(jsonData);
  var   data   = result['data'];
  return List<Post>.from(data.map((item) => Post.fromJson(item)));
}

String postToJson(Post data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
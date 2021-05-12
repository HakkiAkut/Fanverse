class Pages{
  String pid; // page id
  String classId;
  String name;
  String imageUrl;
  Map<String, String> generalInfo;
  String text;

  Pages(
      {this.pid,
      this.classId,
      this.name,
      this.imageUrl,
      this.generalInfo,
      this.text});

  Map<String, dynamic> toMap() {
    return {
      "pid": pid,
      "class_id": classId,
      "name": name,
      "text": text,
      "url": imageUrl,
      "general_info": generalInfo,
    };
  }

  factory Pages.fromMap(Map<String, dynamic> map) {
    return Pages(
      pid: map["pid"] as String,
      classId: map["class_id"] as String,
      name: map["name"] as String,
      text: map["text"] as String,
      imageUrl: map["url"],
    );
  }
}

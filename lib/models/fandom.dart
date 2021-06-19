
class Fandom {
  String fid; // fandom id
  String name; // fandom name
  String description;
  Map<String, dynamic> members; // user id of members
  Map<String, dynamic> admins;
  Map<String, dynamic> pageClasses; // general titles like Kingdoms, Characters
  String imageUrl;

  Fandom(
      {this.fid,
      this.name,
      this.description,
      this.members,
      this.admins,
      this.pageClasses,
      this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      "fid": fid,
      "name": name,
      "description": description,
      "members": members,
      "admins": admins,
      "image": imageUrl,
      "page_classes":pageClasses,
    };
  }

  factory Fandom.fromMap(Map<String, dynamic> map) {
    return Fandom(
      fid: map["fid"] as String,
      name: map["name"] as String,
      description: map["description"] as String,
      members: map["members"],
      admins: map["admins"],
      imageUrl: map["image"] as String,
      pageClasses: map["page_classes"],
    );
  }

  int getNumberOfMembers() {
    int member = 0;
    this.members.forEach((key, value) {
      if (value == true) {
        member += 1;
      }
    });
    return member;
  }

}


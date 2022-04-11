class MyPostsResponse {
  MyPostsResponse({
    this.payload,
    // this.paginator,
    this.message,
    this.result,
  });

  List<Payload>? payload;
  // Paginator paginator;
  String? message;
  bool? result;

  factory MyPostsResponse.fromJson(Map<String, dynamic> json) =>
      MyPostsResponse(
        payload: json["payload"] != null
            ? List<Payload>.from(
                json["payload"].map((x) => Payload.fromJson(x)))
            : null,
        // paginator: Paginator.fromJson(json["paginator"]),
        message: json["message"],
        result: json["result"],
      );
}

// class Paginator {
//   Paginator({
//     this.currentPage,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.links,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });

//   int currentPage;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   List<Link> links;
//   dynamic nextPageUrl;
//   String path;
//   int perPage;
//   dynamic prevPageUrl;
//   int to;
//   int total;

//   factory Paginator.fromJson(Map<String, dynamic> json) => Paginator(
//         currentPage: json["current_page"],
//         firstPageUrl: json["first_page_url"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         lastPageUrl: json["last_page_url"],
//         links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//         nextPageUrl: json["next_page_url"],
//         path: json["path"],
//         perPage: json["per_page"],
//         prevPageUrl: json["prev_page_url"],
//         to: json["to"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "first_page_url": firstPageUrl,
//         "from": from,
//         "last_page": lastPage,
//         "last_page_url": lastPageUrl,
//         "links": List<dynamic>.from(links.map((x) => x.toJson())),
//         "next_page_url": nextPageUrl,
//         "path": path,
//         "per_page": perPage,
//         "prev_page_url": prevPageUrl,
//         "to": to,
//         "total": total,
//       };
// }

// class Link {
//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });

//   String url;
//   String label;
//   bool active;

//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"] == null ? null : json["url"],
//         label: json["label"],
//         active: json["active"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url == null ? null : url,
//         "label": label,
//         "active": active,
//       };
// }

class Payload {
  Payload({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.location,
    this.latitude,
    this.longitude,
    this.privacyLevel,
    this.title,
    this.postDate,
    this.moodId,
    this.note,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? location;
  String? latitude;
  String? longitude;
  String? privacyLevel;
  String? title;
  DateTime? postDate;
  int? moodId;
  String? note;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        privacyLevel: json["privacy_level"],
        title: json["title"],
        postDate: DateTime.parse(json["post_date"]),
        moodId: json["mood_id"],
        note: json["note"],
      );
}

class QuoteModel {
  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  int? lastItemIndex;
  List<Results>? results;

  QuoteModel(
      {this.count,
      this.totalCount,
      this.page,
      this.totalPages,
      this.lastItemIndex,
      this.results});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["totalPages"] is int) {
      totalPages = json["totalPages"];
    }
    if (json["lastItemIndex"] is int) {
      lastItemIndex = json["lastItemIndex"];
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    _data["totalCount"] = totalCount;
    _data["page"] = page;
    _data["totalPages"] = totalPages;
    _data["lastItemIndex"] = lastItemIndex;
    if (results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Results {
  String? id;
  String? author;
  String? content;
  List<dynamic>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Results(
      {this.id,
      this.author,
      this.content,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  Results.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["content"] is String) {
      content = json["content"];
    }
    if (json["tags"] is List) {
      tags = json["tags"] ?? [];
    }
    if (json["authorSlug"] is String) {
      authorSlug = json["authorSlug"];
    }
    if (json["length"] is int) {
      length = json["length"];
    }
    if (json["dateAdded"] is String) {
      dateAdded = json["dateAdded"];
    }
    if (json["dateModified"] is String) {
      dateModified = json["dateModified"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["author"] = author;
    _data["content"] = content;
    if (tags != null) {
      _data["tags"] = tags;
    }
    _data["authorSlug"] = authorSlug;
    _data["length"] = length;
    _data["dateAdded"] = dateAdded;
    _data["dateModified"] = dateModified;
    return _data;
  }
}

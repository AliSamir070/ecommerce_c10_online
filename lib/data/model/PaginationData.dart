/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

class PaginationData {
  PaginationData({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  PaginationData.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}
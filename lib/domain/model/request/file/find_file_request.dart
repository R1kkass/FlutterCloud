class FindFileRequest {
  String search;
  int? folderId;
  bool findEveryWhere;
  int page;

  FindFileRequest({
    required this.folderId,
    required this.search,
    required this.findEveryWhere,
    required this.page,
  });
}

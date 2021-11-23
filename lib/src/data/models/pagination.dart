class Pagination {
  int pageSize = 20;
  int currentPage = 0;
  String sort =
      'stock'; // One of the following ascPrice|descPrice|stock|newProduct, default is stock
  int numberOfPages = 0;
  int totalNumberOfResults = 0;
  int totalNumberOfResultsUnfiltered = 0;

  Pagination();

  Pagination.fromMap(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    sort = json['sort'];
    numberOfPages = json['numberOfPages'];
    totalNumberOfResults = json['totalNumberOfResults'];
    totalNumberOfResultsUnfiltered = json['totalNumberOfResultsUnfiltered'];
  }

  copy(Pagination pagination) {
    pageSize = pagination.pageSize;
    currentPage = pagination.currentPage;
    sort = pagination.sort;
    numberOfPages = pagination.numberOfPages;
    totalNumberOfResults = pagination.totalNumberOfResults;
    totalNumberOfResultsUnfiltered = pagination.totalNumberOfResultsUnfiltered;
  }
}

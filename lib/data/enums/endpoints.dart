enum EndPoints {
  topHeadlines,
  everything,
  sources,
}

extension EndPointsBuilder on EndPoints {
  String val<T>({T? data}) {
    switch (this) {
      case EndPoints.topHeadlines:
        return "top-headlines";
      case EndPoints.everything:
        return "everything";
      case EndPoints.sources:
        return "top-headlines/sources";
    }
  }
}

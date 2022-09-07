enum EndPoints {
  getQuiz, //? This is for testing purpose
}

extension EndPointsBuilder on EndPoints {
  String val<T>({T? data}) {
    switch (this) {
      case EndPoints.getQuiz:
        return "usermetadata/Quiz";
    }
  }
}

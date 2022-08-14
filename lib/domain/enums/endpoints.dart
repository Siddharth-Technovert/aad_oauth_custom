enum EndPoint {
  // Endpoint for Api requests
  post(val: 'post'),
  addPost(val: 'post/1');

  const EndPoint({
    required this.val,
  });
  final String val;
}

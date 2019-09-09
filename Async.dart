main(List<String> args) {
  const delays = [2, 3, 5, 1, 7];

  String delayReport(int delay) => "I've been delayed for: $delay seconds";

  Future<String> block(int delay) async =>
      Future.delayed(Duration(seconds: delay), () => delayReport(delay));
  Stream<String> delayFutures = Stream.fromFutures(delays.map(block));
  // Stream of futures
  delayFutures.forEach(print);
}

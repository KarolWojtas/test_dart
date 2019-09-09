import 'dart:io';

main(List<String> args) {
  Stream<String> printFile(Uri filePath) =>
      Stream.fromFuture(File.fromUri(filePath).readAsLines())
          .expand((item) => item);
  printFile(Uri(pathSegments: ['readm_me.txt'])).forEach((item) {
    print("Linia: $item");
  });
}

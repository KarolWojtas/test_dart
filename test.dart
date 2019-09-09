String sayHello(String name, {bool uppercase = false}) {
  var result = 'Hello ${name}';
  return uppercase ? result.toUpperCase() : result;
}

main() {
  print(sayHello('Karol', uppercase: true));
}

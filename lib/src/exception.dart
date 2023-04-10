class HeadElementException implements Exception {
  const HeadElementException();

  final String message = "No <head> element in query selector";
}

// This function checks if the output generated is of form number or not.

bool isNumeric(String result) {
  if (result == null) {
    return false;
  }
  return double.tryParse(result) != null;
}

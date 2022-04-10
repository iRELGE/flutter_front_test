String emptyValidation(String val, String message) {
  if (val.isEmpty) {
    return message;
  }
  return null;
}

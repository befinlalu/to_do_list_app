// Abstract class representing a generic use case with parameters
abstract class UseCase<Type, Params> {
  /// Executes the use case with the provided parameters.
  /// Returns a Future containing the result of the use case.
  Future<Type> call({Params params});
}

/// Failure class is used to represent a failure that can occur in the app
abstract class Failure {}

/// General Failures that can occur in the app
class ClientFailure extends Failure {}

/// Server Failure is used to represent a failure that occurs on the server side
class ServerFailure extends Failure {}

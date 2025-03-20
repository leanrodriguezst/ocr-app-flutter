abstract class BaseViewState<T> {
  const BaseViewState();
}

class Loading<T> extends BaseViewState<T> {
  const Loading();
}

class Error<T> extends BaseViewState<T> {
  final String message;

  const Error(this.message);
}

class Ready<T> extends BaseViewState<T> {
  const Ready();
}

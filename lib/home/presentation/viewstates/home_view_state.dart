sealed class HomeViewState {
  const HomeViewState();
}

class HomeReady extends HomeViewState {
  const HomeReady();
}

class HomeLoading extends HomeViewState {
  const HomeLoading();
}

class HomeError extends HomeViewState {
  final String message;

  const HomeError(this.message);
}

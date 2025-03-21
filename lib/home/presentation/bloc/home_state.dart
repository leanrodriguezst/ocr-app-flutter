part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String photoPath;

  final HomeViewState viewState;
  final HomeNavigatorState? navigatorState;

  const HomeState({
    this.photoPath = '',
    this.viewState = const HomeReady(),
    this.navigatorState,
  });

  @override
  List<Object> get props => [photoPath, viewState];

  HomeState copyWith({
    String? photoPath,
    HomeViewState? viewState,
    HomeNavigatorState? navigatorState,
  }) {
    return HomeState(
      photoPath: photoPath ?? this.photoPath,
      viewState: viewState ?? this.viewState,
      navigatorState: navigatorState,
    );
  }
}

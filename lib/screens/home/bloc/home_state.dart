part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final NewsHomeStatus newsHomeStatus;

  const HomeState({
    this.homeStatus = const InitHomeStatus(),
    this.newsHomeStatus = const InitNewsHomeStatus()
  });

  HomeState updateWith({
    HomeStatus? homeStatus,
    NewsHomeStatus? newsHomeStatus,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      newsHomeStatus: newsHomeStatus ?? this.newsHomeStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    homeStatus,
    newsHomeStatus,
  ];
}

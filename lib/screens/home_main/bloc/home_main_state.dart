part of 'home_main_bloc.dart';

class HomeMainState extends Equatable {
  final HomeMainStatus homeMainStatus;

  const HomeMainState({
    this.homeMainStatus = const InitHomeMainStatus(),
  });

  HomeMainState updateWith({
    HomeMainStatus? homeMainStatus,
  }) {
    return HomeMainState(
      homeMainStatus: homeMainStatus ?? this.homeMainStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    homeMainStatus,
  ];
}

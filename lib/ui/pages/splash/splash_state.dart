import 'package:dog_app/models/enums/load_status.dart';

class SplashState {
  final LoadStatus fetchProfileStatus;

  const SplashState({
    this.fetchProfileStatus = LoadStatus.initial,
  });

  SplashState copyWith({
    LoadStatus? fetchProfileStatus,
  }) {
    return SplashState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
    );
  }

  List<Object?> get props => [
        fetchProfileStatus,
      ];
}

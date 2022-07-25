import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class KickAdminBlocObserver extends BlocObserver {
  final Logger logger = Logger();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.v('${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.v('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.v('$transition');
    super.onTransition(bloc, transition);
  }
}

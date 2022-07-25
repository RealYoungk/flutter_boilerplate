import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kick_admin/src/app/app.dart';
import 'package:kick_admin/src/app/kick_admin_bloc_observer.dart';
import 'package:kick_admin/src/domain/admin/admin.dart';
import 'package:logger/logger.dart';

void bootstrap(AdminRepository adminRepository) {
  final logger = Logger();
  FlutterError.onError = (details) {
    logger.e('${details.exception} stackTrace: ${details.stack}');
  };

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(
            adminRepository: adminRepository,
          ),
        ),
        blocObserver: KickAdminBlocObserver(),
      );
    },
    (error, stack) => logger.e('error: $error, stackTrace: $stack'),
  );
}

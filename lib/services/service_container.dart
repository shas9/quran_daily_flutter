import 'package:kiwi/kiwi.dart';
import 'package:quran_daily/core/network/dio_client.dart';
import 'package:quran_daily/data/datasources/home/home_remote_data_source.dart';
import 'package:quran_daily/domain/repositories/home_repository.dart';
import 'package:quran_daily/presentation/pages/home_page/bloc/home_bloc.dart';

class ServiceContainer {
  static void setup() {
    final KiwiContainer container = KiwiContainer();

    // Network
    container.registerInstance(DioClient());

    // Local storage

    // Register Local Services

    // Register RemoteDataSources
    container.registerSingleton<HomeRemoteDataSource>(
      (c) => HomeRemoteDataSourceImpl(dioClient: container.resolve<DioClient>()),
    );

    // Register Repositories
    container.registerSingleton<HomeRepository>(
      (c) => HomeRepositoryImpl(remoteDataSource: container.resolve<HomeRemoteDataSource>()),
    );

    // Register Bloc
    container.registerInstance(HomeBloc(container.resolve<HomeRepository>()));
  }
}

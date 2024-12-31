import 'package:kiwi/kiwi.dart';
import 'package:quran_daily/core/network/dio_client.dart';
import 'package:quran_daily/data/datasources/home/home_remote_data_source.dart';
import 'package:quran_daily/data/datasources/surah_detail/surah_detail_remote_data_source.dart';
import 'package:quran_daily/domain/repositories/home_repository.dart';
import 'package:quran_daily/domain/repositories/surah_detail_repository.dart';
import 'package:quran_daily/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:quran_daily/presentation/pages/surah_detail_page/bloc/surah_detail_bloc.dart';

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
    container.registerSingleton<SurahDetailRemoteDataSource>(
      (c) => SurahDetailRemoteDataSourceImpl(dioClient: container.resolve<DioClient>()),
    );

    // Register Repositories
    container.registerSingleton<HomeRepository>(
      (c) => HomeRepositoryImpl(remoteDataSource: container.resolve<HomeRemoteDataSource>()),
    );
    container.registerSingleton<SurahDetailRepository>(
      (c) => SurahDetailRepositoryImpl(remoteDataSource: container.resolve<SurahDetailRemoteDataSource>()),
    );

    // Register Bloc
    container.registerInstance(HomeBloc(container.resolve<HomeRepository>()));
    container.registerInstance(SurahDetailBloc(container.resolve<SurahDetailRepository>()));
  }
}

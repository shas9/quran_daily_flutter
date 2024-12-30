import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'surah_detail_bloc_event.dart';
part 'surah_detail_bloc_state.dart';

class SurahDetailBlocBloc extends Bloc<SurahDetailBlocEvent, SurahDetailBlocState> {
  SurahDetailBlocBloc() : super(SurahDetailBlocInitial()) {
    on<SurahDetailBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

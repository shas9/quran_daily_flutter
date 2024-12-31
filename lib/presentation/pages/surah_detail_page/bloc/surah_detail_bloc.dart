import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_daily/data/models/surah_details_model.dart';
import 'package:quran_daily/domain/entities/ayah.dart';
import 'package:quran_daily/domain/repositories/surah_detail_repository.dart';

part 'surah_detail_event.dart';
part 'surah_detail_state.dart';

class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final SurahDetailRepository surahDetailRepository;
  SurahDetailBloc(this.surahDetailRepository) : super(SurahDetailInitial()) {
    on<LoadSurahDetailEvent>(onLoadSurahDetailEvent);
  }

  Future<void> onLoadSurahDetailEvent(LoadSurahDetailEvent event, Emitter<SurahDetailState> emit) async {
    emit(SurahDetailLoading());
    try {
      final surahDetailModel = await surahDetailRepository.getDetailsModelBySurah(event.surahNumber);
      emit(SurahDetailLoaded(surahDetailModel));
    } catch (e) {
      emit(SurahDetailError(e.toString()));
    }
  }
}

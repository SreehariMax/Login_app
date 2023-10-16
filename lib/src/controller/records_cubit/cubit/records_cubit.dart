import 'package:contacts_app/src/controller/records_cubit/cubit/records_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/records.dart';

part 'records_state.dart';

class RecordsCubit extends Cubit<RecordsState> {
  RecordsCubit() : super(RecordsInitial());

  getRecordsData() async {
    emit(RecordsLoading());
    RecordsRepository repository = RecordsRepository();
    List<dynamic>? data = await repository.getData();
    if (data == null) {
      emit(RecordsError());
      return;
    }
    List<RecordModel> records =
        data.map((item) => RecordModel.fromJSON(item)).toList();

    emit(RecordsSuccess(records));
  }
}

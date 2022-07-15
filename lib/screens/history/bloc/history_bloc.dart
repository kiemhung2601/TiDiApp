import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/fake_data/fake_data.dart';
import 'package:socialworkapp/screens/history/bloc/history_status.dart';

import '../../../model/history.dart';
import '../../../model/person.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState()) {
    on<LoadHistory>((event, emit) {
      emit(state.updateWith(historyStatus: const InitHistoryStatus()));
      List<History> lstHis = [];
      if(event.type == null){
        lstHis.addAll(lstHistory);
      } else if(event.type == 0){
        for(int i = 0; i < lstHistory.length; i++){
          if(lstHistory[i].type == 0){
            lstHis.add(lstHistory[i]);
          }
        }
      } else if(event.type == 1){
        for(int i = 0; i < lstHistory.length; i++){
          if(lstHistory[i].type == 1){
            lstHis.add(lstHistory[i]);
          }
        }
      } else if(event.type == 2){
        for(int i = 0; i < lstHistory.length; i++){
          if(lstHistory[i].type == 2){
            lstHis.add(lstHistory[i]);
          }
        }
      }
      emit(state.updateWith(historyStatus: HistoryStatusSuccess(lstHis)));
    });
  }
}

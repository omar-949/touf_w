import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';

part 'total_state.dart';

class TotalCubit extends Cubit<TotalState> {
  TotalCubit() : super(TotalInitial());
  void updateTotal(List<ExtraModel> extraServices, List<ProgramGroupModel> programGroups) {
    double total = 0.0;
    for (var service in extraServices) {
      if (service.extPrice != null) {
        total += (service.extPrice! * service.count);
      }
    }

    for (var program in programGroups) {
      if (program.pPrice != null) {
        total += (program.pPrice! * program.count);
      }
    }

    emit(TotalUpdated(total));
  }
}


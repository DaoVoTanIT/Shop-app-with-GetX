import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/feature/domain/bloc/domain.dart';
import 'package:cmms/feature/domain/repository/domain_repository.dart';
import 'package:get_it/get_it.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  DomainBloc() : super(DomainInitial()) {
    on<CheckDomainEvent>((event, emit) async {
      try {
        emit(DomainLoading());
        var domainRepository = await GetIt.I.getAsync<DomainRepository>();
        var res = await domainRepository.checkToken(event.domain);
        await setValueString(SharedPrefKey.domain, res);
        emit(DomainSuccess());
      } catch (e) {
        emit(const DomainFailure(error: ''));
      }
    });
  }
}

import 'package:flutter_bloc_example/src/git_repository.dart';
import 'package:flutter_bloc_example/src/pages/home_page_events.dart';
import 'package:flutter_bloc_example/src/pages/home_page_state.dart';

import 'package:bloc/bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GitRepository gitRepository;

  HomePageBloc({this.gitRepository});

  @override
  HomePageState get initialState => HomePageStateDefault();

  @override
  Stream<HomePageState> mapEventToState(
      HomePageState currentState, HomePageEvent event) async* {
    if (event is HomePageEventSearch) {
      yield* _mapSearchJobsState(event);
    }
    if (event is HomePageViewJob) {
      yield* _mapViewJobState(event);
    }
  }

  Stream<HomePageState> _mapSearchJobsState(HomePageEventSearch event) async* {
    try {
      yield HomePageStateSearching();
      var result =
          await gitRepository.searchJob(event.jobPosition, event.jobLocation);
      yield HomePageStateSearched(data: result);
    } catch (e) {
      yield HomePageStateError();
    }
  }

  Stream<HomePageState> _mapViewJobState(HomePageViewJob event) async* {
    try {
      yield HomePageStateSearching();
      var result = await gitRepository.viewJob(event.jobId);
      yield HomePageStateSearched(data: result);
    } catch (e) {
      yield HomePageStateError();
    }
  }
}

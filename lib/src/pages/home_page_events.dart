import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent extends Equatable {}

class HomePageEventSearch extends HomePageEvent {
  final String jobPosition;
  final String jobLocation;

  HomePageEventSearch({this.jobPosition, this.jobLocation});

  @override
  String toString() => 'HomePageEventSearch';
}

class HomePageViewJob extends HomePageEvent {
  final String jobId;

  HomePageViewJob({
    this.jobId
    });

  @override
  String toString() => 'HomePageViewJob';
}

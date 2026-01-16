import 'birth_chart.dart';
import 'synastry.dart';
import 'transit.dart';

enum AnalysisType { birthChart, synastry, dailyTransit, monthlyTransit }

abstract class AnalysisItem {
  int get id;
  String get title;
  DateTime get sortDate;
  bool? get hasReading;
  bool? get readingOutdated;
  AnalysisType get type;
  String? get subtitle;
  String? get readingLanguage;
}

class BirthChartAnalysisItem implements AnalysisItem {
  final BirthChart birthChart;

  BirthChartAnalysisItem(this.birthChart);

  @override
  int get id => birthChart.id;

  @override
  String get title => birthChart.fullName;

  @override
  DateTime get sortDate => birthChart.createdOn ?? birthChart.date;

  @override
  bool? get hasReading => birthChart.hasReading;

  @override
  bool? get readingOutdated => birthChart.readingOutdated;

  @override
  AnalysisType get type => AnalysisType.birthChart;

  @override
  String? get subtitle => birthChart.place;

  @override
  String? get readingLanguage => birthChart.readingLanguage;

  bool? get isPersonal => birthChart.isPersonal;
}

class SynastryAnalysisItem implements AnalysisItem {
  final Synastry synastry;

  SynastryAnalysisItem(this.synastry);

  @override
  int get id => synastry.id;

  @override
  String get title => synastry.relationshipTitle;

  @override
  DateTime get sortDate => synastry.createdOn;

  @override
  bool? get hasReading => synastry.hasReading;

  @override
  bool? get readingOutdated => synastry.readingOutdated;

  @override
  AnalysisType get type => AnalysisType.synastry;

  @override
  String? get subtitle => null;

  @override
  String? get readingLanguage => synastry.readingLanguage;
}

abstract class TransitAnalysisItem implements AnalysisItem {
  @override
  bool? get readingOutdated => false;
}

class DailyTransitAnalysisItem extends TransitAnalysisItem {
  final DailyTransitSummary transit;

  DailyTransitAnalysisItem(this.transit);

  @override
  int get id => transit.id;

  @override
  String get title => transit.birthChartName ?? 'Transit';

  @override
  DateTime get sortDate => transit.createdOn;

  @override
  bool? get hasReading => transit.hasReading;

  @override
  AnalysisType get type => AnalysisType.dailyTransit;

  @override
  String? get subtitle => transit.place;

  @override
  String? get readingLanguage => transit.readingLanguage;

  DateTime get transitDate => transit.date;
}

class MonthlyTransitAnalysisItem extends TransitAnalysisItem {
  final MonthlyTransitSummary transit;

  MonthlyTransitAnalysisItem(this.transit);

  @override
  int get id => transit.id;

  @override
  String get title => transit.birthChartName ?? 'Transit';

  @override
  DateTime get sortDate => transit.createdOn;

  @override
  bool? get hasReading => transit.hasReading;

  @override
  AnalysisType get type => AnalysisType.monthlyTransit;

  @override
  String? get subtitle => transit.place;

  @override
  String? get readingLanguage => transit.readingLanguage;

  int get year => transit.year;
  int get month => transit.month;
}

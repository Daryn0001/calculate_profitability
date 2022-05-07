import 'package:flutter/cupertino.dart';

const String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id,
    algorithmCreatingCost,
    salary,
    timeToCreateAlgorithm,
    insuranceInPercents,
    insuranceCost,
    programCreatingCost,
    costOfMachineTime,
    hour,
    day,
    costPerHour,
    costForWritingAndCorrecting,
    timeForFix,
    programmerSalary
  ];

  static final String id = '_id';

  //? 4.1
  static final String algorithmCreatingCost = 'algorithmCreatingCost';
  static final String salary = 'salary';
  static final String timeToCreateAlgorithm = 'timeToCreateAlgorithm';
  static final String insuranceInPercents = 'insuranceInPercents';
  static final String insuranceCost = 'insuranceCost';

  // ? 4.2
  static final String programCreatingCost = 'programCreatingCost';

  static final String costOfMachineTime = 'costOfMachineTime';
  static final String hour = 'hour';
  static final String day = 'day';
  static final String costPerHour = 'costPerHour';

  static final String costForWritingAndCorrecting =
      'costForWritingAndCorrecting';
  static final String timeForFix = 'timeForFix';
  static final String programmerSalary = 'programmerSalary';
}

class Note {
  final int? id;

  //? 4.1
  final double algorithmCreatingCost;
  final int salary;
  final double timeToCreateAlgorithm;
  final int insuranceInPercents;
  final double insuranceCost;

  // ? 4.2
  final double programCreatingCost;

  final double costOfMachineTime;
  final int hour;
  final int day;
  final int costPerHour;

  final double costForWritingAndCorrecting;
  final double timeForFix;
  final int programmerSalary;

  Note({this.id,
    required this.algorithmCreatingCost,
    required this.salary,
    required this.timeToCreateAlgorithm,
    required this.insuranceInPercents,
    required this.insuranceCost,
    required this.programCreatingCost,
    required this.costOfMachineTime,
    required this.hour,
    required this.day,
    required this.costPerHour,
    required this.costForWritingAndCorrecting,
    required this.timeForFix,
    required this.programmerSalary});


  Map<String, dynamic> toJson() =>
      {
        NoteFields.id: id,
        NoteFields.algorithmCreatingCost: algorithmCreatingCost,
        NoteFields.salary: salary,
        NoteFields.timeToCreateAlgorithm: timeToCreateAlgorithm,
        NoteFields.insuranceInPercents: insuranceInPercents,
        NoteFields.insuranceCost: insuranceCost,
        NoteFields.programCreatingCost: programCreatingCost,
        NoteFields.costOfMachineTime: costOfMachineTime,
        NoteFields.hour: hour,
        NoteFields.day: day,
        NoteFields.costPerHour: costPerHour,
        NoteFields.costForWritingAndCorrecting: costForWritingAndCorrecting,
        NoteFields.timeForFix: timeForFix,
        NoteFields.programmerSalary: programmerSalary
      };



  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
      algorithmCreatingCost: json[NoteFields.algorithmCreatingCost] as double,
      salary: json[NoteFields.salary] as int,
      timeToCreateAlgorithm: json[NoteFields.timeToCreateAlgorithm] as double,
      insuranceInPercents: json[NoteFields.insuranceInPercents] as int,
      insuranceCost: json[NoteFields.insuranceCost] as double,
      programCreatingCost: json[NoteFields.programCreatingCost] as double,
      costOfMachineTime: json[NoteFields.costOfMachineTime] as double,
      hour: json[NoteFields.hour] as int,
      day: json[NoteFields.day] as int,
      costPerHour: json[NoteFields.costPerHour] as int,
      costForWritingAndCorrecting: json[NoteFields.costForWritingAndCorrecting] as double,
      timeForFix: json[NoteFields.timeForFix] as double,
      programmerSalary: json[NoteFields.programmerSalary] as int
  );


  Note copy({int? id,
     double? algorithmCreatingCost,
     int? salary,
     double? timeToCreateAlgorithm,
     int? insuranceInPercents,
     double? insuranceCost,
     double? programCreatingCost,
     double? costOfMachineTime,
     int? hour,
     int? day,
     int? costPerHour,
     double? costForWritingAndCorrecting,
     double? timeForFix,
     int? programmerSalary,
  }) => Note(id: id ?? this.id,
      algorithmCreatingCost: algorithmCreatingCost ?? this.algorithmCreatingCost,
      salary: salary ?? this.salary,
      timeToCreateAlgorithm: timeToCreateAlgorithm ?? this.timeToCreateAlgorithm,
      insuranceInPercents: insuranceInPercents?? this.insuranceInPercents,
      insuranceCost: insuranceCost ?? this.insuranceCost,
      programCreatingCost: programCreatingCost ?? this.programCreatingCost,
      costOfMachineTime: costOfMachineTime ?? this.costOfMachineTime,
      hour: hour ?? this.hour,
      day: day ?? this.day,
      costPerHour: costPerHour ?? this.costPerHour,
      costForWritingAndCorrecting : costForWritingAndCorrecting ?? this.costForWritingAndCorrecting,
      timeForFix: timeForFix ?? this.timeForFix,
      programmerSalary : programmerSalary ?? this.programmerSalary);
}

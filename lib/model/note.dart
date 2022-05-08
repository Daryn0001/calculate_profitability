const String tableNotes = 'notes2';

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

  static const String id = '_id';

  //? 4.1
  static const String algorithmCreatingCost = 'algorithmCreatingCost';
  static const String salary = 'salary';
  static const String timeToCreateAlgorithm = 'timeToCreateAlgorithm';
  static const String insuranceInPercents = 'insuranceInPercents';
  static const String insuranceCost = 'insuranceCost';

  // ? 4.2
  static const String programCreatingCost = 'programCreatingCost';

  static const String costOfMachineTime = 'costOfMachineTime';
  static const String hour = 'hour';
  static const String day = 'day';
  static const String costPerHour = 'costPerHour';

  static const String costForWritingAndCorrecting =
      'costForWritingAndCorrecting';
  static const String timeForFix = 'timeForFix';
  static const String programmerSalary = 'programmerSalary';
}

class Note {
  final int? id;

  //? 4.1
  double algorithmCreatingCost;
  int salary;
  double timeToCreateAlgorithm;
  double insuranceInPercents;
  double insuranceCost;

  // ? 4.2
  double programCreatingCost;

  double costOfMachineTime;
  int hour;
  int day;
  int costPerHour;

  double costForWritingAndCorrecting;
  double timeForFix;
  int programmerSalary;
  int costOfMachineTimeHours = 0;
  double depreciationPerMonth = 0;
  double electricityConsumedPerMonth = 0;
  double maintenanceCostsPerMonth = 0;
  int workingDayPerMonth = 0;
  int hourlyWorkingDayRate = 0;

  int initialPrice = 0;
  double annualDepreciationPercentage = 0;
  double requiredPower = 0;
  double operatingTime = 0;
  double electricityTariff = 0;

  int programmerSalary2 = 0;
  int numberOfComputers = 0;

  Note({
      this.id,
      this.algorithmCreatingCost = 0,
      this.salary = 0,
      this.timeToCreateAlgorithm = 0,
      this.insuranceInPercents = 0,
      this.insuranceCost = 0,
      this.programCreatingCost = 0,
      this.costOfMachineTime = 0,
      this.hour = 0,
      this.day = 0,
      this.costPerHour = 0,
      this.costForWritingAndCorrecting = 0,
      this.timeForFix = 0,
      this.programmerSalary = 0
  });

  Map<String, dynamic> toJson() => {
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

  static Note fromJson(Map<String, dynamic> json) => Note(
      id: json[NoteFields.id] as int?,
      algorithmCreatingCost: json[NoteFields.algorithmCreatingCost] as double,
      salary: json[NoteFields.salary] as int,
      timeToCreateAlgorithm: json[NoteFields.timeToCreateAlgorithm] as double,
      insuranceInPercents: json[NoteFields.insuranceInPercents] as double,
      insuranceCost: json[NoteFields.insuranceCost] as double,
      programCreatingCost: json[NoteFields.programCreatingCost] as double,
      costOfMachineTime: json[NoteFields.costOfMachineTime] as double,
      hour: json[NoteFields.hour] as int,
      day: json[NoteFields.day] as int,
      costPerHour: json[NoteFields.costPerHour] as int,
      costForWritingAndCorrecting:
          json[NoteFields.costForWritingAndCorrecting] as double,
      timeForFix: json[NoteFields.timeForFix] as double,
      programmerSalary: json[NoteFields.programmerSalary] as int);

  Note copy({
    int? id,
    double? algorithmCreatingCost,
    int? salary,
    double? timeToCreateAlgorithm,
    double? insuranceInPercents,
    double? insuranceCost,
    double? programCreatingCost,
    double? costOfMachineTime,
    int? hour,
    int? day,
    int? costPerHour,
    double? costForWritingAndCorrecting,
    double? timeForFix,
    int? programmerSalary,
  }) =>
      Note(
          id: id ?? this.id,
          algorithmCreatingCost:
              algorithmCreatingCost ?? this.algorithmCreatingCost,
          salary: salary ?? this.salary,
          timeToCreateAlgorithm:
              timeToCreateAlgorithm ?? this.timeToCreateAlgorithm,
          insuranceInPercents: insuranceInPercents ?? this.insuranceInPercents,
          insuranceCost: insuranceCost ?? this.insuranceCost,
          programCreatingCost: programCreatingCost ?? this.programCreatingCost,
          costOfMachineTime: costOfMachineTime ?? this.costOfMachineTime,
          hour: hour ?? this.hour,
          day: day ?? this.day,
          costPerHour: costPerHour ?? this.costPerHour,
          costForWritingAndCorrecting:
              costForWritingAndCorrecting ?? this.costForWritingAndCorrecting,
          timeForFix: timeForFix ?? this.timeForFix,
          programmerSalary: programmerSalary ?? this.programmerSalary);

  @override
  String toString() {
    return 'Note{id: $id,'
        ' algorithmCreatingCost: $algorithmCreatingCost,'
        ' salary: $salary,'
        ' timeToCreateAlgorithm: $timeToCreateAlgorithm,'
        ' insuranceInPercents: $insuranceInPercents, '
        'insuranceCost: $insuranceCost, '
        'programCreatingCost: $programCreatingCost, '
        'costOfMachineTime: $costOfMachineTime, '
        'hour: $hour, '
        'day: $day, '
        'costPerHour: $costPerHour, '
        'costForWritingAndCorrecting: $costForWritingAndCorrecting, '
        'timeForFix: $timeForFix, '
        'programmerSalary: $programmerSalary}';
  }
}

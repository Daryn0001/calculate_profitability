const String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id,
    projectName,
    totalCostForCreationAndImplementing,
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
    numberOfComputers,
    programmerSalary,
    technicalEquipmentCosts,
    quantityOfComputers,
    costOfOneComputer,
    quantityOfPrinters,
    costOfOnePrinter,
    costOfMachineTimeHours,
    depreciationPerMonth,
    electricityConsumedPerMonth,
    maintenanceCostsPerMonth,
    workingDayPerMonth,
    hourlyWorkingDayRate,
    initialPrice,
    annualDepreciationPercentage,
    requiredPower,
    operatingTime,
    electricityTariff,
    programmerSalary2,
    costOfImplementingProgram,
    workingDayPerMonth2,
    profitabilityStandard,
    profit,
    projectPrice,
    programPrice,
  ];

  static const String id = '_id';
  static const String projectName = 'projectName';

  // ? 4.0
  static const String totalCostForCreationAndImplementing =
      'totalCostForCreationAndImplementing';

  //? 4.1
  static const String algorithmCreatingCost = 'algorithmCreatingCost';
  static const String salary = 'salary';
  static const String timeToCreateAlgorithm = 'timeToCreateAlgorithm';
  static const String insuranceInPercents = 'insuranceInPercents';
  static const String insuranceCost = 'insuranceCost';

  // ? 4.1.2
  static const technicalEquipmentCosts = 'technicalEquipmentCosts';
  static const quantityOfComputers = 'quantityOfComputers';
  static const costOfOneComputer = 'costOfOneComputer';
  static const quantityOfPrinters = 'quantityOfPrinters';
  static const costOfOnePrinter = 'costOfOnePrinter';

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
  static const String numberOfComputers = 'numberOfComputers';

  // ? 4.2.1
  static const costOfMachineTimeHours = 'costOfMachineTimeHours';
  static const depreciationPerMonth = 'depreciationPerMonth';
  static const electricityConsumedPerMonth = 'electricityConsumedPerMonth';
  static const maintenanceCostsPerMonth = 'maintenanceCostsPerMonth';
  static const workingDayPerMonth = 'workingDayPerMonth';
  static const hourlyWorkingDayRate = 'hourlyWorkingDayRate';
  static const initialPrice = 'initialPrice';
  static const annualDepreciationPercentage = 'annualDepreciationPercentage';
  static const requiredPower = 'requiredPower';
  static const operatingTime = 'operatingTime';
  static const electricityTariff = 'electricityTariff';
  static const programmerSalary2 = 'programmerSalary2';

  // ? 4.3
  static const costOfImplementingProgram = 'costOfImplementingProgram';
  static const workingDayPerMonth2 = 'workingDayPerMonth2';

// ? 4.4

  static const profitabilityStandard = 'profitabilityStandard';
  static const profit = 'profit';
  static const projectPrice = 'projectPrice';
  static const programPrice = 'programPrice';
}

class Note {
  final int? id;

  String projectName;
  // ? 4.0
  int totalCostForCreationAndImplementing;

  //? 4.1
  double algorithmCreatingCost;
  int salary;
  double timeToCreateAlgorithm;
  double insuranceInPercents;
  double insuranceCost;

  // ? 4.1.2
  int technicalEquipmentCosts;
  int quantityOfComputers;
  int costOfOneComputer;
  int quantityOfPrinters;
  int costOfOnePrinter;

  // ? 4.2
  double programCreatingCost;

  double costOfMachineTime;
  int hour;
  int day;
  int costPerHour;

  double costForWritingAndCorrecting;
  double timeForFix;
  int programmerSalary;

  // ? 4.2.1
  int costOfMachineTimeHours;
  double depreciationPerMonth;
  double electricityConsumedPerMonth;
  double maintenanceCostsPerMonth;
  int workingDayPerMonth;
  int hourlyWorkingDayRate;
  int initialPrice;
  double annualDepreciationPercentage;
  double requiredPower;
  double operatingTime;
  double electricityTariff;
  int programmerSalary2;
  int numberOfComputers;

  // ? 4.3
  int costOfImplementingProgram;
  int workingDayPerMonth2;

  // ? 4.4
  double profitabilityStandard;
  double profit;
  double projectPrice;
  int programPrice;

  Note({
    this.id,
    this.projectName = 'не указано',
    this.totalCostForCreationAndImplementing = 0,
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
    this.programmerSalary = 0,
    // !
    this.costOfMachineTimeHours = 0,
    this.depreciationPerMonth = 0,
    this.electricityConsumedPerMonth = 0,
    this.maintenanceCostsPerMonth = 0,
    this.workingDayPerMonth = 0,
    this.hourlyWorkingDayRate = 0,
    this.initialPrice = 0,
    this.annualDepreciationPercentage = 0,
    this.requiredPower = 0,
    this.operatingTime = 0,
    this.electricityTariff = 0,
    this.numberOfComputers = 0,
    this.programmerSalary2 = 0,
    this.technicalEquipmentCosts = 0,
    this.quantityOfComputers = 0,
    this.costOfOneComputer = 0,
    this.quantityOfPrinters = 0,
    this.costOfOnePrinter = 0,
    this.costOfImplementingProgram = 0,
    this.workingDayPerMonth2 = 0,
    this.profitabilityStandard = 0,
    this.profit = 0,
    this.projectPrice = 0,
    this.programPrice = 0,
  });

  Map<String, dynamic> toJson() => {
        NoteFields.id: id,
        NoteFields.projectName: projectName,
        NoteFields.totalCostForCreationAndImplementing:
            totalCostForCreationAndImplementing,
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
        NoteFields.programmerSalary: programmerSalary,
        NoteFields.costOfMachineTimeHours: costOfMachineTimeHours,
        NoteFields.depreciationPerMonth: depreciationPerMonth,
        NoteFields.electricityConsumedPerMonth: electricityConsumedPerMonth,
        NoteFields.maintenanceCostsPerMonth: maintenanceCostsPerMonth,
        NoteFields.workingDayPerMonth: workingDayPerMonth,
        NoteFields.hourlyWorkingDayRate: hourlyWorkingDayRate,
        NoteFields.initialPrice: initialPrice,
        NoteFields.annualDepreciationPercentage: annualDepreciationPercentage,
        NoteFields.requiredPower: requiredPower,
        NoteFields.operatingTime: operatingTime,
        NoteFields.electricityTariff: electricityTariff,
        NoteFields.numberOfComputers: numberOfComputers,
        NoteFields.programmerSalary2: programmerSalary2,
        NoteFields.technicalEquipmentCosts: technicalEquipmentCosts,
        NoteFields.quantityOfComputers: quantityOfComputers,
        NoteFields.costOfOneComputer: costOfOneComputer,
        NoteFields.quantityOfPrinters: quantityOfPrinters,
        NoteFields.costOfOnePrinter: costOfOnePrinter,

        NoteFields.costOfImplementingProgram: costOfImplementingProgram,
        NoteFields.workingDayPerMonth2: workingDayPerMonth2,
        NoteFields.profitabilityStandard: profitabilityStandard,
        NoteFields.profit: profit,
        NoteFields.projectPrice: projectPrice,
        NoteFields.programPrice: programPrice,
      };

  static Note fromJson(Map<String, dynamic> json) => Note(
        id: json[NoteFields.id] as int?,
        projectName: json[NoteFields.projectName] as String,
        totalCostForCreationAndImplementing:
            json[NoteFields.totalCostForCreationAndImplementing] as int,
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
        programmerSalary: json[NoteFields.programmerSalary] as int,
        costOfMachineTimeHours: json[NoteFields.costOfMachineTimeHours] as int,
        depreciationPerMonth: json[NoteFields.depreciationPerMonth] as double,
        electricityConsumedPerMonth:
            json[NoteFields.electricityConsumedPerMonth] as double,
        maintenanceCostsPerMonth:
            json[NoteFields.maintenanceCostsPerMonth] as double,
        workingDayPerMonth: json[NoteFields.workingDayPerMonth] as int,
        hourlyWorkingDayRate: json[NoteFields.hourlyWorkingDayRate] as int,
        initialPrice: json[NoteFields.initialPrice] as int,
        annualDepreciationPercentage:
            json[NoteFields.annualDepreciationPercentage] as double,
        requiredPower: json[NoteFields.requiredPower] as double,
        operatingTime: json[NoteFields.operatingTime] as double,
        electricityTariff: json[NoteFields.electricityTariff] as double,
        numberOfComputers: json[NoteFields.numberOfComputers] as int,
        programmerSalary2: json[NoteFields.programmerSalary2] as int,
        technicalEquipmentCosts:
            json[NoteFields.technicalEquipmentCosts] as int,
        quantityOfComputers: json[NoteFields.quantityOfComputers] as int,
        costOfOneComputer: json[NoteFields.costOfOneComputer] as int,
        quantityOfPrinters: json[NoteFields.quantityOfPrinters] as int,
        costOfOnePrinter: json[NoteFields.costOfOnePrinter] as int,
        costOfImplementingProgram:
            json[NoteFields.costOfImplementingProgram] as int,
        workingDayPerMonth2: json[NoteFields.workingDayPerMonth2] as int,
        profitabilityStandard: json[NoteFields.profitabilityStandard] as double,
        profit: json[NoteFields.profit] as double,
        projectPrice: json[NoteFields.projectPrice] as double,
        programPrice: json[NoteFields.programPrice] as int,
      );

  Note copy({
    int? id,
    String? projectName,
    int? totalCostForCreationAndImplementing,
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
    int? costOfMachineTimeHours,
    double? depreciationPerMonth,
    double? electricityConsumedPerMonth,
    double? maintenanceCostsPerMonth,
    int? workingDayPerMonth,
    int? hourlyWorkingDayRate,
    int? initialPrice,
    int? numberOfComputers,
    double? annualDepreciationPercentage,
    double? requiredPower,
    double? operatingTime,
    double? electricityTariff,
    int? programmerSalary2,
    int? technicalEquipmentCosts,
    int? quantityOfComputers,
    int? costOfOneComputer,
    int? quantityOfPrinters,
    int? costOfOnePrinter,
    int? costOfImplementingProgram,
    double? profitabilityStandard,
    double? profit,
    double? projectPrice,
    int? programPrice,
  }) =>
      Note(
        id: id ?? this.id,
        projectName: projectName ?? this.projectName,
        totalCostForCreationAndImplementing:
            totalCostForCreationAndImplementing ??
                this.totalCostForCreationAndImplementing,
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
        programmerSalary: programmerSalary ?? this.programmerSalary,
        costOfMachineTimeHours:
            costOfMachineTimeHours ?? this.costOfMachineTimeHours,
        depreciationPerMonth: depreciationPerMonth ?? this.depreciationPerMonth,
        electricityConsumedPerMonth:
            electricityConsumedPerMonth ?? this.electricityConsumedPerMonth,
        maintenanceCostsPerMonth:
            maintenanceCostsPerMonth ?? this.maintenanceCostsPerMonth,
        workingDayPerMonth: workingDayPerMonth ?? this.workingDayPerMonth,
        hourlyWorkingDayRate: hourlyWorkingDayRate ?? this.hourlyWorkingDayRate,
        initialPrice: initialPrice ?? this.initialPrice,
        annualDepreciationPercentage:
            annualDepreciationPercentage ?? this.annualDepreciationPercentage,
        requiredPower: requiredPower ?? this.requiredPower,
        operatingTime: operatingTime ?? this.operatingTime,
        electricityTariff: electricityTariff ?? this.electricityTariff,
        numberOfComputers: numberOfComputers ?? this.numberOfComputers,
        programmerSalary2: programmerSalary2 ?? this.programmerSalary2,
        technicalEquipmentCosts:
            technicalEquipmentCosts ?? this.technicalEquipmentCosts,
        quantityOfComputers: quantityOfComputers ?? this.quantityOfComputers,
        costOfOneComputer: costOfOneComputer ?? this.costOfOneComputer,
        quantityOfPrinters: quantityOfPrinters ?? this.quantityOfPrinters,
        costOfOnePrinter: costOfOnePrinter ?? this.costOfOnePrinter,
        costOfImplementingProgram:
            costOfImplementingProgram ?? this.costOfImplementingProgram,
        profitabilityStandard:
            profitabilityStandard ?? this.profitabilityStandard,
        profit: profit ?? this.profit,
        projectPrice: projectPrice ?? this.projectPrice,
        programPrice: programPrice ?? this.programPrice,
      );

  @override
  String toString() {
    return '\nNote{'
        '\nid: $id,'
        '\n projectName: $projectName,'
        '\n totalCostForCreationAndImplementing: $totalCostForCreationAndImplementing,'
        ' algorithmCreatingCost: $algorithmCreatingCost,'
        ' salary: $salary,'
        '\n timeToCreateAlgorithm: $timeToCreateAlgorithm,'
        ' insuranceInPercents: $insuranceInPercents, '
        ' insuranceCost: $insuranceCost, '
        '\n programCreatingCost: $programCreatingCost, '
        ' costOfMachineTime: $costOfMachineTime, '
        ' hour: $hour, '
        '\n day: $day, '
        ' costPerHour: $costPerHour, '
        ' costForWritingAndCorrecting: $costForWritingAndCorrecting, '
        '\n timeForFix: $timeForFix, '
        ' programmerSalary: $programmerSalary'
        ' costOfMachineTimeHours: $costOfMachineTimeHours'
        '\n depreciationPerMonth: $depreciationPerMonth'
        ' electricityConsumedPerMonth: $electricityConsumedPerMonth'
        ' maintenanceCostsPerMonth: $maintenanceCostsPerMonth'
        '\n workingDayPerMonth: $workingDayPerMonth'
        ' hourlyWorkingDayRate: $hourlyWorkingDayRate'
        ' initialPrice: $initialPrice'
        '\n annualDepreciationPercentage: $annualDepreciationPercentage'
        ' requiredPower: $requiredPower'
        ' operatingTime: $operatingTime'
        '\n electricityTariff: $electricityTariff'
        ' programmerSalary2: $programmerSalary2'
        ' numberOfComputers: $numberOfComputers'
        '\n technicalEquipmentCosts: $technicalEquipmentCosts'
        ' quantityOfComputers: $quantityOfComputers'
        ' costOfOneComputer: $costOfOneComputer'
        '\n quantityOfPrinters: $quantityOfPrinters'
        ' costOfOnePrinter: $costOfOnePrinter '
        ' costOfImplementingProgram: $costOfImplementingProgram '
        '\n workingDayPerMonth2: $workingDayPerMonth2 '
        ' profitabilityStandard: $profitabilityStandard'
        ' profit: $profit'
        '\n projectPrice: $projectPrice'
        ' programPrice: $programPrice}';
  }
}

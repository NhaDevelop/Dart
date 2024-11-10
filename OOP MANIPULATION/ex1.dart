enum Skill {
  FLUTTER(5000),
  DART(3000),
  OTHER(1000);
  final int bonus;

  const Skill(this.bonus); 
}

class AddressEmp {
  final String _street;
  final String _city;
  final int _zipCode;
  AddressEmp(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  int get zipCode => _zipCode;

  void display() {
    print("Street name: $street, City: $city, ZipCode: $zipCode");
  }
}

class Employee {
  String _name;
  double _baseSalary;
  int _yearOfExperience;
  List<Skill> _skills;

  Employee(this._name, this._baseSalary, this._yearOfExperience, this._skills);

  Employee.mobileDeveloper(String name, double baseSalary, int yearOfExperience)
      : this(name, baseSalary, yearOfExperience, [Skill.FLUTTER, Skill.DART]);

  String get name => _name;
  double get baseSalary => _baseSalary;
  int get yearOfExperience => _yearOfExperience;
  List<Skill> get skills => _skills;

  double computeSalary() {
    double totalSalary = 40000; 

    totalSalary += _yearOfExperience * 2000;
    for (var skill in _skills) {
      totalSalary += skill.bonus; 
    }

    return totalSalary;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$$baseSalary, $yearOfExperience years');
    print('Skills: ${skills.map((skill) => skill.name).join(', ')}');
    print('Total Computed Salary: \$${computeSalary()}');
  }
}

void main() {
  var address = AddressEmp("123 Main St", "PP", 12364523);
  address.display();

  var emp1 = Employee('Sokea', 40000, 8, [Skill.FLUTTER, Skill.OTHER]);
  emp1.printDetails();

  print('**************************************************');

  var address1 = AddressEmp("456 Second St", "NY", 98765432);
  address1.display();

  var emp2 = Employee('Ronan', 45000, 9, [Skill.DART]);
  emp2.printDetails();
}

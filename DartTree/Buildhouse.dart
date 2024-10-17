enum Side {
  north("North"),
  east("East"),
  south("South"),
  west("West");

  final String label;
  const Side(this.label);
  String toString() => label;
}

class Window {
  int floor;
  String color;
  Side side;
  Window(this.color, this.side, this.floor);

  void display() {
    print('Window $color on $side side, Floor: $floor');
  }
}

//class roof
class Roof {
  String type;

  Roof(this.type);

  void display() {
    print('Roof type: $type');
  }
}

//class door
class Door {
  String color;
  Door(this.color);

  void display() {
    print('Door color: $color');
  }
}

class Chimney {
  bool hasChimney;

  Chimney(this.hasChimney);

  void display() {
    print('Chimney present: ${hasChimney ? "Yes" : "No"}');
  }
}

class House {
  List<Window> windows;
  Roof roof;
  Door door;
  Chimney chimney;

  House(this.windows, this.roof, this.door, this.chimney);

  // get hasChimney => this.chimney != null;
  void displayHouse() {
    print("My House");
    roof.display();
    door.display();
    chimney.toString();
    windows.forEach((window) => window.toString());
    print('---------------------');
  }
}

void main() {
  Window window1 = Window('Red', Side.east, 1);
  Window window2 = Window('Green', Side.north, 1);
  Window window3 = Window('Red', Side.west, 2);
  Window window4 = Window('Green', Side.south, 2);

  Roof roof = Roof('Triangle');
  Door door = Door('Black');
  Chimney chimney = Chimney(true);
  House house1 =
      House([window1, window2, window3, window4], roof, door, chimney);
  house1.displayHouse();
  Window window5 = Window('Blue', Side.east, 1);
  Window window6 = Window('Blue', Side.north, 1);
  Roof flatRoof = Roof('Flat');
  Door blackDoor = Door('Black');
  Chimney noChimney = Chimney(false);

  House house2 = House([window5, window6], flatRoof, blackDoor, noChimney);
  house2.displayHouse();
}

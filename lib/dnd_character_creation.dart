import 'dart:math';
import 'dart:io';

List alignment = [
  "Lawful Good",
  "Neutral Good",
  "Chaotic Good",
  "Lawful Neutral",
  "Neutral Neutral",
  "Chaotic Neutral",
  "Lawful Evil",
  "Neutral Evil",
  "Chaotic Evil"];

List raceChoices = [
  'Human',
  'Half-Elf',
  'Elf',
  'Dwarf',
  'Half-Orc',
  'Halfing',
  'Tiefling',
  'Dragonborn',
  'Gnome'
];
List classChoices = [
  'Barbarian',
  'Bard',
  'Cleric',
  'Druid',
  'Fighter',
  'Monk',
  'Paladin',
  'Ranger',
  'Rogue',
  'Sorcerer',
  'Warlock',
  'Wizard'
];

//List skill_score = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30'];
//List skill_modifier = ['-5','-4','-4','-3','-3','-2','-2','-1','-1','0','0','+1','+1','+1','+2','+2','+3','+3','+4','+4','+4','+5','+5','+6','+6','+7','+7','+8','+8','+9','+10'];
Map abilityScoreModifiers = {'1' : '-5', '2' : '-4', '3' : '-4', '4' : '-3', '5' : '-3', '6' : '-2', '7' : '-2', '8' : '-1', '9' : '-1', '10' : '0', '11' : '0', '12' : '+1', '13' : '+1', '14' : '+2', '15' : '+2', '16' : '+3', '17' : '+3', '18' : '+4', '19' : '+4', '20' : '+5', '21' : '+5', '22' : '+6', '23' : '+6', '24' : '+7', '25' : '+7', '26' : '+8', '27' : '+8', '28' : '+9', '29' : '+9', '30' : '+10'};

String strength = randomScore().toString();
String dexterity = randomScore().toString();
String wisdom = randomScore().toString();
String intelligence = randomScore().toString();
String constitution = randomScore().toString();
String charisma = randomScore().toString();

String character() {
  print("Welcome to Dnd 5th edition Character Creation");
  print("Give your character a name");
  String selectedName = stdin.readLineSync();
  print("Give your character a short biography or type 'skip' to skip");
  String selectedBio = stdin.readLineSync();
  print("Choose Your Race");
  print(raceChoices);
  String selectedRace = stdin.readLineSync();
  print("Choose Your Class");
  print(classChoices);
  String selectedClass = stdin.readLineSync();
  print("Choose Your ALignment");
  print(alignment);
  String selectedAlignment = stdin.readLineSync();

  if (selectedRace == "Human") {
    strength = (int.parse(strength) + 1).toString();
    strength = ability(strength);
    dexterity = (int.parse(dexterity) + 1).toString();
    dexterity = ability(dexterity);
    wisdom = (int.parse(wisdom) + 1).toString();
    wisdom = ability(wisdom);
    intelligence = (int.parse(intelligence) + 1).toString();
    intelligence = ability(intelligence);
    constitution = (int.parse(constitution) + 1).toString();
    constitution = ability(constitution);
    charisma = (int.parse(charisma) + 1).toString();
    charisma = ability(charisma);
  }
  else if (selectedRace == "elf") {
    dexterity = (int.parse(dexterity) + 2).toString();
    dexterity = ability(dexterity);
    charisma = (int.parse(charisma) + 1).toString();
    charisma = ability(charisma);
  }

  else if (selectedRace == "Dwarf") {
    strength = (int.parse(strength) + 1).toString();
    strength = ability(strength);
    constitution = (int.parse(constitution) + 2).toString();
    constitution = ability(constitution);
  }
  else if (selectedRace == "Half-Elf") {
    charisma = (int.parse(charisma) + 2).toString();
    charisma = ability(charisma);
    strength = (int.parse(strength) + 1).toString();
    strength = ability(strength);
    intelligence = (int.parse(intelligence) + 1).toString();
    intelligence = ability(intelligence);
  }
  else if (selectedRace == "Half-Orc") {
    strength = (int.parse(strength) + 2).toString();
    strength = ability(strength);
    constitution = (int.parse(constitution) + 1).toString();
    constitution = ability(constitution);
  }
  else if (selectedRace == "Halfing") {
    dexterity = (int.parse(dexterity) + 2).toString();
    dexterity = ability(dexterity);
    wisdom = (int.parse(wisdom) + 1).toString();
    wisdom = ability(wisdom);
  }
  else if (selectedRace == "Tiefling") {
    intelligence = (int.parse(intelligence) + 1).toString();
    intelligence = ability(intelligence);
    charisma = (int.parse(charisma) + 2).toString();
    charisma = ability(charisma);
  }

  else if (selectedRace == "Dragonborn") {
    strength = (int.parse(strength) + 2).toString();
    strength = ability(strength);
    charisma = (int.parse(charisma) + 1).toString();
    charisma = ability(charisma);
  }
  else if (selectedRace == "Gnome") {
    dexterity = (int.parse(dexterity) + 1).toString();
    dexterity = ability(dexterity);
    intelligence = (int.parse(intelligence) + 2).toString();
    intelligence = ability(intelligence);
  }

  print("Calculating strength..." +" " + "$strength");
  print("Calculating dexterity..." +" " + "$dexterity");
  print("Calculating wisdom..." +" " + "$wisdom");
  print("Calculating intelligence..." +" " + "$intelligence");
  print("Calculating constitution..." +" " + "$constitution");
  print("Calculating charisma..." +" " + "$charisma");

  return("$selectedName is a $selectedRace who is a $selectedClass with $selectedAlignment alignment and has following ability scores : "
      "Strength : $strength, Dexterity : $dexterity, Wisdom : $wisdom, Intelligence: $intelligence, Constitutiom : $constitution, Charisma : $charisma");
}


int randomScore(){
  int newRandom;
  var rng = Random();
  return newRandom = 3 + rng.nextInt(18-3);

}

String ability(String initialAbility){
  for(String key in abilityScoreModifiers.keys ){
    if (initialAbility == key){
     initialAbility =  ((int.parse(initialAbility) + int.parse(abilityScoreModifiers[key])).toString());
     return initialAbility;
    }
  }
}

void main() {
  print(character());
}

//TODO : create inventory;
//TODO : create scores for class;
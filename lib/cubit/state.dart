abstract class BmiState{}

class InitState extends BmiState{}

class SelectGender extends BmiState{
  final String selectgender;
  SelectGender(this.selectgender);
}

class IncrementAge extends BmiState{
  final int age;
  IncrementAge(this.age);
}

class DecrementAge extends BmiState{
  final int age;
  DecrementAge(this.age);
}

class IncrementWeight extends BmiState{
  final int weight;
  IncrementWeight(this.weight);
}

class DecrementWeight extends BmiState{
  final int weight;
  DecrementWeight(this.weight);
}

class IncrementHeight extends BmiState{
  final int height;
  IncrementHeight(this.height);
}

class DecrementHeight extends BmiState{
  final int height;
  DecrementHeight(this.height);
}
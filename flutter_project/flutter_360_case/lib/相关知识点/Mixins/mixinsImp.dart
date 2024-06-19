// mixin 的使用
mixin A {
  String info = "this is A";
  void printA() {
    print("A");
  }

  void run() {
    print("A Run");
  }
}

mixin B {
  void printB() {
    print("B");
  }

  void run() {
    print("B Run");
  }
}

class Person {
  String name;
  num age;

  Person(this.name, this.age);
}

// 类D 继承A和B 关键字 with
class D extends Object with A, B {}

// 使用类C扩展Person并混合A和B
class C extends Person with A, B {
  C(String name, num age) : super(name, age);
}

void main() {
  var d = D();
  d.printA(); // 输出 A
  d.printB(); // 输出 B
  d.run(); // 输出 B Run, 因为 B 最后一个被混合

  var c = C("John", 25);
  c.printA(); // 输出 A
  c.printB(); // 输出 B
  c.run(); // 输出 B Run, 因为 B 最后一个被混合
}

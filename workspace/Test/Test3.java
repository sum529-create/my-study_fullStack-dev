class Person {

    private String name;

    private int age;

    public Person(String name, int age) {

        this.name = name;

        this.age = age;

    }

    public void printInfo() {

        System.out.println("이름 : " + name + ", 나이 : " + age + "살");

    }

}

 

class Student extends Person  {

    private String school;

    public Student(String name, int age, String school) {
	super(name, age);

        this.school = school;

    }

    @Override

    public void printInfo() {
	super.printInfo();

        System.out.println("학교 : " + school);

    }

}

 

public class Test3 {
    public static void main(String[] args) {
    Student student = new Student("김철수", 20, "신촌대학교");

    student.printInfo();
    }

}
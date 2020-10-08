package practice;

/*
 * 에일리는 현재 200kcal입니다.
 * 
 * 포도 200kcal을 먹는다.
 * 
 * 피자는 못먹게
 * 
 * 에일리는 현재 400kcal이다.
 * 
 * 			Food[음식이름, 칼로리]
 * Grape							Pizza
 * 
 * Person [현재 칼로리, 이름]
 * 
 * Food  - 음식이름과 칼로리를 받아온다. 음식을 먹는다.
 * Grape - 음식이름, 음식칼로리. 음식을 먹을 수 있다.
 * Pizza - 음식이름, 음식칼로리. 음식을 먹을 수 없다.
 * Person - 이름과 칼로리를 받아온다. 먹을수 있는 음식을 먹은 칼로리를 계산한다. 총 얼마 먹었는가.
 */

class Food{
	
	// field
	private String foodName;
	private int cal;
	
	public Food(String foodName, int cal) {
		super();
		this.foodName = foodName;
		this.cal = cal;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getCal() {
		return cal;
	}

	public void setCal(int cal) {
		this.cal = cal;
	}	
	public void eat() {
		System.out.println(foodName + cal + "kcal 먹는다.");
	}
	
}

interface Eatable{}

class Grape extends Food implements Eatable{
	public Grape(String foodName, int cal) {
		super(foodName, cal);
	}
}

class Pizza extends Food {
	public Pizza(String foodName, int cal) {
		super(foodName, cal);
	}
}

class Person{
	private int ateCal;
	private String name;
	
	public Person(String name) {
		super();
		this.name = name;
	}

	public int getAteCal() {
		return ateCal;
	}

	public void setAteCal(int ateCal) {
		this.ateCal = ateCal;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void eat(Eatable food) {
		((Food)food).eat();
		setAteCal(this.ateCal + ((Food)food).getCal());
	}
	public void info() {
		System.out.println(name + ateCal);
	}
	
}

public class interface_quiz_03 {

	public static void main(String[] args) {
		Person person = new Person("에일리");
		person.setAteCal(200);
		person.info();
		person.eat(new Grape("포도", 200));
		person.info();
	}

}

package ex04_abstract_quiz;
interface Eatable { }  // 먹을 수 있는 음식은 Eatable 인터페이스를 구현하기로 한다.

class Food {
	// field
	private String foodName;
	private int foodCalorie;
	// constructor
	public Food(String foodName, int foodCalorie) {
		super();
		this.foodName = foodName;
		this.foodCalorie = foodCalorie;
	}
	// method
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodCalorie() {
		return foodCalorie;
	}
	public void setFoodCalorie(int foodCalorie) {
		this.foodCalorie = foodCalorie;
	}
	public void eat() {
		System.out.println(foodName + " " + foodCalorie + "kcal를 먹습니다.");
	}
}

class Apple extends Food implements Eatable {
	// constructor
	public Apple(String foodName, int foodCalorie) {
		super(foodName, foodCalorie);
	}
}

class Burger extends Food {  // 먹을 수 없으면 implements Eatable 을 구현하지 않는다.
	// constructor
	public Burger(String foodName, int foodCalorie) {
		super(foodName, foodCalorie);
	}
}

class Person {
	// field
	private int calorie;
	private String name;
	// constructor
	public Person(String name) {
		super();
		this.name = name;
	}
	// method
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	// public void eat(Food food) { } // new Apple, new Burger 모두 가능하다.
	public void eat(Eatable food) {  // Eatable 인터페이스 구현 클래스만 가능하다.
		((Food)food).eat();
		setCalorie(this.calorie + ((Food)food).getFoodCalorie());  // 현재 칼로리 + food 칼로리
	}
	public void info() {
		System.out.println(name + "는 현재 " + calorie + "kcal입니다.");
	}
}

public class Quiz03 {

	public static void main(String[] args) {

		Person p = new Person("제시카");
		
		p.setCalorie(300);
		p.info();  // 제시카는 현재 300kcal입니다.
		
		p.eat(new Apple("청송사과", 200));  // 청송사과 200kcal를 먹습니다.
		p.info();  // 제시카는 현재 500kcal입니다.

		// p.eat(new Burger("빅맥", 1000));  // 못 먹게 막아보세요.
		
	}

}
package ex02_downcasting;

class Animal{
	public void whoAmI() {
		// 아직 모름
		
	}
}

class Lion extends Animal{
	@Override
	public void whoAmI() {
		System.out.println("나는 사자다.");
	}
}

class Shark extends Animal{
	@Override
	public void whoAmI() {
		System.out.println("나는 상어다.");
	}	
}

class Eagle extends Animal{
	@Override
	public void whoAmI() {
		System.out.println("나는 독수리다.");
	}
}

class Zoo{
	// field
	private Animal[] animals;
	private int idx;
	public Zoo() {
		animals = new Animal[10];
		idx = 0;
	}
	
	// method
	
	public void addAnimal(Animal animal) {
		animals[idx++] = animal;
	}
	
	public void info() {
		for(Animal animal : animals) {
			if(animal != null) {
				animal.whoAmI();	// 다형성(polymorphism) : 동일한 코드가 실행이 다르다.
			}
		}
	}
}

public class Ex03_Animal {

	public static void main(String[] args) {
		
		Zoo zoo = new Zoo();
		
		zoo.addAnimal(new Lion());
		zoo.addAnimal(new Shark());
		zoo.addAnimal(new Eagle());
		
		zoo.info();
		
	}

}

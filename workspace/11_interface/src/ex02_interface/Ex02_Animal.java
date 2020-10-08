package ex02_interface;


interface Animal {
	void eat();		// public abstract void eat();
	
	
}

class Lion implements Animal{

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println("사자가 먹는다.");
	}
	// Lion만 가지고 있는 일반 메소드
	public void run() {
		System.out.println("사자는 달린다.");
	}
}

class Shark implements Animal{

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println("상어가 먹는다.");
	}
	// Shark만 가기고 있는 일반 메소드
	
	public void swim() {
		System.out.println("상어는 헤엄친다.");
	}
}


class Eagle implements Animal{

		// TODO Auto-generated method stub

		@Override
		public void eat() {
			// TODO Auto-generated method stub
				System.out.println("독수리가 먹는다.");
		}
		public void fly() {
			System.out.println("독수리는 하늘을 난다.");
		}

}

class Zoo{
	private Animal[] animals;
	private int idx;
	
	// constructor
	public Zoo() {
		animals = new Animal[3];
	}
	
	public void addAnimal(Animal animal) {
		animals[idx++] = animal;
	}
	public void animalListInfo() {
		for(Animal animal : animals) {
			if(animal != null) {
				animal.eat();
				if(animal instanceof Lion) {
					((Lion) animal).run();
				}else if(animal instanceof Shark) {
					((Shark)animal).swim();
				}else if(animal instanceof Eagle) {
					((Eagle)animal).fly();
				}
			}
		}
	}
}

public class Ex02_Animal {

	public static void main(String[] args) {

		Zoo zoo = new Zoo();
		zoo.addAnimal(new Lion());
		zoo.addAnimal(new Shark());
		zoo.addAnimal(new Eagle());
		zoo.animalListInfo();
		
		
	}

}

package project;

public abstract class Permanent extends Employee{

	int salary;
	int bonus;
	
	@Override
	void getName() {
		
		return;
	}

	@Override
	void setName(int salary, int bonus) {
		this.salary = salary;
		this.bonus = bonus;
	}

	@Override
	void getPay() {
		return;
		
	}

}

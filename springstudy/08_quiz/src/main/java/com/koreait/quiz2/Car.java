package com.koreait.quiz2;

public class Car {
	private String model;
	private Engine engine;
	
	public Car() {
		
	}

	public Car(String model, Engine engine) {
		super();
		this.model = model;
		this.engine = engine;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Engine getEngine() {
		return engine;
	}

	public void setEngine(Engine engine) {
		this.engine = engine;
	}
	
	public void infoCar() {
		System.out.println("모델: " + model);
		engine.infoEngine();
	}
}

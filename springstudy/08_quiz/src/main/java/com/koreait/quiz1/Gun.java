package com.koreait.quiz1;

public class Gun {
	private String model;
	private int bullet;
	
	public Gun() {
		// TODO Auto-generated constructor stub
	}
	
	public Gun(String model, int bullet) {
		super();
		this.model = model;
		this.bullet = bullet;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getBullet() {
		return bullet;
	}

	public void setBullet(int bullet) {
		this.bullet = bullet;
	}
	public void infoGun() {
		System.out.println("총기모델: "+ model);
		System.out.println("총알: " + bullet + "발");
	}
	
}

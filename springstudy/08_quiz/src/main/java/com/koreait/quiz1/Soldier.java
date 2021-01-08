package com.koreait.quiz1;

import java.util.HashMap;

public class Soldier {
	private String name;
	private HashMap<String, String> armyInfo;
	private Gun gun;
	
	public Soldier() {
		// TODO Auto-generated constructor stub
	}
	
	public Soldier(String name, HashMap<String, String> armyInfo, Gun gun) {
		super();
		this.name = name;
		this.armyInfo = armyInfo;
		this.gun = gun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public HashMap<String, String> getArmyInfo() {
		return armyInfo;
	}

	public void setArmyInfo(HashMap<String, String> armyInfo) {
		this.armyInfo = armyInfo;
	}

	public Gun getGun() {
		return gun;
	}

	public void setGun(Gun gun) {
		this.gun = gun;
	}
	
	public void infoSolier() {
		System.out.println("이름:"+name);
		for(HashMap.Entry<String, String> entry : armyInfo.entrySet()) {
			System.out.println(entry.getKey() + ": " + entry.getValue());
		}
		gun.infoGun();
	}
}

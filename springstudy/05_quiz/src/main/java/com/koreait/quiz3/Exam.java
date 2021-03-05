package com.koreait.quiz3;

import java.util.ArrayList;

public class Exam {

	// field
	private double average;
	private char grade;
	
	// constructor
	public Exam() {
		
	}
	
	// method
	public void setAverage(ArrayList<Integer> scoreList) {
		double total = 0;
		for ( Integer score : scoreList ) {
			total += score;
		}
		average = total / scoreList.size();
	}
	public void setGrade() {
		if (average >= 90) {
			grade = 'A';
		} else if (average >= 80) {
			grade = 'B';
		} else if (average >= 70) {
			grade = 'C';
		} else if (average >= 60) {
			grade = 'D';
		} else {
			grade = 'F';
		}
	}
	public void examScoreInfo(ArrayList<Integer> scoreList) {
		setAverage(scoreList);
		setGrade();
		System.out.println("average: " + average);
		System.out.println("grade: " + grade);
	}
	public double getAverage() {
		return average;
	}
	public void setAverage(double average) {
		this.average = average;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	
}
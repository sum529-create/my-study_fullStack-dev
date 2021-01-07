package com.koreait.spring;

public class Car {
	// field
		private String model;
		private int price;
		
		// constructor
		public Car() {
			
		}

		// method
		public String getModel() {
			return model;
		}
		public void setModel(String model) {
			this.model = model;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public void carInfo() {
			System.out.println(model + "(" + price + "만원)");
		}
}

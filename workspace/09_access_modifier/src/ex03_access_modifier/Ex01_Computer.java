package ex03_access_modifier;

class Computer{
	
	// field (private)
	private String model;
	private String manufacturer;
	private int price;
	
	// constructor
	
	
	
	// method
	
	
	// setters
	public void setModel(String model) {
		this.model = model;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	// getters
	public String getModel() {
		return model;
	}
	public String getMeanufacturer() {
		return manufacturer;
	}
	public int getPrice() {
		return price;
	}
	
}

public class Ex01_Computer {

	public static void main(String[] args) {
		
		// Computer 클래스 타입의 객체 myCom 생성
		Computer myCom = new Computer();
		
		// computer 클래스 외부에서는 private에 접근이 안된다.
		// myCom.model = "GRAM";
		// 위 작업은 Field 수정 작업이므로 setter를 통해서 해결한다.
		
		myCom.setModel("GRAM");
		myCom.setManufacturer("LG");
		myCom.setPrice(180);
		// 직접 전달방식에서 중간 통로 setter을 통해서 전달을 하게 된다.
		// 잘못된 값(가격 = 마이너스 값)들을 한번 더 확인할 수 있게 함.
		
		// Field를 읽는 것도 안된다. private 값
		// System.out.println(myCom.model);
		// 위 작업은 Field 읽기 작업이므로 getter를 통해서 해결한다.
		System.out.println(myCom.getModel());
		System.out.println(myCom.getMeanufacturer());
		System.out.println(myCom.getPrice());
	}

}

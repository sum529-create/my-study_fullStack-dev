class Computer {

    	private String model;

	private int price;

	public Computer(String model, int price){

    	this.model = model;

    	this.price = price;

	}

	void info(){

    	System.out.println("모델명 : " + model);   

    	System.out.println("가격 : " + price + "만원");

	}
}

 

public class Test2 {

    public static void main(String[] args) {

        Computer myCom = new Computer("GRAM-17", 200);

        myCom.info();

    }

}
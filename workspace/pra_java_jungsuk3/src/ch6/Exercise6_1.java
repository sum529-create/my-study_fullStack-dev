package ch6;

class SutdaCard{
	private int num;
	private boolean isKwang;
	
	public SutdaCard() {
		this.num = 1;
		this.isKwang = true;
	}

	public SutdaCard(int num, boolean isKwang) {
		super();
		this.num = num;
		this.isKwang = isKwang;
	}

	public String info() {
		
		return num + (isKwang? "K" : "");
	}
	
}

public class Exercise6_1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

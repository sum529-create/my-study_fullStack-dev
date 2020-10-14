class Random1{
	public Random1(){
		System.out.println((int)(Math.random()*1000)+1);
		
	}
}

public class Random{
	public static void main(String[] args) {
		Random1 rd = new Random1();
	}

}
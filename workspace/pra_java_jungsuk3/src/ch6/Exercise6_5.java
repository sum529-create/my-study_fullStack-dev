package ch6;

class Student2{
	private String name;
	private int ban, no;
	private int kor, eng, mat;
	

	public Student2(String name, int ban, int no, int kor, int eng, int mat) {
		super();
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	public int getTotal() {
		return kor + eng + mat;
	}
	public double getAverage() {
		return getTotal()/3;
	}
	

	public String info() {
		return name + ", " + ban + ", " + no + ", " + kor + ", " + eng + ", " + mat;
	}
}

public class Exercise6_5 {

	public static void main(String[] args) {
		Student2 s = new Student2("홍길동",1,1,100,60,76);
		System.out.println(s.info());


	}

}

package ch6;

class Student {

	private String name;
	int ban;
	int no;
	int kor;
	int eng;
	int math;
	
	public Student() {	}
	
	public int getTotal() {
		return kor + eng + math;
	}
	public int getAverage() {
		return getTotal()/3;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}


public class Exercise6_4 {

	public static void main(String[] args) {
		Student s = new Student(); 
		 
		s.setName("홍길동"); 
		s.ban = 1; 
		s.no = 1; 
		s.kor = 100; 
		s.eng = 60; 
		s.math = 76;
		
		System.out.println("이름 :"+s.getName()); 
		System.out.println("총점 :"+s.getTotal()); 
		System.out.println("평균 :"+s.getAverage());

	}

}

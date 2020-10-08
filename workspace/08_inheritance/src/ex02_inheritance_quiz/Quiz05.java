package ex02_inheritance_quiz;

// 슈퍼클래스
class Staff{
	
	// field
	String name;		// 이름
	String depart;		// 부서
	
	Staff(String name, String depart){
		this.name = name;
		this.depart = depart;
	}

	public int pay() {
		return 0;
	}
}

//서브 클래스
class SalaryMan extends Staff{
	
	// field
	int salary;			// 기본급 (정해진 급여)

	public SalaryMan(String name, String depart, int salary) {
		super(name, depart);
		this.salary = salary;
	}
	@Override
	public int pay() {
		
		return salary;
	}
	
	
	
}

// 서브 클래스
class SalesMan extends SalaryMan{
	
	// field
	int salesVolume;	// 판매량
	double incentive;	// 인센티브(판매량이 100이상이면 20%, 아니면 5%)
	
	public SalesMan(String name, String depart, int salary) {
		super(name, depart, salary);
		
	}

	public void setSalesVolume(int salesVolume) {
		this.salesVolume = salesVolume;
		if(salesVolume >= 100) {
			incentive = 0.2;
			if(salesVolume / 100 > 1) {
				incentive *= (salesVolume / 100);
			}
		}else {
			incentive = 0.05;
		}
		
		salary += (salary *= incentive);
		
	}
	
	@Override
	public int pay() {
		
		return salary;
	}
}

// 서브 클래스
class Alba extends Staff{
	
	// field
	int times;			// 일한 시간
	int payPerHour;		// 시급
	
	public Alba(String name, String depart, int payPerHour) {
		super(name, depart);
		this.payPerHour = payPerHour;
	}

	public void setTimes(int times) {
		
		payPerHour *= times;
	}


	@Override
	public int pay() {
		
		return payPerHour;
	}
}

public class Quiz05 {

	public static void main(String[] args) {
		
		SalaryMan s1 = new SalaryMan("제임스", "총무부", 300);
		System.out.println("s1의 급여 : " + s1.pay() + "만원");		// s1의 급여 : 300만원
		
		SalesMan s2 = new SalesMan("에밀리", "판매부", 100);
		s2.setSalesVolume(200);	// 판매량 설정
		System.out.println("s2의 급여 : " + s2.pay() + "만원");		// s2의 급여 : 140만원
		
		Alba s3 = new Alba("데이빗", "홍보부", 1);	// 시급 만원
		s3.setTimes(100);	// 일한 시간 설정
		System.out.println("s3의 급여 : " + s3.pay() + "만원");		// s3의 급여 : 100만원
		

	}

}

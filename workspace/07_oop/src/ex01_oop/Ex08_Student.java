package ex01_oop;

class Exam{
	// field
	String examName;
	int kor, eng, mat;	// 0 ~ 100
	double avg;
	char grade;		// A, B, C, D, F [90. 80, 70, ...]
	
	// constructor
	Exam(String examName){
		this.examName = examName;
		setScore();
	}
	
	// method
	void setScore() {
		kor = (int)(Math.random() * 101) + 0;	// 0부터 101개 난수(0~100)
		eng = (int)(Math.random() * 101) + 0;	// 0부터 101개 난수(0~100)
		mat = (int)(Math.random() * 101) + 0;	// 0부터 101개 난수(0~100)
		setAverage();
		setGrade();
	}
	void setAverage() {
		// 평균
		this.avg = (kor + eng + mat)/3.0;
	}
	void setGrade() {
		// 학점 채우기
		if(this.avg >= 90) {
			this.grade = 'A';
		}
		else if(this.avg >= 80) {
			this.grade = 'B';
		}
		else if(this.avg >= 70) {
			this.grade = 'C';
		}
		else if(this.avg >= 60) {
			this.grade = 'D';
		}else{
			this.grade = 'F';
		}
		
	}
	void info() {
		System.out.println(examName + "의 결과");
		System.out.println("국, 영, 수: " + kor + ", " + eng + ", " + mat);
		System.out.println("평균 : " + avg + "(" + grade + ")");
	}
	
}

class Student {
	// field
	String name;
	Exam exam;
	
	// constructor
	Student(String name){
		this.name = name;
		
	}
	
	// method
	void setScore() {
		exam.setScore();
	}
	
	void info() {
		System.out.println("학생이름 : " + name);
		exam.info();
	}

	public void setExam(Exam exam) {
		this.exam = exam;
		
	}
}


public class Ex08_Student {

	public static void main(String[] args) {
		Exam exam1 = new Exam("중간고사");
		Exam exam2 = new Exam("기말고사");
		
		Student student  = new Student("코코");
		
		student.setExam(exam1);
		student.setScore();
		student.info();
		
		System.out.println();
		
		student.setExam(exam2);
		student.setScore();
		student.info();
	}

}

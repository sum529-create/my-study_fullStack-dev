package ex02_exception_class;

import java.util.Scanner;

// 이미 만들어진 예외클래스 : Exception 상속 받는다.
// 개발자가 만드는 예외 클래스 : Exception 상속 받는다.

// Exception 클래스의 생성자 정보
/*

class Exception{
	
	// constructor
	public Exception() {
		super();
	}
	public Exception(String message) {
		super(message);
	}
}
*/

class Person{
	
	// field
	private String name;
	private int age;

	// constructor
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	// method
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}
	
	/*
	 * 메소드가 예외를 처리하는 방법
	 * 1. 직접 try - catch문을 작성한다. (지금 고려할 대상이 아님)
	 * 2. 메소드를 호출하는 곳으로 예외를 던진다.
	 */

	// 매개변수 int age로 전달되는 값에 따라서,
	// 예외가 발생할 수 있는 메소드
	
	public void setAge(int age) throws AgeException {
		if(age < 0 || age > 150) {
			AgeException e = new AgeException("나이는 0~150만 가능합니다.");
			throw e;	// 개발자가 만든 예외는 직접 던진다.
		}
		this.age = age;
	}
	

	/*
	 * 메소드가 예외를 처리하는 방법
	 * 1. 직접 try - catch 문을 작성한다. (지금 고려할 대상이 아님)
	 * 2. 메소드를 호출하는 곳으로 예외를 던진다.
	 */

	////////////////////////////////////////////
	// 1. 직접 try - catch 문을 작성한다.
	/*
	void a() {
		try {
			
		} catch (Exception e) {	}
	}
	void b() {
		try {
			
		} catch (Exception e) {	}
	}
	a();
	b();
	*/
	////////////////////////////////////////////


	////////////////////////////////////////////
	// 2. 메소드를 호출하는 곳으로 예외를 던진다.
	/*
	void a() throws ArithmeticException {
		
	}
	void b() throws NumberFormatException {
		
	}
	
	try {
		a();
		b();
	} catch (Exception e) {
		e.printStackTrace();
	}
	*/
	////////////////////////////////////////////
	
}

	

// 나이가 0 ~ 150 범위가 아니면
// 생성할 예외 클래스

@SuppressWarnings("serial")
class AgeException extends Exception{

	// constructor
	public AgeException(String message) {
		super(message);
		
	}
	
}

public class Ex01_AgeException {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		try {
			System.out.print("나이를 입력하세요 >> ");
			
			// 나이 수정
			int age = sc.nextInt();			
			Person p = new Person("홍길동", 20);
			p.setAge(age);
			System.out.println("변경된 나이 : " + p.getAge());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			sc.close();
		}

	}

}

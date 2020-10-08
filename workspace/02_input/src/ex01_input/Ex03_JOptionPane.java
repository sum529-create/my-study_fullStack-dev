package ex01_input;

import javax.swing.JOptionPane;

public class Ex03_JOptionPane {

	public static void main(String[] args) {
		
		/*
		 * JOptionPane 클래스
		 * 
		 * 1. GUI 컴포넌트를 통한 입력과 출력을 지원
		 * 2. Swing 컴포넌트 이용
		 * 		1) javax.swing 패키지에 저장 (import 필요)
		 * 		2) javax.swing.JOptionPane
		 * 3. 입력 메소드
		 * 		1) showInputDialog()
		 * 		2) 반환되는 값(입력되는 값)의 타입은 언제나 String 이다.
		 * 		3) String 변수 = JOptionPane.showInputDialog("메시지")
		 * 4. 출력 메소드 
		 * 		1) showMessageDialog()
		 * 		2) JOptionPane.showMessageDialog(null, "메소드");
		 *  
		 */
		
		// 이름, 나이, 키, 성별을 입력 받아서 출력하기
		
		// 1) 입력
		String name = JOptionPane.showInputDialog("이름을 입력하세요.");
		String strAge = JOptionPane.showInputDialog("나이를 입력하세요.");
		String strHeight = JOptionPane.showInputDialog("키를 입력하세요.");
		String strGender = JOptionPane.showInputDialog("성별을 입력하세요.");
		
		// 2) 각 변수의 타입에 맞게 변환
		// 나이 : String -> int		Parsing
		// 키 : String -> double
		// 성별 : Stirng -> char	charAt(0)
		
		int age = Integer.parseInt(strAge);
		double height = Double.parseDouble(strHeight);
		char gender = strGender.charAt(0);
		
		// 3) 출력
		String message =  "이름 : " + name + "\n나이 : " + age + "\n키 : " + height + "\n성별 : " + gender;
		JOptionPane.showMessageDialog(null, message);
		
		
	}

}

package ex;

import javax.swing.JOptionPane;

import dao.JobDAO;
import dto.JobDTO;

public class JobManager {

	// FIELD
	private static JobDAO dao = new JobDAO();	// Connection con 이 만들어 졌다.

	// METHOD
	
	// 1. 삽입 메소드
	public static void insert() {
		// 1) 사용자로부터 삽입할 내용을 입력 받는다.
		String job_id = JOptionPane.showInputDialog("job_id를 입력하세요");
		String job_title = JOptionPane.showInputDialog("job_title을 입력하세요");
		int min_salary = Integer.parseInt(JOptionPane.showInputDialog("min_salary를 입력하세요."));
		int max_salary = Integer.parseInt(JOptionPane.showInputDialog("max_salary를 입력하세요."));
		
		// 2) 입력 받는 내용을 JobDTO 객체로 만든다.
		JobDTO dto = new JobDTO(job_id, job_title, min_salary, max_salary);
		
		// 3) JobDAO클래스의 insert() 메소드에 JobDTO 객체를 전달한다.
		int result = dao.insert(dto);
		JOptionPane.showMessageDialog(null, result + "개 직업이 추가되었습니다.");
		
	}
	
	// 2. 갱신 메소드
	public static void update() {
		
	}
	
	// 3. 삭제 메소드
	public static void delete() {
		
	}
	
	// 4. 검색 메소드
	
	
	// 5. 메인 메소드
	public static void main(String[] args) {
		
		String message = "1. 삽입\n2. 갱신\n3. 삭제\n4. 검색\n5. 종료";
		
		while(true) {
			String choice = JOptionPane.showInputDialog(message);
			switch(choice) {
			case "1" : insert(); break;
			case "2" : update(); break;
			case "3" : delete(); break;
			case "5" : JOptionPane.showMessageDialog(null, "프로그램을 종료합니다.");
					 System.exit(0);
			default : JOptionPane.showMessageDialog(null, "잘못된 선택입니다.");
			}
		}
		

	}

}

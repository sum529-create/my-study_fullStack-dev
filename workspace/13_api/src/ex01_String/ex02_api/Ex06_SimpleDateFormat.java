package ex02_api;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Ex06_SimpleDateFormat {

	public static void main(String[] args) {
		
		/* SimpleDateFormat 클래스에서 사용하는 pattern
		// 1. 년
		// 		1) yy
		// 		2) yyyy
		// 2. 월
		// 		1) M
		// 		2) MM
		// 3. 일
		// 		1) d
		// 		2) dd
		// 4. 요일
		// 		1) E
		// 		2) 일~토
		// 5. 오전/오후
		//		1)a
		 * 6. 시
		 * 		1) 12시간
		 * 			(1) h
		 * 			(2) hh
		 * 		2) 24시간
		 * 			(1) H
		 * 			(2) HH
		 * 7. 분
		 * 		1) m
		 * 		2) mm
		 * 8. 초
		 * 		1) s
		 * 		2) ss
		 * 
		 * pattern 없는 날짜 형식
		 * 
		*/
		System.out.println(new Date());
		System.out.println(new java.sql.Date(System.currentTimeMillis()));
		
		// pattern 있는 날짜 만들기
		// pattern : 2020년 10월 13일 화요일 오후 12:30
		String pattern = "yyyy년 MM월 dd일 E요일 a H:mm";
		Date today = new Date();	// 일반 Date (SQL Date도 가능)
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String patternToday = sdf.format(today);
		System.out.println("패턴 날짜 : " + patternToday);
		
		
		
	}

}

package ex04_quiz;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Quiz02 {

	public static void main(String[] args) {
		
		// 기념일 계산하기
		// Calendar 클래스를 이용해 특정 기념일로부터
		// 며칠이 지났는지 출력하시오.
		
		Calendar anniversary = Calendar.getInstance();
		anniversary.set(2015,1,1);

		Calendar today = Calendar.getInstance();
		
		// getTimeInMillis() : Calendar 타입 날짜 -> long타입 숫자(단위)
		long elapseTime = (today.getTimeInMillis() - anniversary.getTimeInMillis());
		
		// 밀리초 -> 초 -> 분 -> 시 -> 일
		long elapseDay = elapseTime / (1000 * 60 * 60 * 24);
		System.out.println("코야와 함께한 일 수 : " + elapseDay + "일❤");
	}

}

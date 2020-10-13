package ex02_api;

import java.util.Calendar;

public class Ex04_Calender {

	public static void main(String[] args) {
		// 1. Caleneder 클래스 타입의 객체(Instance) cal 생성
		// 		new 를 사용하지 않고,
		// 		getInstance 메소드를 사용한다.
		Calendar cal = Calendar.getInstance();	// 현재 날짜와 시간을 생성
		
		
		// 2. 년, 월, 일
		System.out.println("년 : " + cal.get(Calendar.YEAR));
		System.out.println("월 : " + (cal.get(Calendar.MONTH)+1));	// Calendar.MONTH : 0 ~ 11
		System.out.println("일 : " + cal.get(Calendar.DATE));
		
		// 3. 요일 번호
		// 	일(1), 월(2),... 토(7)
		System.out.println("요일 번호 : " + cal.get(Calendar.DAY_OF_WEEK));
		
		// 오늘 요일 출력하기 : 화요일
		switch(cal.get(Calendar.DAY_OF_WEEK)) {
		case 1 : System.out.println("일요일");break;
		case 2 : System.out.println("월요일");break;
		case 3 : System.out.println("화요일");break;
		case 4 : System.out.println("수요일");break;
		case 5 : System.out.println("목요일");break;
		case 6 : System.out.println("금요일");break;
		case 7 : System.out.println("토요일");break;
		}
		
		String[] weekName  = {"", "일", "월", "화", "수", "목", "금", "토"};
		System.out.println(weekName[cal.get(Calendar.DAY_OF_WEEK)] + "요일");
		
		// 4. 오전/오후, 시, 분, 초
		System.out.println("오전/오후: " + cal.get(Calendar.AM_PM));	// 오전(0),오후(1)
		System.out.println("시(12시각): " + cal.get(Calendar.HOUR));	// 0 ~ 11
		System.out.println("시(24시각): " + cal.get(Calendar.HOUR_OF_DAY));	// 0 ~ 23
		System.out.println("분: " + cal.get(Calendar.MINUTE));
		System.out.println("초: " + cal.get(Calendar.SECOND));
		
		// 5. 다른 날짜와 시간으로 변경
		// 2020년 10월 05일 10시 30분 40초
		cal.set(2020, 9, 5, 10, 30, 40);
		System.out.print(cal.toString());
	}

}

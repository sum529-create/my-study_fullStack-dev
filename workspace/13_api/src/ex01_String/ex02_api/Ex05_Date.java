package ex02_api;

import java.util.Calendar;
import java.util.Date;

public class Ex05_Date {

	public static void main(String[] args) {
		
		// 1. 일반 Date : java.util.Date
		// 2. SQL용 Date : java.sql.Date (데이터베이스)
		
		// 일반 Date
		Date date1 = new Date();
		System.out.println("현재 : " + date1);
		
		// Calendar + 일반 Date
		Calendar cal = Calendar.getInstance();
		Date date2 = cal.getTime();
		System.out.println("현재 : " + date2);
		
		// SQL용 Date
		java.sql.Date date3 = new java.sql.Date(System.currentTimeMillis());
		System.out.println("현재 : " + date3);
	}

}

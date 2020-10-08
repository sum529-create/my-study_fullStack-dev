package ex03_array_quiz;

import java.util.Scanner;

public class Quiz05 {

	public static void main(String[] args) {
		
		// 문제. 성적 관리 프로그램
		// 학생 3명의 이름은 "타요", "띠띠뽀", "뽀로로"이다.
		// 각 학생의 성적은 임의의 정수 1개이다.
		// 학생의 점수를 입력 받아서, 평균, 최고 점수, 최저 점수 출력하시오.
		// 실행 예)
		// 타요의 점수 입력 >>> 50
		// 띠띠뽀의 점수 입력 >>> 55
		// 뽀로로의 점수 입력 >>> 60
		// 평균 : 55.5점, 최고:60점, 최저:50점
		
		Scanner sc = new Scanner(System.in);
		
		String[] friendList = {"타요", "띠띠뽀", "뽀로로"};
		double[] score = new double[friendList.length];
		double avg = 0;		// 사실 의미 없는 초기화
		
		for(int i=0; i<friendList.length; i++) {
			System.out.print(friendList[i] + "학생의 점수를 입력하세요 >> ");
			score[i] = sc.nextDouble();
			avg += score[i];
		}

		int max = (int) score[0];
		int min = (int) score[0];
		
		for(int i=0; i<friendList.length; i++) {
			if(score[i] >= max) {
				max = (int) score[i];
			}else if(score[i] <= min){
				min =  (int) score[i];
			}
		}
		
		System.out.println("평균 : " + (avg/friendList.length) + ", 최고 : " + max + "점 , 최저 : " + min + "점");
		
		sc.close();

	}

}

package ex03_array_quiz;

import java.util.Scanner;

public class Quiz12 {

	public static void main(String[] args) {
		
		// 문제. 성적 관리 프로그램
		// 학생 3명 + 과목 3과목
		// 학생 이름 : "타요", "띠띠뽀", "뽀로로"
		// 과목 이름 : "국어", "영어", "수학"
		// 입력 받은 성적들을 합계와 함께 출력하시오.
		// 실행 예)
		// 타요의 국어 점수 >>> 10
		// 타요의 영어 점수 >>> 10
		// 타요의 수학 점수 >>> 10
		// ...
		// 성적 결과
		//        국어 영어 수학 총점
		// 타요   10   10   10   30
		// 띠띠뽀 10   10   10   30
		// 뽀로로 10   10   10   30
		// 합계   30   30   30   90
		
		Scanner sc = new Scanner(System.in);
		
		String[] name = {"타요", "띠띠뽀", "뽀로로", "차탄", "합계"};
		String[] course = {"국어", "영어", "수학", "총점"};
		int[][] score = new int[name.length][course.length];
		
		// 입력과 합계, 총점 계산
		for (int i = 0; i < score.length - 1; i++) {
			for (int j = 0; j < score[i].length - 1; j++) {
				System.out.print(name[i] + "의 " + course[j] + " 점수 입력 >>> ");
				score[i][j] = sc.nextInt();
				// 각각의 점수 : score[i][j]
				// 개인별 총점 : score[i][course.length - 1]
				// 과목별 합계 : score[name.length - 1][j]
				// 전체   합계 : score[name.length - 1][course.length - 1]
				score[i][course.length - 1] += score[i][j];
				score[name.length - 1][j] += score[i][j];
				score[name.length - 1][course.length - 1] += score[i][j];
			}
		}
		
		// 출력
		System.out.print("\t");
		for (int i = 0; i < course.length; i++) {
			System.out.print(course[i] + "\t");
		}
		System.out.println();
		
		for (int i = 0; i < score.length; i++) {
			System.out.print(name[i] + "\t");
			for (int j = 0; j < score[i].length; j++) {
				System.out.print(score[i][j] + "\t");
			}
			System.out.println();
		}
		
		sc.close();
		
	}

}

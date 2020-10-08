package ex02_branch_quiz;

public class Quiz04 {

	public static void main(String[] args) {
		
		// 문제. 나이가 20살 이상이면 "성인", 아니면 "미성년자"를 출력하시오.
		
		int age = 20;
		String re = "성인";
		
		switch(age / 10) {	
		case 0 : 
		case 1 : re = "미성년자";
			
		}
		System.out.println(re);

	}

}

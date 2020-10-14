package ex04_quiz;

class Score{
	private int kor, eng, mat;
	public Score(int kor, int eng, int mat) {
		super();
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(this == obj) {
			return true;
		}
		if(obj instanceof Score) {
			Score score = (Score)obj;
			if(kor == score.kor && eng == score.eng && mat == score.mat  ) {
				return true;
			}
			else {
				return false;
			}
		}
		return false;
	}
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("국어 : ").append(kor);
		sb.append(", 영어 : ").append(eng);
		sb.append(", 수학 : ").append(mat);
		return sb.toString();
	}
}



public class Quiz04 {

	public static void main(String[] args) {
		
		Score score1 = new Score(80, 90, 100);
		Score score2 = new Score(80, 90, 100);
		
		System.out.println(score1.toString()); 	// 국어 : 80, 영어 : 90, 수학 : 100
		System.out.println(score2.toString()); 	// 국어 : 80, 영어 : 90, 수학 : 100
		
		if(score1.equals(score2)) {
			System.out.println("같은 점수이다.");
		}else {
			System.out.println("다른 점수이다.");
		}

	}

}

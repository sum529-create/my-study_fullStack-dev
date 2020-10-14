package ex02_generic_quiz;

class Barret {}

class Marine extends Barret { }
class Firebet extends Barret { }

class Tank { }

class Bunker<M> {
	// field
	private M[] bunker;
	private int count;  // 최대 배열(bunker)의 길이
	private int idx;    // 배열(bunker)의 인덱스 (bunker에 입장한 실제 Marine 수)
	// constructor
	@SuppressWarnings("unchecked")
	public Bunker(int count) {
		// bunker = new M[count];  // 이게 되면 얼마나 좋을까?
		// 배열의 크기 결정은 컴파일 타임에 진행되어야 하는데,
		// generic 타입의 결정은 실행 타임에 결정되므로
		// 컴파일 타임에 generic 타입의 메모리 크기를 알 수 없다.
		// 해결책: Object를 사용한다.
		bunker = (M[])(new Object[count]);  // Object 배열 생성 후 나중에 캐스팅해서 사용
		this.count = count;
		this.idx = 0;  // 생략 가능
	}
	public void add(M item) {
		if (idx == count) {  // full
			return;
		}
		bunker[idx++] = item;
	}
	@Override
	public String toString() {
		return "현재 " + idx + "명의 Marine 입장";
	}
}

public class Quiz01 {

	public static void main(String[] args) {
		
		// 스타크래프트
		Bunker<Barret> bunker = new Bunker<>(10);  // 최대 10명의 Marine 입장 가능
		
		bunker.add(new Marine());
		bunker.add(new Marine());
		bunker.add(new Marine());
		bunker.add(new Firebet());
		
		// bunker.add(new Tank());  // 막아야 할 작업
		
		// toString()
		System.out.println(bunker);  // 현재 3명의 Marine 입장
		
	}

}
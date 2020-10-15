package ex01_list;

// import 자동 정리 : Ctrl + shift+ o
// 1. 없으면 넣어주고,
// 2. 필요 없으면 지워 준다.
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Ex04_LinkedList {

	public static void main(String[] args) {
		List<Integer> list1 = new ArrayList<Integer>();
		List<Integer> list2 = new LinkedList<Integer>();
		
		for(int n =1; n<=10000; n++) {
			list1.add(n);
			list2.add(n);
		}
		
		// ArrayList의 순회 시간
		long start1 = System.nanoTime();
		for(int i =0, size = list1.size(); i<size; i++) {
			System.out.println(list1.get(i));
		}
		long end1 = System.nanoTime();
		System.out.println("총 소요시간 : " + (end1 - start1) + "나노초");

		// LinkedList의 순회 시간
		long start2 = System.nanoTime();
		for(int i =0, size = list2.size(); i<size; i++) {
			System.out.println(list2.get(i));
		}
		long end2 = System.nanoTime();
		System.out.println("총 소요시간 : " + (end2 - start2) + "나노초");
		
	}

}

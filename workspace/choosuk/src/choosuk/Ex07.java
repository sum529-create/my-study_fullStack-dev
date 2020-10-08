package choosuk;

import java.util.Scanner;


class Phone{
	String name, tel;
	
	Phone(String name, String tel){
		this.name = name;
		this.tel = tel;
	}
	
	// 1. 정보 확인
	String getName() {
		return name;
	}
	String getTel() {
		return tel;
	}
	
}
class PhoneBook{
	Phone[] phoneList;
	int num;
	Scanner sc = new Scanner(System.in);
	
	PhoneBook(){}
	
	void addPerson() {
		System.out.print("몇 명의 정보를 저장하시겠습니까? >> ");
		int num = sc.nextInt();
		phoneList = new Phone[num];
		
		for(int i =0; i< phoneList.length; i++) {
			System.out.print("이름과 전화번호(이름과 번호는 빈 칸없이 입력) >> ");
			String name = sc.next();
			String tel = sc.next();	
			phoneList[i] = new Phone(name, tel);

		}
		System.out.println("저장되었습니다.");
	}
	
	String search(String name) {  // 이름을 입력 받아서
		for (int i = 0; i < phoneList.length; i++) {
			if (phoneList[i].getName().equals(name)) {  // 같은 이름이 있으면
				return phoneList[i].getTel();  // 전화번호를 알려 준다.
			}
		}
		return null;  // 같은 이름이 없다는 의미
	}
	
	void info() {
		addPerson();
		while(true) {
			System.out.print("검색할 이름 >> ");
			String name = sc.next();
			if (name.equals("그만")) {
				System.out.println("프로그램을 종료합니다");
				break;
			}
			String tel = search(name);
			if (tel == null) {
				System.out.println(name + " 없습니다.");
			} else {
				System.out.println(name + " 번호는 " + tel + " 입니다.");
			}
		}
		sc.close();
	}
}

public class Ex07 {

	public static void main(String[] args) {

		new PhoneBook().info();
		
		
	}

}

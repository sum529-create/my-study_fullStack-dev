package ch7;

abstract class Unit1{
	int x, y;
	abstract void move(int x, int y);	// 클래스마다 move가 틀리다.
	void stop() {}
	
}


class Marine extends Unit1{ // 현재 위치
	void move(int x, int y) {}
	void stimPack()  { /* 스팀팩을 사용한다.*/} 
} 

class Tank extends Unit1{ //탱크 
	void move(int x, int y) {}
	void changeMode()  { /* 공격모드를 변환한다. */} 
} 
		
class Dropship extends Unit1{ //수송선 
	void move(int x, int y) {}
	void load()  { /* 선택된 대상을 태운다.*/ } 
	void unload()  { /* 선택된 대상을 내린다.*/ } 
}


public class Exercise7_17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

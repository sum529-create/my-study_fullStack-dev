package ch7;

class SutdaDeck1 {
	
	final int CARD_NUM = 20;
	SutdaCard1[] cards = new SutdaCard1[CARD_NUM];

	SutdaDeck1() { 
		/* 문제 7-1의 답이므로 내용생략  */
		for(int i=0; i<cards.length; i++) {
			int num = i%10+1;
			boolean isKwang = (i<10)&&(num==1)||(num ==3)||(num==8);
			
			cards[i] = new SutdaCard1(num, isKwang);
		}
	}

	public void shuffle() {
		SutdaCard1 temp = null;
		for(int i = 0 ; i<cards.length; i++) {
			int rand = (int)(Math.random()*cards.length);
			temp = cards[i];
			cards[i] = cards[rand];
			cards[rand] = temp;
			
		}
		
	} 
	public SutdaCard1 pick(int index) {
		if(index < 0 || index >= CARD_NUM)
			return null;
		return cards[index];
	}

	public SutdaCard1 pick() {
		int rand = (int)(Math.random()*cards.length);
		return pick(rand);
	}

	
	/* (1) 위에 정의된 세 개의 메서드를 작성하시오 . */
	

} // SutdaDeck


class SutdaCard1 {
	int num;
	boolean isKwang;

	SutdaCard1() {
		this(1, true);
	}

	SutdaCard1(int num, boolean isKwang) {
		this.num = num;
		this.isKwang = isKwang;
	}

	public String toString() {
		return num + (isKwang ? "K" : "");
	}
}

class Exercise7_2 {
	public static void main(String args[]) {
		SutdaDeck1 deck = new SutdaDeck1();

		System.out.println(deck.pick(0));
		System.out.println(deck.pick());
		deck.shuffle();
		
		for (int i = 0; i < deck.cards.length; i++)
			System.out.print(deck.cards[i] + ",");
		
		System.out.println();
		System.out.println(deck.pick(0));
	}
}

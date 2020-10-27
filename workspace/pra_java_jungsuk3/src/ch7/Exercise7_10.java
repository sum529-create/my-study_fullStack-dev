package ch7;

class MyTv2 {

	@SuppressWarnings("unused")
	private boolean isPowerOn;

	private int channel;

	private int volume;
	
	private int PrevChannel;

	final int MAX_VOLUME = 100;

	final int MIN_VOLUME = 0;

	final int MAX_CHANNEL = 100;

	final int MIN_CHANNEL = 1; 



        /* (1) 알맞은 코드를 넣어 완성하시오. */
	public void setChannel(int channel) {
		PrevChannel = this.channel;
		this.channel = channel;
		
	}

	public int getChannel() {
		return channel;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getVolume() {
		// TODO Auto-generated method stub
		return volume;
	}

	public void gotoPrevChannel() {
		setChannel(PrevChannel);
		
		
	}


}



class Exercise7_10 {

	public static void main(String args[]) {

		MyTv2 t = new MyTv2();

		t.setChannel(10);

		System.out.println("CH:" + t.getChannel());

		t.setVolume(20);
		System.out.println("VOL:" + t.getVolume());
		
		t.setChannel(20); 
		System.out.println("CH:"+t.getChannel()); 
		t.gotoPrevChannel(); 
		System.out.println("CH:"+t.getChannel()); 
		t.gotoPrevChannel(); 
		System.out.println("CH:"+t.getChannel());


	}

}
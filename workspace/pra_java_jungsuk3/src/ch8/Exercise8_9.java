package ch8;

@SuppressWarnings("serial")
class UnsupportedFuctionException extends RuntimeException{
	private final int ERR_CODE;

	public UnsupportedFuctionException(String msg,int eRR_CODE) {		
		super(msg);
		ERR_CODE = eRR_CODE;
		
	}
	public UnsupportedFuctionException(String msg) {
		this(msg,100);
		
	}
	
	public int getErrorCode() {
		return ERR_CODE;
	}
	
	public String getMessage() {
		return "[" + ERR_CODE + "]" + super.getMessage();
	}
	
	
}


public class Exercise8_9 {

	public static void main(String[] args) throws Exception{
		throw new UnsupportedFuctionException("지원하지 않는 기능입니다.",100);

	}

}

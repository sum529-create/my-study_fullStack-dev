package ch4;

public class Exercise4_12 {

	public static void main(String[] args) {
		for (int i = 1 ; i <= 9 ; i++) { 
			for (int j = 1; j <= 3; j++) { 
				int x = j+1+(i-1)/3*3; 
				int y = i%3==0? 3 : i%3 ;
				if(x > 9) break; 
				System.out.print(x+"*"+y+"="+x*y+"\t");
		} System.out.println(); 
		if(i%3==0) System.out.println(); //
		} 

	}

}

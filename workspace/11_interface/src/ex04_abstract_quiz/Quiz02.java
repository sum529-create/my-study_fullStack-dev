package ex04_abstract_quiz;

interface Tour{		// abstract class
	public abstract void sightseeing();
	public abstract void leisure();
	// 반복되는 constructor를 interface로 받는다.
}

class TourGuide implements Tour{	// extends

	private Tour tour;
	
	
	public TourGuide(Tour tour) {
		super();
		this.tour = tour;
	}
	
	public void sightseeing() {
		tour.sightseeing();
	}
	
	public void leisure() {
		tour.leisure();
	}
}

class GuamTour implements Tour{		// extends


	public GuamTour() {
		
	}

	@Override
	public void sightseeing() {
		System.out.println("투몬비치 여행");
		
	}

	@Override
	public void leisure() {
		System.out.println("패들보트 타기");
		
	}
	
	
}

class KoreaTour implements Tour{


	public KoreaTour() {
		
	}

	@Override
	public void sightseeing() {
		System.out.println("광화문 여행");
		
	}

	@Override
	public void leisure() {
		System.out.println("한강유람선 타기");
		
	}
	
	
}


public class Quiz02 {

	public static void main(String[] args) {
		
		GuamTour tour1 = new GuamTour();
		KoreaTour tour2 = new KoreaTour();
		
		TourGuide guide1 = new TourGuide(tour1);
		TourGuide guide2 = new TourGuide(tour2);
		
		guide1.sightseeing();	// 투몬비치 여행
		guide1.leisure();		// 패들보트 타기
		
		guide2.sightseeing();	// 광화문 여행
		guide2.leisure();		// 한강유람선 타기
		
		
	}

}

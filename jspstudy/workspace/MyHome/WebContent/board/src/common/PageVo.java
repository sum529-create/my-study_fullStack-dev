package common;

public class PageVo {

	// 게시물: record
	// 페이지: page
	// 블록  : block
	
	// 게시물 3개를 한 페이지에 배치
	// 페이지 5개를 한 블록에 배치
	
	private int totalPage = 0;		// 전체 페이지의 개수
	private int totalRecord = 0;	// 전체 게시물의 개수
	private int recordPerPage = 3;	// 한 페이지당 게시물 3개
	
	private int page = 1;			// 현재 페이지 번호(기본 1페이지 사용)
	private int beginRecord = 0;	// 한 페이지에 표시되는 시작 게시물의 번호
	private int endRecord = 0;		// 한 페이지에 표시되는 종료 게시물의 번호
	
	private int pagePerBlock = 5;	// 한 블록당 페이지 5개
	private int beginPage = 0;		// 한 블록에 표시되는 시작 페이지의 번호
	private int endPage = 0;		// 한 블록에 표시되는 종료 페이지의 번호
	
	public int getTotalPage() {
		return totalPage;
	}
	// 전체 페이지 개수는 받아오지 않고 스스로 계산한다.
	// 10 게시물이라하면 1~3페이지 3게시물, 4페이지에서는 2개가 들어가야 함으로
	public void setTotalPage() {
		totalPage = totalRecord / recordPerPage;
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getRecordPerPage() {
		return recordPerPage;
	}
	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getBeginRecord() {
		return beginRecord;
	}
	public void setBeginRecord(int beginRecord) {
		this.beginRecord = beginRecord;
	}
	public int getEndRecord() {
		return endRecord;
	}
	public void setEndRecord(int endRecord) {
		this.endRecord = endRecord;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
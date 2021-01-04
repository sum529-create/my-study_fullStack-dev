package common;

public class Paging {
	
	// 매개변수들은 ListCommand에서 받아오는 데이터
	// 1. String path;			// 어떤 게시판에서 사용할 페이징인가?	(링크 걸어주는 용도) 
	// 예) /MyHome/bbsListPage.bbs 또는 /MyHome/boardListPage.board 등
	// 2. int totalRecord;		// 전체 게시물의 개수
	// 3. int recordPerPage;	// 한 페이지당 게시물 n개	(게시판마다 한 페이지에 표시할 목록의 개수를 다르게 설정하기 위해서 받아온다.)
	// 4. int page				// 현재 페이지 번호(기본 1페이지 사용) 
	// 		<- page에서 직접 받는 것이 아니라 parameter값에서 가져온다. ${param.page}
	
	// api에서 받아올수 있는 데이터 개수가 다르듯 
	// 데이터를 정해놓지 않고 받아와서 사용한다. 
	
	public static String getPaging(String path, int totalRecord, int recordPerPage, int page) {
		// 게시물: record
		// 페이지: page
		// 블록  : block
		
		// 게시물 3개를 한 페이지에 배치
		// 페이지 5개를 한 블록에 배치
		
		// ex) totalRecord = 20 , recordPerPage = 3
		// totalPage - > 7 이 된다.
		// 전체 페이지 개수는 받아오지 않고 스스로 계산한다.
		int totalPage;	// 전체 페이지의 개수
		totalPage = totalRecord / recordPerPage;
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
		totalPage = (totalPage >= page) ? totalPage : page;
		
		// ListCommand에서 필요하다.
		// int beginRecord = 0;	// 한 페이지에 표시되는 시작 게시물의 번호
		// int endRecord = 0;		// 한 페이지에 표시되는 종료 게시물의 번호
		// BBSListCommand에서 계산 beginRecord를 계산한 
		// 변수(int totalRecord, int recordPerPage, int page)가 모두 담겨 잇다.
		// 하지만 Paging에서 beginRecord값과 endRecord값이 필요가 없다.
		// ListCommand에서는 시작과 끝 값에 맞춰서 값을 가져오기 위해서 사용했기 때문.
		// Paging에서 처리하지 않는다. => boardListCommand에서 사용 할 것.
		
		// < 1 2 3 4 5 >
		// beginPage:1  endPAge:5  pagePerBlock:5개
		// pagePerBlock 역시 recordPerPage처럼 불러와서 용도에 따라 
		// 지정할 수 있게 만들수 있음 (능동적)
		// 받아와서 사용할 수 있는 것을 권장하나, 굳이 받아와서 사용할 필요는 없음
		int pagePerBlock = 5;	// 한 블록당 페이지 5개
		int beginPage = 0;		// 한 블록에 표시되는 시작 페이지의 번호
		int endPage = 0;		// 한 블록에 표시되는 종료 페이지의 번호
		
		
		// bbsListPage 에서 Paging이 할 수 없는 것. -> href = "~" 링크
		// 모두 다 다른 링크를 사용하기 때문에 링크를 쓸 수 없다.
		// 따로 받아와야한다.
		
		
		beginPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
		endPage = beginPage + pagePerBlock - 1;
		// 맞지않을 수 있으니 보완
		endPage = endPage < totalPage ? endPage : totalPage;
		
		// 페이징 (< 1 2 3 4 5 >) 만들기
		StringBuffer sb = new StringBuffer();
		
		// bbsListPage와 비슷하게
		// 1) 이전 버튼
		if (beginPage <= pagePerBlock) {
			sb.append("이전&nbsp;");
		} else {
			if(path.indexOf("?") > 0) {	// 경로에 ?가 있을 때(파라미터가 있을 때)
				sb.append("<a href=\"" + path + "&page=" + (beginPage - 1) + "\">이전&nbsp;</a>");
			}else {						// 경로에 ?가 없을 때(파라미터가 없을 때)
				sb.append("<a href=\"" + path + "?page=" + (beginPage - 1) + "\">이전&nbsp;</a>");
			}
		}
		
		/*
		 * /MyHome/boardListPage.board ?page=1
		 * /MyHome/queryBoardListPage.board? column=BTITLE&query=검색어 &page=1 	
		 */
		
		// 2) 페이지 번호
		for (int p = beginPage; p <= endPage; p++) {
			if (p == page) {
				sb.append("<span class=\"disable\">" + p + "&nbsp;</span>");
			} else {
				if(path.indexOf("?")>0) {
					sb.append("<a href=\"" + path + "&page=" + p + "\">" + p + "&nbsp;</a>");
				}else {
					sb.append("<a href=\"" + path + "?page=" + p + "\">" + p + "&nbsp;</a>");
				}
			}
		}
		
		// 3) 다음 버튼
		if (endPage >= totalPage) {  // endPage == totalPage
			sb.append("다음");
		} else {
			if(path.indexOf("?")>0) {
				sb.append("<a href=\"" + path + "&page=" + (endPage + 1) + "\">다음</a>");
			}else {
				sb.append("<a href=\"" + path + "?page=" + (endPage + 1) + "\">다음</a>");
			}
		}
		
		return sb.toString();
	}
}

package com.koreait.classick.common;

public class Paging {

	// 매개변수들은 ListCommand 에게세 받아오는 데이터
	// 1. String path // 어떤 게시판에서 사용하는 페이징 인가? 예) /MyHome/bbsListpage.bbs 또는 /MyHome/boardListpage.board
	// 2. int totalRecord // 전체 게시물의 개수
	// 3. int recordPerPage // 한 페이지당 게시물 개수
	// 4. int page // 현재 페이지 번호

	public static String getPaging(String path, int totalRecord, int recordPerPage, int page) {

		// 게시물 : record
		// 페이지 : page
		// 블록 : block

		// 게시물 3개를 한 페이지에 배치
		// 페이지 5개를 한 블록에 배치

		// 전체 페이지 개수는 받아오지 않고, 스스로 계산한다.
		int totalPage; 			// 전체 페이지의 개수
		totalPage = totalRecord / recordPerPage; 
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
		totalPage = (totalPage > page ? totalPage : page);

		/* ListCommand 에서 작업한다. */
		/*
			int beginRecord = 0;		// 한 페이지에 표시되는 시작 게시물의 번호 
			int endRecord = 0; 		// 한 페이지에 표시되는 종료 게시물의 번호
		*/

		int pagePerBlock = 5;	// 한 블록당 페이지 5개
		int beginPage = 0;		// 한 블록에 표시되는 시작 페이지의 번호
		int endPage = 0;			// 한 블록에 표시되는 종료 페이지의 번호

		beginPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
		endPage = beginPage + pagePerBlock - 1;
		endPage = (endPage > totalPage ? totalPage : endPage);

		// 페이징 ( < 1 2 3 4 5 > ) 만들기
		StringBuffer sb = new StringBuffer();
		
		// 1) 이전 버튼
		if(beginPage <= pagePerBlock) {
			sb.append("<span class=\"disable\"><i class=\"fas fa-caret-left\"></i>&nbsp;</span>");
		} else {
			if(path.contains("?")) {
				sb.append("<a href=\"" + path + "&page=" + (beginPage - 1) + "\"><i class=\"fas fa-caret-left\"></i>&nbsp;</a>");
			}else {
				sb.append("<a href=\"" + path + "?page=" + (beginPage - 1) + "\"><i class=\"fas fa-caret-left\"></i>&nbsp;</a>");
			}
		}
		
		// 2) 페이지 번호
		for (int p = beginPage; p <= endPage; p++) {
			if (p == page) {
				sb.append("<span class=\"disable_p\">" + p + "&nbsp;</span>");
			}else {
				if(path.contains("?")) {
					sb.append("<a href=\"" + path + "&page=" + p + "\">" + p + "&nbsp;</a>");
				}
				else {
					sb.append("<a href=\"" + path + "?page=" + p + "\">" + p + "&nbsp;</a>");
				}
			}
		}
		
		// 3) 다음 버튼
		if(endPage >= totalPage) {
			sb.append("<i class=\"fas fa-caret-right\"></i>");
			// sb.append("<span class=\"disable\"><i class=\"fas fa-caret-right\"></i></span>");
		} else {
			if(path.contains("?")) {
				sb.append("<a href=\"" + path + "&page=" + (endPage + 1) + "\"><i class=\"fas fa-caret-right\"></i></a>");
			}else {
				sb.append("<a href=\"" + path + "?page=" + (endPage + 1) + "\"><i class=\"fas fa-caret-right\"></i></a>");
			}
		}
		
		return sb.toString();
	}
}

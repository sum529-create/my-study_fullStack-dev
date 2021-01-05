package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.BoardDao;
import dto.BoardDto;

public class ReplyInsertCommand2 implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String page = request.getParameter("page");
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String mId = request.getParameter("mId");
		int bNo = Integer.parseInt(request.getParameter("bNo"));	// 댓글 고유 번호 -> 현 번호 10 10 /n 현 번호 11 10 ...
		String bIp = request.getRemoteAddr();
		
		/* bNo	 bTitle		 bGroup		 bGroupOrd		 bDepth 
		10		게시글10	10				0				0 (게시글)
		11		ㄴ 댓글1	10				3				1 (댓글)
		12		ㄴ 댓글2	10				2				1 (댓글)    +
		13		 ㄴ 대댓	10				1				2 (대댓글) */
		
		/* 댓글 삽압 시
		1. bGroup: 게시글 bNo와 같다.
		2. bGroupOrd
			1) 1을 가진다.
			2) 기존 댓글들의 bGroupOrd를 1씩 증가시킨다.
		3. bDepth: 게시글의 bDepth + 1이다.
		 */
		
		// 댓글이 달릴 게시글의 정보 가져오기
		BoardDto boardDto = BoardDao.getInstance().boardView(bNo);	// 이미 만들어진 boardView로 사용 (같은 구문)
		
		// 댓글 만들기
		BoardDto replyDto = new BoardDto();
		replyDto.setbTitle(bTitle);
		replyDto.setbContent(bContent);
		replyDto.setmId(mId);
		replyDto.setbIp(bIp);
		replyDto.setbGroup(bNo); 	// reply 구조 잘 참조할 것.
		replyDto.setbGroupOrd(1);
		replyDto.setbDepth(boardDto.getbDepth()+1);
		
		// 댓글 삽입
		int result = BoardDao.getInstance().replyInsert(replyDto);
		
		// 기존에 달린 댓글들의 bGroupOrd를 모두 1씩 증가시킨다.
		// (가장 먼저 달린 댓글의 bGroupOrd 값이 가장 크다.)
		// 기존에 달린 댓글: bGroup이 같고, bGroupOrd가 0이 아닌 (bDepth가 0이 아닌) 게시글
		if(result > 0) {
			//BoardDao.getInstance().replyUpdateGroupOrd(bNo);
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/replyInsertResult.jsp?result=" + result + "&page=" + page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}

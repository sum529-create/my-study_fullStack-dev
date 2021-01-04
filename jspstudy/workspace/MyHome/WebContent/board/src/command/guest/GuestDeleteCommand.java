package command.guest;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GuestDao;

public class GuestDeleteCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 첨부파일이 있으면 서버 storage 디렉토리에서 삭제
		String gFilename = request.getParameter("gFilename");
		String directory = "storage";
		String realPath = request.getServletContext().getRealPath(directory);
		
		File file = new File(realPath, gFilename);
		if(file.exists()) {
			file.delete();
		}
		
		// DB에서 삭제
		String strgNo = request.getParameter("gNo");
		int gNo = 0;
		if(strgNo != null && !strgNo.isEmpty()) {
			gNo = Integer.parseInt(strgNo);
		}
		int result = GuestDao.getInstance().guestDelete(gNo);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("guest/guestDeleteResult.jsp?result="+result);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}

package command.guest;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GuestDao;

public class GuestDeleteFileCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		String gFilename = request.getParameter("gFilename");
		String directory = "storage";
		String realPath = request.getServletContext().getRealPath(directory);
		
		File file = new File(realPath, gFilename);
		int gNo = 0;
		if(file.exists()) {
			// 1. 서버 storage 디렉토리에서 gFilename 지우기
			file.delete();
			// 2. DB에서 gFilename 지우기
			gNo = Integer.parseInt(request.getParameter("gNo"));
			GuestDao.getInstance().guestDeleteFile(gNo);
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("/MyHome/guestViewPage.guest?gNo="+gNo);
		pathNRedirect.setRedirect(true);	// DB가 수정되면 redirect
		return pathNRedirect;
	}

}

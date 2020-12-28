package command.guest;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.PathNRedirect;
import dao.GuestDao;
import dto.GuestDto;

public class GuestInsertCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		String directory = "storage";
		String realPath = request.getServletContext().getRealPath(directory);
		
		File dir = new File(realPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		MultipartRequest multipartRequest = null;
		GuestDto guestDto = null;
		try {
			multipartRequest = new MultipartRequest(request, realPath, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
			String gTitle = multipartRequest.getParameter("gTitle");
			String gWriter = multipartRequest.getParameter("gWriter");
			String gPw = multipartRequest.getParameter("gPw");
			String gFilename = multipartRequest.getParameter("gFilename");
			String gContent = multipartRequest.getParameter("gContent");
			
			guestDto = new GuestDto();
			guestDto.setgTitle(gTitle);
			guestDto.setgWriter(gWriter);
			guestDto.setgPw(gPw);
			guestDto.setgFilename(gFilename);
			guestDto.setgContent(gContent);
			if(multipartRequest.getFile("gFilename") == null) {
				guestDto.setgFilename("");
			}
			else {
				guestDto.setgFilename(multipartRequest.getFilesystemName("gFilename")); // 고의적으로 저장시킬 파일이름
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		int result =GuestDao.getInstance().insert(guestDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("guest/guestInsertResult.jsp?result=" + result);
		pathNRedirect.setRedirect(true);	// redirect / int result
		return pathNRedirect;
	}

}

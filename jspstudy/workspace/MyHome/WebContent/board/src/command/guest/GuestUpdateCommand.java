package command.guest;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.PathNRedirect;
import dao.GuestDao;
import dto.GuestDto;

public class GuestUpdateCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		String directory = "storage";
		String realPath = request.getServletContext().getRealPath(directory);
		
		MultipartRequest multipartRequest = null;
		try {
			multipartRequest = new MultipartRequest(request, realPath, 1024 * 1024 *10, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		GuestDto guestDto = new GuestDto();
		guestDto.setgTitle(multipartRequest.getParameter("gTitle"));
		guestDto.setgContent(multipartRequest.getParameter("gContent"));
		guestDto.setgNo(Integer.parseInt(multipartRequest.getParameter("gNo")));
		
		// 새로 첨부하려는 파일
		File newFile = multipartRequest.getFile("gFilename");
		
		// 기존 첨부되어 있는 파일
		String oldFile = multipartRequest.getParameter("gFilename2");
		
		// 새로운 첨부와 기존 첨부가 모두 존재하면 기존 첨부를 서버에서 삭제한다.
		if(newFile != null && oldFile != null) {
			File file = new File(realPath, oldFile);
			if(file.exists()) {
				file.delete();
			}
		}
		
		// 새로운 첨부가 있으면, 새로운 첨부파일의 이름을 DB에 저장한다.
		
		if(newFile != null) {
			guestDto.setgFilename(multipartRequest.getFilesystemName("gFilename")); // getFilesystemName(arg0) : 실제 파일에 저장된 이름
		}
		
		int result = GuestDao.getInstance().guestUpdate(guestDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("guest/guestUpdateResult.jsp?result="+result+"&gNo="+multipartRequest.getParameter("gNo"));
		pathNRedirect.setRedirect(true);
		
		return pathNRedirect;
	}

}

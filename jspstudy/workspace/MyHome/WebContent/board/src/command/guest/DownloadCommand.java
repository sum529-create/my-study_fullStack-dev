package command.guest;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadCommand {
	
	// new DownloadCommand() 해서 객체를 만들 필요가 없도록 static처리
	// DownloadCommand.download(request, response) 호출
	public static void download(HttpServletRequest request, HttpServletResponse response) {
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
				
			String gFilename = request.getParameter("gFilename");
			String directory = "storage";
			
			String realPath = request.getServletContext().getRealPath(directory);
			
			File file = new File(realPath, gFilename);
			
			response.setHeader("Content-Type", "application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(gFilename, "UTF-8"));
			response.setHeader("Content-Length", file.length() + ""); 	// "" String 변환 위해서
			bis = new BufferedInputStream(new FileInputStream(file));
			bos = new BufferedOutputStream(response.getOutputStream());
			
			byte[] byteArray = new byte[1024];	// 1KB
			while((bis.read(byteArray))!= -1) {
				bos.write(byteArray);
			}
			
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(bos != null) {
					bos.close();
				}
				if(bis != null) {
					bis.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
}

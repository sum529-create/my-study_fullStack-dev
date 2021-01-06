<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="javax.imageio.stream.FileImageInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	String directory = request.getParameter("directory");
	String filename = request.getParameter("filename");
	
	// 1. realPath 알아내기
	String realPath = request.getServletContext().getRealPath(directory);
	
	// 2. filename을 이용해서 File 객체 생성하기
	// File file = new File(realPath, filename);	// new File(realPath + "/" + filename);
	File file = new File(realPath, filename);
	
	// 3. (이건 다운로드다)라는 헤더 타입을 만든다.
	// 파일의 이름과 파일의 길이가 필요하다.
	// 서버 -> 사용자 : response의 헤더 작업
	// response.setContentType("application/x-msdownload");	// 아래와 같은 코드입니다.
	response.setHeader("Content-Type", "application/x-msdownload");											// 정규식 패턴을 만드는 형식, 문자더하기 형식이다.  + <- 정규식 표현 방식이다. 자바스크립트 form영역 참조
	response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " "));
	// response.setContentLengthLong(file.length()); // 아래와 같은 코드입니다.
	response.setHeader("Content-Length", file.length() + "");
	
	// 4. 진짜 다운로드를 진행한다. (파일 복사와 유사한 프로그램)
	//    모든 파일을 처리할 수 있는 바이트 기반 스트림을 사용한다.
	BufferedInputStream bis = null;
	BufferedOutputStream bos = null;
	
	try{
		// JSP에서 OutputStream을 사용하려면
		// JSP와 Servlet의 출력스트림 겹침 방지(IllegalStateException 발생 방지)처리가 필요하다.
		out.clear();
		out = pageContext.pushBody();
		
		bis = new BufferedInputStream(new FileInputStream(file));
		bos = new BufferedOutputStream(response.getOutputStream());
		
		// 한 번에 옮기기
		// file.length() 만큼 byte 배열을 확보해서 옮긴다.
		byte[] array = new byte[(int)file.length()];
		
		// 서버에서 읽기
		bis.read(array, 0, (int)file.length());
		// 읽은 내용을 array배열 0번 인덱스부터 길이만큼 영역에 저장해라.
		// (int)file.length() -> 길이가 10이라면
		// bis.read(array, 0, 10) : array배열의 0번인덱스부터 10개 공간 사용해서 저장해라.
		
		
		// 사용자에게 쓰기
		bos.write(array);
	}catch(FileNotFoundException e){
		
	}catch(IOException e){
		
	}finally{
		try{
			if (bos != null){
				bos.close();
			}
			if(bis != null){
				bis.close();
			}
		}catch(Exception e){
			
		}
	}
	
%>
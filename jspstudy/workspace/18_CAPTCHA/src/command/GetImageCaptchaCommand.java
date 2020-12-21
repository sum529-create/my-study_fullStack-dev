package command;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import common.PathNRedirect;

public class GetImageCaptchaCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		// 네이버 캡차 API
		// 1) 키 발급 요청하기
		// 2) 캡차 이미지 요청하기
		String clientId = "DSglvfn2ImQlFCT1U2vo"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "cqlsmxKcTj"; //애플리케이션 클라이언트 시크릿값";
        
        // 1) 키 발급 요청하기
        String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
        String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
        
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL, requestHeaders);
        // System.out.println(responseBody);	// {"key":"ZxJhfHMFnwQXSDH7"} -> CAPTCHA_KEY에게 전송
        // responseBody는 {"key":"ZxJhfHMFnwQXSDH7"}와 같은 형식의 JSON 데이터
        
        // json-simple-1.1.1.jar를 이용해서 responseBody에서 "ZxJhfHMFnwQXSDH7"를 뺀다.
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
			obj = (JSONObject)parser.parse(responseBody);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        
        // 입력값 비교(InputKeyCheckCommand)에서 캡차 키를 필요로 하므로,
        // session에 올려둔다.
        // session은 request에서 알아낸다.
        HttpSession session = request.getSession();
        session.setAttribute("key", (String)obj.get("key"));
        
        // 2) 캡차 이미지 요청하기
        String key = (String)obj.get("key"); // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
        // 이미지 실패용 (아무거나 넘김) String key = "aldfakjlkajgj";
        String apiURL2 = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;

        // requestHeaders는 1) 캡차 키 발급 요청에서 이미 생성했으므로 또 생성할 필요가 없다.
        // 위에서 이미 생성했다.
		/*
		 * Map<String, String> requestHeaders = new HashMap<>();
		 * requestHeaders.put("X-Naver-Client-Id", clientId);
		 * requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		 */
        
        // responseBody2
        // 1) 성공 : 이미지 캡차가 생성되었습니다.
        // 2) 실패 : {"result":false, "errorMessage":"Invalid key.", "errorCode":"CT001"}
        // String responseBody2 = get2(apiURL2,requestHeaders);
        
        // 성공했을 때는 캡차 이미지 파일이 생성되므로 생성된 파일명을 알아야 한다. 
        String filename = get2(request, apiURL2, requestHeaders);
        // System.out.println(filename);
        PathNRedirect pathNRedirect = new PathNRedirect();
        pathNRedirect.setPath("login/loginPage.jsp");
        pathNRedirect.setRedirect(false); // request에 realPath, filename 저장되어 있으므로 forward
		return pathNRedirect;
	}
	
	// 1) 캡차 키 발급 요청용 get() 메소드
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	
	
	
	// 1) 캡차 키 발급 요청용 connect() 메소드
    // 2) 캡차 이미지 요청용 connect() 메소드
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
    
    // 2) 캡차 이미지 요청욜 readBody() 메소드
    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
    // 2) 캡차 이미지 요청욜 get2() 메소드
    private static String get2(HttpServletRequest request, String apiUrl, Map<String, String> requestHeaders){
    	HttpURLConnection con = connect(apiUrl);
    	try {
    		con.setRequestMethod("GET");
    		for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
    			con.setRequestProperty(header.getKey(), header.getValue());
    		}
    		
    		int responseCode = con.getResponseCode();
    		if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
    			// getImage()에 request를 전달하려면 get2()메소드가 HttpServletRequest request를 받아와야 한다.
    			// 기존 : get2(String apiUrl, Map<String, String>requestsHeaders){
    			// 수정 : get2(HttpServletRequest request, String apiUrl, Map<String, String>requestsHeaders){
    			return getImage(request, con.getInputStream());
    		} else { // 에러 발생
    			return error(con.getErrorStream());
    		}
    	} catch (IOException e) {
    		throw new RuntimeException("API 요청과 응답 실패", e);
    	} finally {
    		con.disconnect();
    	}
    }
    // 2) 캡차 이미지 요청욜 getImage() 메소드
    private static String getImage(HttpServletRequest request, InputStream is){
        int read;
        byte[] bytes = new byte[1024];
        // 랜덤한 이름으로  파일 생성 (현재 시간: timestamp)
        // 현재 시간: timestamp으로 파일 생성(o)
        String filename = Long.valueOf(new Date().getTime()).toString();
        
        // 캡차 이미지가 저장될 storage 디렉토리의 경로를 알아낸다.
        String directory = "storage";
        // httpServletRequest request가 있어야 realPath를 구할 수 있다.
        // 따라서 execute() 메소드에게서 HttpServletRequest request를 받아 온다.
        // 기존: getImage(InputStream is){ ... }
        // 수정: getImage(HttpServletRequest request, InputStream is)
        
        String realPath = request.getServletContext().getRealPath(directory);
        
        // storage 디렉토리가 안 생기면 강제로 만들어 주는 코드
        File dir = new File(realPath);	// File dir에는 storage 디렉토리 정보가 저장된다.
        if(!dir.exists()) {		// dir(storage 디렉토리)이 없으면
        	dir.mkdirs();	// 해당 디렉토리(storage 디렉토리)를 생성하라.
        }
        
        // storage 디렉토리 경로를 포함하도록 File f를 수정한다.
        // 기존 : File f = new File(filename + ".jpg");
        // 수정 : File f = new File(realPath, filename + ".jpg");
        File f = new File(realPath, filename + ".jpg");
        try(OutputStream outputStream = new FileOutputStream(f)){
            f.createNewFile();
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            // directory(상대경로)와 filename을 JSP(로그인화면)에서 확인할 수 있도록
            // request에 저장해 둔다.
            request.setAttribute("filename", filename + ".jpg");
            request.setAttribute("directory", directory);
            // GetImageCaptchaCommand의 execute() 메소드는 PathNRequest를 반환하는데,
            // 이 때 반환방법은 forward이다. (request의 데이터 유지를 위해서) 
            
            
            
            
            // return "이미지 캡차가 생성되었습니다.";
            return filename;
        } catch (IOException e) {
            throw new RuntimeException("이미지 캡차 파일 생성에 실패 했습니다.",e);
        }
    }

    // 2) 캡차 이미지 요청욜 error() 메소드
    private static String error(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

    
    
    
    
    
}

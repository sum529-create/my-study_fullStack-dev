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
        
        // 2) 캡차 이미지 요청하기
        String key = "CAPTCHA_KEY"; // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
        String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

        System.out.println(responseBody);
        
		return null;
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
    
    // 2) 캡차 이미지 요청욜 getImage() 메소드
    private static String getImage(InputStream is){
        int read;
        byte[] bytes = new byte[1024];
        // 랜덤한 이름으로  파일 생성
        String filename = Long.valueOf(new Date().getTime()).toString();
        File f = new File(filename + ".jpg");
        try(OutputStream outputStream = new FileOutputStream(f)){
            f.createNewFile();
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            return "이미지 캡차가 생성되었습니다.";
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

    
    
    // 2) 캡차 이미지 요청욜 get2() 메소드
 	private static String get2(String apiUrl, Map<String, String> requestHeaders){
         HttpURLConnection con = connect(apiUrl);
         try {
             con.setRequestMethod("GET");
             for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                 con.setRequestProperty(header.getKey(), header.getValue());
             }

             int responseCode = con.getResponseCode();
             if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                 return getImage(con.getInputStream());
             } else { // 에러 발생
                 return error(con.getErrorStream());
             }
         } catch (IOException e) {
             throw new RuntimeException("API 요청과 응답 실패", e);
         } finally {
             con.disconnect();
         }
     }
    
    
    
}

package command;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import common.PathNRedirect;

public class InputKeyCheckCommand implements Command {
	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {

		
		String clientId = "DSglvfn2ImQlFCT1U2vo";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "cqlsmxKcTj";//애플리케이션 클라이언트 시크릿값";

        String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅

        // session에서 key가져오면 발급 받은 캡차 발급 키를 알 수 있다.
        HttpSession session = request.getSession();
        
        String key = (String)session.getAttribute("key"); // 캡차 키 발급시 받은 키값
        
        String value = request.getParameter("input_key"); // 사용자가 입력한 캡차 이미지 글자값
        String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value=" + value;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL, requestHeaders);

        System.out.println(responseBody);
        // responseBody
        // 성공 : {"result":true,"responseTime":23.27} 
        // 실패 : {"result":false,"responseTime":5.26} 
        
        // result를 responseBody에서 꺼낸다.
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
        	obj = (JSONObject)parser.parse(responseBody);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        boolean result = (boolean)obj.get("result");
        
        
        // loginResult.jsp로 result값(true, false)을 보내기 위해서
        // request에 result를 저장해 둔다. 그리고 forward 한다.
        request.setAttribute("result", result);
        
        PathNRedirect pathNRedirect = new PathNRedirect();
        pathNRedirect.setPath("login/loginResult.jsp");
        pathNRedirect.setRedirect(false);	// forward
        
        return pathNRedirect;
	}
	
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
}

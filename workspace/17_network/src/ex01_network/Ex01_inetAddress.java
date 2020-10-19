package ex01_network;

import java.net.InetAddress;
import java.util.Arrays;

public class Ex01_inetAddress {

	public static void main(String[] args) {
		
		// 원격 호스트
		String host = "www.naver.com";
		
		// InetAddress 타입의 객체 ipAddress 선언
		InetAddress ipAddress = null;
		
		try {
			ipAddress = InetAddress.getByName(host);
			System.out.println(ipAddress);					// www.naver.com/125.209.222.142
			System.out.println(ipAddress.getHostName());	// www.naver.com
			System.out.println(ipAddress.getHostAddress());	//125.209.222.142
			
			byte[] byteIp = ipAddress.getAddress();		// 4개 값
			System.out.println(Arrays.toString(byteIp));
			
			// byte[] -> String
			String realIp = "";
			for(int i = 0; i<byteIp.length; i++) {
				realIp += byteIp[i] < 0 ? byteIp[i] + 256 : byteIp[i];
				if(i != byteIp.length - 1) {
					realIp += ".";
				}
			}
			System.out.println(realIp);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

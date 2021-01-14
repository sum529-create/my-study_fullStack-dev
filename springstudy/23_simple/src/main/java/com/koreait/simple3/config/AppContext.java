package com.koreait.simple3.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.koreait.simple3.command.SimpleDeleteCommand;
import com.koreait.simple3.command.SimpleInsertCommand;
import com.koreait.simple3.command.SimpleListCommand;
import com.koreait.simple3.command.SimpleUpdateCommand;
import com.koreait.simple3.command.SimpleViewCommand;
import com.koreait.simple3.dao.SimpleDao;
/*
 * @Configuration
 * : 안녕, 난 root-context.xml처럼 Bean을 만드는 자바 클래스야
 */
@Configuration
public class AppContext {
	/*
	 * @Bean
	 * : 안녕, 난 Bean이야
	 * 
	 * 반환 타입: SimpleListCommand -> <Bean class="SimpleListCommand">Bean의 클래스를 의미
	 * 메소드명 : listCommand -> <Bean id="listCommand">
	 */
	@Bean
	public SimpleUpdateCommand updateCommand() {
		return new SimpleUpdateCommand();
	}
	@Bean
	public SimpleDeleteCommand deleteCommand() {
		return new SimpleDeleteCommand();
	}
	@Bean
	public SimpleInsertCommand insertCommand() {
		return new SimpleInsertCommand();
	}
	@Bean
	public SimpleViewCommand viewCommand() {
		return new SimpleViewCommand();
	}
	@Bean
	public SimpleListCommand listCommand() {
		return new SimpleListCommand();
	}
	
	@Bean
	public SimpleDao simpleDao() {
		return new SimpleDao();
	}
}

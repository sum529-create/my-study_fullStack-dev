/**
 * 
 */
package com.koreait.classick.command.mypage;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

/**
 * @author wotjr
 *
 */
public interface MyPageAjaxCommand {
	public Map<String, Object> execute(SqlSession sqlSession, Model model);
}

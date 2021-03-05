package com.koreait.classick.command.artist;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface ArtistCommand {
	public void execute(SqlSession sqlSession, Model model);
}

package com.koreait.classick.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.classick.command.artist.ArtistHomeCommand;
import com.koreait.classick.command.artist.ArtistListCommand;
import com.koreait.classick.command.artist.ArtistReviewCommand;
import com.koreait.classick.command.artist.ArtistSearchCommand;

@Controller
public class ArtistController {
	@Autowired
	private SqlSession sqlSession;
	
	private ArtistListCommand artistListCommand;
	private ArtistSearchCommand artistSearchCommand;
	private ArtistHomeCommand artistHomeCommand;
	private ArtistReviewCommand artistReviewCommand;
	@Autowired
	public void setCommand(ArtistListCommand artistListCommand,
						ArtistSearchCommand artistSearchCommand,
						ArtistHomeCommand artistHomeCommand,
						ArtistReviewCommand artistReviewCommand) {
		this.artistListCommand = artistListCommand;
		this.artistSearchCommand = artistSearchCommand;
		this.artistHomeCommand = artistHomeCommand;
		this.artistReviewCommand = artistReviewCommand;
		
	}
	@RequestMapping(value = "artistMainPage.do", method=RequestMethod.GET)
	public String list(Model model) {
		return "artist/artistMainPage";
	}
	@RequestMapping(value = "artistHomePage.do", method=RequestMethod.GET)
	public String artistHome(HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		artistHomeCommand.execute(sqlSession, model);
		return "artist/artistHomePage";
	}
	
	@RequestMapping(value="search/{p}",
			method=RequestMethod.GET,
			 produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> searchArtist(@PathVariable("p") String p,
											Model model){
		model.addAttribute("p", p);
		
		return artistSearchCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="artist/{page}",
			method=RequestMethod.GET,
			 produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> artistList(@PathVariable("page")int page,
											Model model){
		model.addAttribute("page", page);
		
		return artistListCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="artistReview/{aNo}",
			method=RequestMethod.GET,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> artistReview(@PathVariable("aNo")int aNo,
			Model model){
		model.addAttribute("aNo", aNo);
		
		return artistReviewCommand.execute(sqlSession, model);
	}
	
}
	


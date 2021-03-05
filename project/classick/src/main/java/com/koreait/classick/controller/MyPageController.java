package com.koreait.classick.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.classick.command.mypage.DeleteMyInfoCommand;
import com.koreait.classick.command.mypage.GetBannerCommand;
import com.koreait.classick.command.mypage.GetTotalOrderCommand;
import com.koreait.classick.command.mypage.IsArtistCommand;
import com.koreait.classick.command.mypage.MyInfoUpdateCommand;
import com.koreait.classick.command.mypage.MyMainPageCommand;
import com.koreait.classick.command.mypage.OrdersListPage;
import com.koreait.classick.command.mypage.ProfileUpdateCommand;
import com.koreait.classick.command.mypage.ReviewDeleteCommand;
import com.koreait.classick.command.mypage.ReviewInsertCommand;
import com.koreait.classick.command.mypage.ReviewListCommand;
import com.koreait.classick.command.mypage.ReviewUpdateCommand;
import com.koreait.classick.command.mypage.ReviewViewCommand;
import com.koreait.classick.command.mypage.UpdateAddrCommand;
import com.koreait.classick.command.mypage.UpdateBannerCommand;
import com.koreait.classick.command.mypage.UpdatePaymentCommand;

@Controller
public class MyPageController {
	@Autowired
	private SqlSession sqlSession;
	
	private MyMainPageCommand myMainPageCommand;
	private MyInfoUpdateCommand myInfoUpdateCommand;
	private DeleteMyInfoCommand deleteMyInfoCommand;
	private UpdateAddrCommand updateAddrCommand;
	private UpdatePaymentCommand updatePaymentCommand;
	private ProfileUpdateCommand profileUpdateCommand;
	private OrdersListPage ordersListPage;
	private ReviewInsertCommand reviewInsertCommand;
	private ReviewDeleteCommand reviewDeleteCommand; 
	private ReviewViewCommand reviewViewCommand;
	private ReviewUpdateCommand reviewUpdateCommand;
	private ReviewListCommand reviewListCommand;
	private GetTotalOrderCommand getTotalOrderCommand;
	private IsArtistCommand isArtistCommand;
	private UpdateBannerCommand updateBannerCommand;
	private GetBannerCommand getBannerCommand;
	@Autowired
	public void setCommand(MyMainPageCommand myMainPageCommand,
							MyInfoUpdateCommand myInfoUpdateCommand,
							DeleteMyInfoCommand deleteMyInfoCommand,
							UpdateAddrCommand updateAddrCommand,
							UpdatePaymentCommand updatePaymentCommand,
							ProfileUpdateCommand profileUpdateCommand,
							OrdersListPage ordersListPage,
							ReviewInsertCommand reviewInsertCommand,
							ReviewDeleteCommand reviewDeleteCommand,
							ReviewViewCommand reviewViewCommand,
							ReviewUpdateCommand reviewUpdateCommand,
							 ReviewListCommand reviewListCommand,
							 GetTotalOrderCommand getTotalOrderCommand,
							 IsArtistCommand isArtistCommand,
							 UpdateBannerCommand updateBannerCommand,
							 GetBannerCommand getBannerCommand
							) {
		this.myMainPageCommand = myMainPageCommand;
		this.myInfoUpdateCommand = myInfoUpdateCommand;
		this.deleteMyInfoCommand = deleteMyInfoCommand;
		this.updateAddrCommand = updateAddrCommand;
		this.updatePaymentCommand = updatePaymentCommand;
		this.profileUpdateCommand = profileUpdateCommand;
		this.ordersListPage = ordersListPage;
		this.reviewInsertCommand = reviewInsertCommand;
		this.reviewDeleteCommand = reviewDeleteCommand;
		this.reviewViewCommand = reviewViewCommand;
		this.reviewUpdateCommand = reviewUpdateCommand;
		this.reviewListCommand = reviewListCommand;
		this.getTotalOrderCommand = getTotalOrderCommand;
		this.isArtistCommand = isArtistCommand;
		this.updateBannerCommand = updateBannerCommand;
		this.getBannerCommand = getBannerCommand;
	}
	
		/*페이지이동*/
		@RequestMapping(value="myMainPage.do")
		public String myMainPage(HttpServletRequest request ,Model model) {
			model.addAttribute("request", request);
			myMainPageCommand.execute(sqlSession, model);
			return "mypage/myMainPage";
		}
		@RequestMapping(value="myInfoPage.do")
		public String myInfoPage(HttpServletRequest request ,Model model) {
			model.addAttribute("request", request);
			myMainPageCommand.execute(sqlSession, model);
			return "mypage/myInfoPage";
		}
		@RequestMapping(value="myAddrPage.do")
		public String myAddrPage(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			myMainPageCommand.execute(sqlSession, model);
			return "mypage/myAddrPage";
		} 
		@RequestMapping(value="myPaymentPage.do")
		public String myPaymentPage(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			myMainPageCommand.execute(sqlSession, model);
			return "mypage/myPaymentPage";
		} 
		@RequestMapping(value="myOrdersPage.do")
		public String myOrdersPage(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			myMainPageCommand.execute(sqlSession, model);
			return "mypage/myOrdersPage";
		} 
		@RequestMapping(value="myReviewList.do")
		public String myReviewList(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			myMainPageCommand.execute(sqlSession, model);
			return "mypage/myReviewList";
		} 
		@RequestMapping(value="artistHomeBanner.do")
		public String artistHomeBanner(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			myMainPageCommand.execute(sqlSession, model);
			return "mypage/artistHomeBanner";
		} 
		@RequestMapping(value="memberDelete.do")
		public String memberDelete(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			deleteMyInfoCommand.execute(sqlSession, model);
			return "mypage/memberDeletePage";
		} 
		@RequestMapping(value="jusoPopup.do")
		public String jusoPopup() {
			return "mypage/jusoPopup";
		}
		@RequestMapping(value="fileUpload.do")
		public String fileUpload(MultipartHttpServletRequest multipartRequest,
                RedirectAttributes rttr,
				Model model) {
			model.addAttribute("multipartRequest", multipartRequest);
			model.addAttribute("rttr", rttr);
			profileUpdateCommand.execute(sqlSession, model);
			return "redirect:myMainPage.do?mNo="+multipartRequest.getParameter("mNo");
		}
		
		
		/*AJAX*/
		@RequestMapping(value="member",
                method=RequestMethod.POST,
                produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> updateMyInfo(@RequestBody Map<String, Object> map,
                Model model) {
			if(!map.isEmpty()) {
				model.addAttribute("map", map);
			}
			return myInfoUpdateCommand.execute(sqlSession, model);
		}
		
		@RequestMapping(value="addr",
                method=RequestMethod.POST,
                produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> updateAddr(@RequestBody Map<String, Object> map,
                Model model) {
			if(!map.isEmpty()) {
				model.addAttribute("map", map);
			}
			return updateAddrCommand.execute(sqlSession, model);
		}
		
		@RequestMapping(value="payment",
				method=RequestMethod.PUT,
				produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> updatePayment(@RequestBody Map<String, Object> map,
				Model model) {
			if(!map.isEmpty()) {
				model.addAttribute("map", map);
			}
			return updatePaymentCommand.execute(sqlSession, model);
		}
		@RequestMapping(value="orders",
				method=RequestMethod.POST,
				produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> orderList(@RequestBody Map<String, Object> map,
				Model model) {
			if(!map.isEmpty()) {
				model.addAttribute("map", map);
			}
			return ordersListPage.execute(sqlSession, model);
		}
		
		@RequestMapping(value="review",
				method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertReview(MultipartHttpServletRequest multipartRequest,
				Model model){
			model.addAttribute("multipartRequest", multipartRequest);
			return reviewInsertCommand.execute(sqlSession, model);
		}
		@RequestMapping(value="banner",
				method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> updateBanner(MultipartHttpServletRequest multipartRequest,
				Model model){
			model.addAttribute("multipartRequest", multipartRequest);
			return updateBannerCommand.execute(sqlSession, model);
		}
		@RequestMapping(value="reviewUpdate",
				method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> updateReview(MultipartHttpServletRequest multipartRequest,
				Model model){
			model.addAttribute("multipartRequest", multipartRequest);
			return reviewUpdateCommand.execute(sqlSession, model);
		}
		@RequestMapping(value="review",
				method=RequestMethod.DELETE)
		@ResponseBody
		public Map<String, Object> deleteReview(@RequestBody Map<String, Object> map,
				Model model){
			if(!map.isEmpty()) {
				model.addAttribute("map", map);
			}
			return reviewDeleteCommand.execute(sqlSession, model);
		}
		
		@RequestMapping(value="review/{rNo}",
                method=RequestMethod.GET,
                produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> memberDelete(@PathVariable("rNo") int rNo,
			                                     Model model) {
			model.addAttribute("rNo", rNo);
			return reviewViewCommand.execute(sqlSession, model);
		}
		@RequestMapping(value="banner/{mNo}",
				method=RequestMethod.GET,
				produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> getBanner(@PathVariable("mNo") int mNo,
				Model model) {
			model.addAttribute("mNo", mNo);
			return getBannerCommand.execute(sqlSession, model);
		}
		@RequestMapping(value="order/{mNo}",
				method=RequestMethod.GET,
				produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> getTotalOrder(@PathVariable("mNo") int mNo,
				Model model) {
			model.addAttribute("mNo", mNo);
			return getTotalOrderCommand.execute(sqlSession, model);
		}
		
		@RequestMapping(value="reviewList",
				method=RequestMethod.POST,
				produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> reviewList(@RequestBody Map<String, Object> map,
				Model model) {
			if(!map.isEmpty()) {
				model.addAttribute("map", map);
			}
			return reviewListCommand.execute(sqlSession, model);
		}
		
		// 권한 확인
		@RequestMapping(value="role/{mNo}",
				method=RequestMethod.GET,
				produces="application/json; charset=utf-8")
		@ResponseBody
		public Map<String, Object> IsArtist(@PathVariable("mNo") int mNo,
				Model model) {
			model.addAttribute("mNo", mNo);
			return isArtistCommand.execute(sqlSession, model);
		}
		
		
		
		
		
}

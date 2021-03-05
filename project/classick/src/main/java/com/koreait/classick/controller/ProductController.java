package com.koreait.classick.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.command.product.ProductDeleteCommand;
import com.koreait.classick.command.product.ProductInsertCommand;
import com.koreait.classick.command.product.ProductListCommand;
import com.koreait.classick.command.product.ProductUpdateCommand;
import com.koreait.classick.command.product.ProductViewCommand;

@Controller
public class ProductController {

	@Autowired
	private SqlSession sqlSession;

	private ProductListCommand productListCommand;
	private ProductViewCommand productViewCommand;
	private ProductInsertCommand productInsertCommand;
	private ProductUpdateCommand productUpdateCommand;
	private ProductDeleteCommand productDeleteCommand;

	@Autowired
	public void setCommand(ProductListCommand productListCommand, ProductViewCommand productViewCommand,
			ProductInsertCommand productInsertCommand, ProductUpdateCommand productUpdateCommand,
			ProductDeleteCommand productDeleteCommand) {
		this.productListCommand = productListCommand;
		this.productViewCommand = productViewCommand;
		this.productInsertCommand = productInsertCommand;
		this.productUpdateCommand = productUpdateCommand;
		this.productDeleteCommand = productDeleteCommand;
	}
	
	@RequestMapping(value = "productCategoryPage.do", method = RequestMethod.GET)
	public String category() {
		return "product/productCategoryPage";
	}

	@RequestMapping(value = "productListPage.do", method = RequestMethod.GET)
	public String productList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productListCommand.execute(sqlSession, model);
		return "product/productListPage";
	}

	@RequestMapping(value = "productInsertPage.do", method = RequestMethod.GET)
	public String productInsertPage() {
		return "product/productInsertPage";
	}

	@RequestMapping(value = "productInsert.do", method = RequestMethod.POST)
	public String productInsert(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest",multipartRequest);
		productInsertCommand.execute(sqlSession, model);
		String category = "";
		// 인코딩 
		try {
			category = URLEncoder.encode(multipartRequest.getParameter("pCategory"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:productListPage.do?category="+ category;
	}
	
	@RequestMapping(value = "productViewPage.do", method = RequestMethod.GET)
	public String productViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productViewCommand.execute(sqlSession, model);
		return "product/productViewPage";
	}

}

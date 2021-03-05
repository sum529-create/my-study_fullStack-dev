package com.koreait.classick.command.product;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.dao.ArtistDao;
import com.koreait.classick.dao.ProductDao;
import com.koreait.classick.dao.StockDao;
import com.koreait.classick.dto.LoginDto;
import com.koreait.classick.dto.ProductDto;

public class ProductInsertCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		StockDao stockDao = sqlSession.getMapper(StockDao.class);
		
		ProductDto productDto = null; 
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("multipartRequest");
		
		String[] foodCategory = {"음료(커피,차 등)", "디저트,베이커리,떡", "농축수산물", "수제 반찬", "그 외 수제먹거리", "전통주"};
		
		String pName = multipartRequest.getParameter("pName");
		String pCategory = multipartRequest.getParameter("pCategory");
		String strPListPrice = multipartRequest.getParameter("pListPrice");
		String strPPrice = multipartRequest.getParameter("pPrice");
		String strPDisRate = multipartRequest.getParameter("pDisRate");
		String pDesc = multipartRequest.getParameter("pDesc");
		String pTag = multipartRequest.getParameter("pTag");
				
		String[] optionTitles = multipartRequest.getParameterValues("optionTitle");
		String[] optionContents = multipartRequest.getParameterValues("optionContent");
		String[] optionPrices = multipartRequest.getParameterValues("optionPrice");
		String[] optionStocks = multipartRequest.getParameterValues("optionStock");
		
		int aNo = 0;
		HttpSession session = multipartRequest.getSession();
		LoginDto loginDto = (LoginDto) session.getAttribute("loginDto");
		if(loginDto != null) {
			ArtistDao artistDao = sqlSession.getMapper(ArtistDao.class);
			aNo = artistDao.getANo(loginDto.getMNo());
		}

		int pListPrice = 0;
		if(strPListPrice != null && !strPListPrice.isEmpty()) {
			pListPrice = Integer.parseInt(strPListPrice);
		}
		int pPrice = 0;
		if(strPPrice != null && !strPPrice.isEmpty()) {
			pPrice = Integer.parseInt(strPPrice);
		}
		int pDisRate = 0;
		if(strPDisRate != null && !strPDisRate.isEmpty()) {
			pDisRate = Integer.parseInt(strPDisRate);
		}
		
		boolean isFoodCategory = false;
		for (String string : foodCategory) {
			if(string.equals(pCategory)) {
				isFoodCategory = true;
			}
		}
		JSONObject detailObj = new JSONObject();
		String[] foodDetailList = {"식품의 유형", "생산자", "소재지", "제조연월일", "유통기한","용량", "수량", "안전식품", 
								"원재료명", "영양성분", "보관방법", "관리법상표시","유전자변형식품", "표시광고", "수입식품"};
		String[] notFoodDetailList = {"종류", "소재", "사이즈", "제조사", "제조국", "주의사항", "품질보증기준"};
		String[] pDetails = multipartRequest.getParameterValues("pDetail");
		
		if(isFoodCategory) {
			for (int i = 0; i < foodDetailList.length; i++) {
				detailObj.put(foodDetailList[i], pDetails[i+7]);
			}
		} else {
			for (int i = 0; i < notFoodDetailList.length; i++) {
				detailObj.put(notFoodDetailList[i], pDetails[i]);
			}
		}
		String pDetail = detailObj.toJSONString();
		//System.out.println(pDetail);
		
		String[] pASDescList = {"배송비", "무료배송", "도서산간비용", "제작배송기간", 
							 "제작배송방법", "교환환불정책", "교환환불내용" };
		String[] pASDescs = {"pASDesc1", "pASDesc2", "pASDesc3", "pASDesc4", "pASDesc5", "pASDesc6", "pASDesc7"};
		
		JSONObject asDescObj = new JSONObject();
		for (int i = 0; i < pASDescList.length; i++) {
			if( i < 2 && multipartRequest.getParameter(pASDescs[i]) == null ) {
				asDescObj.put(pASDescList[i], 0);
			}else {
				asDescObj.put(pASDescList[i], multipartRequest.getParameter(pASDescs[i]));
			}
		}
		String pASDesc = asDescObj.toJSONString();
		//System.out.println(pASDesc);
		

		List<MultipartFile> files = multipartRequest.getFiles("pImages");
		String allImages = "";
		
		if (files != null && !files.isEmpty()) {
			
			// 첨부를 하나씩 꺼내기
			for (MultipartFile file : files) {
				
				// 꺼낸 첨부가 있는지 검사
				if (file != null && !file.isEmpty()) {

					String originalFilename = file.getOriginalFilename();

					String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
					String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));

					String uploadFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
					String realPath = multipartRequest.getServletContext().getRealPath("resources/storage/product");

					File dir = new File(realPath);
					if (!dir.exists()) {
						dir.mkdirs();
					}

					File uploadFile = new File(realPath, uploadFilename);

					try {
						file.transferTo(uploadFile);
						// uploadFilename = URLEncoder.encode(uploadFilename,"utf-8");

					} catch (Exception e) {
						e.printStackTrace();
					}
					
					allImages += uploadFilename + "&";

				}  // if(file != null) {
				
			} // for (MultipartFile file : files) {
			//System.out.println("allImages: " + allImages);
			productDto = new ProductDto(0, pName, allImages, pListPrice, pPrice, pCategory, pTag, pDisRate, pDesc, pASDesc, pDetail, aNo, null);
			
		} else { // 첨부가 없는 데이터를 테이블에 저장합니다.
			productDto = new ProductDto(0, pName, "", pListPrice, pPrice, pCategory, pTag, pDisRate, pDesc, pASDesc, pDetail, aNo, null);
		}
		int result = productDao.insert(productDto);
		if(result > 0) {
			int pNo = 0;
			int getPNoResult = productDao.getPNo(pName, aNo);
			//System.out.println(getPNoResult);
			if(getPNoResult != 0) {
				pNo = getPNoResult;
				for (int i = 0; i < optionContents.length; i++) {
					stockDao.insert(pNo, optionTitles[i], optionContents[i], Integer.parseInt(optionPrices[i]), Integer.parseInt(optionStocks[i]));
				}
			}
		}

	}

}

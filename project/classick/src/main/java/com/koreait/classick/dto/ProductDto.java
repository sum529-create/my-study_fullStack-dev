package com.koreait.classick.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
	
	private int pNo;			// 상품 번호 
	private String pName;		// 상품명
	private String pImage;		// 상품 이미지 
	private int pListPrice;		// 상품 가격(정가) 
	private int pPrice;			// 할인된 판매가
	private String pCategory;	// 상품 카테고리 
	private String pTag;		// 상품 테그 
	private int pDisRate;	// 상품 할인율 
	private String pDesc;		// 상품 정보
	private String pASDesc;		// 상품 배송/교환/환불 정보  
	private String pDetail;		// 작품 정보제공 고시 내용  
	private int aNo;			// 아티스트(판매자) 번호
	private Date pRedDate;		// 상품 등록일

}

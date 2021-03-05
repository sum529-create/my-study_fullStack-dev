package com.koreait.classick.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ArtistDto {
	private int aNo;
	private int mNo;
	private String aName;
	private String aComment;
	private String aImage;
	private String aBImage;
}

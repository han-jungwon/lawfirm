package com.law.hansong.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private Long id;
	private String board_category;
	private String board_title;
	private String board_content;
	private int board_count;
	private int board_re_ref;
	private int board_re_seq;
	private int board_re_lev;
	private int board_readcount;
	private String regi_id;
	private Date regi_dt;
	private String updt_id;
	private Date updt_dt;

	
	List<MultipartFile> uploadFile;
	
	 
}

       
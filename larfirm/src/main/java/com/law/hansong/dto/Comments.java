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
public class Comments {
	private Long id;
	private Long board_id;
	private String member_id;
	private String content;
	private String regi_id;
	private Date regi_dt;
	private String updt_id;
	private String updt_dt;

	

}

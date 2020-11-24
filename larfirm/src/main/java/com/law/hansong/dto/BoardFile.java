package com.law.hansong.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardFile {
	private Long id;
	private Long board_id;
	private String file_name;
	private String file_original;
	private Long regi_id;
	private Date regi_dt;
	private Long updt_id;
	private Date updt_dt;	
	
}

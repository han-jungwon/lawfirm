package com.law.hansong.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Chat {
    private Long id;
    private String regi_id;
    private Date regi_dt;
    private int condition;
}

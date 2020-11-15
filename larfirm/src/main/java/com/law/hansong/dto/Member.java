package com.law.hansong.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private Long id;
    private String name;
    @JsonIgnore
    private String password;
    private String email;
    private String phone;
    private Long regi_id;
    private Date regi_dt;
    private Long updt_id;
    private Date updt_dt;
}

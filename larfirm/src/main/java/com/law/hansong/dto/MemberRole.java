package com.law.hansong.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MemberRole {
    private Long id;
    private Long member_id;
    private String role_name;

}
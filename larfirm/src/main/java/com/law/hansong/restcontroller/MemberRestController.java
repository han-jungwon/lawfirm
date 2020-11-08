package com.law.hansong.restcontroller;

import com.law.hansong.dto.Member;
import com.law.hansong.exception.ObjectNotFoundException;
import com.law.hansong.service.MemberService;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping(value = "/v1/members", produces = "application/json;charset=UTF-8")
public class MemberRestController {
    private final MemberService memberService;
    private final PasswordEncoder passwordEncoder;

    public MemberRestController(MemberService memberService, PasswordEncoder passwordEncoder){
        this.memberService = memberService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = "/{email}")
    public EntityModel<Member> getUser(@PathVariable String email) {
        Optional<Member> member = Optional.ofNullable(memberService.getMemberByEmail(email));

        if(!member.isPresent()) {
            throw new ObjectNotFoundException(email);
        }

        EntityModel<Member> resource = new EntityModel<>(member.get());

        return resource;
    }
}

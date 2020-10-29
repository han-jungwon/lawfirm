package com.law.hansong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.law.hansong.argumentresolver.HeaderInfo;
import com.law.hansong.dto.Member;
import com.law.hansong.service.MemberService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Controller
@RequestMapping(path = "/members")
public class MemberController {
	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다.
	private final MemberService memberService;
	private final PasswordEncoder passwordEncoder;

	// private static final Log LOG = LogFactory.getLog(MemberController.class);
	public MemberController(MemberService memberService, PasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	@GetMapping("/loginform")
	public String loginform() {
		return "members/loginform";
	}

	@GetMapping("/memberinfo")
	public String memberinfo() {
		return "members/memberinfo";
	}

	@GetMapping("/loginerror")
	public String loginerror(@RequestParam("login_error") String loginError) {
		return "members/loginerror";
	}

	@GetMapping("/joinform")
	public String joinform() {
		return "members/joinform";
	}

	// 사용자가 입력한 name, email, password, phone가 member에 저장된다.
	@PostMapping
	public String memberJoin(@ModelAttribute Member member) {
		System.out.println(member);
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		int result = memberService.addMember(member);
		
		System.out.println(member);
		if(result < 2) {
			return "members/loginerror";
		}
		return "members/loginform";

	}



	@ApiOperation(value = "회원리스트") // swagger 설명
	@ApiResponses({ // 응답 메시지에 대한 설명
		@ApiResponse(code = 200, message = "OK"), @ApiResponse(code = 500, message = "Exception") })
	@GetMapping("/ex")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(name = "start", required = false, defaultValue = "0") int start,
			HeaderInfo headerInfo) {
		List<Member> list = memberService.getUserList();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		System.out.println("-----------------------------------------------------");
		System.out.println(headerInfo.get("user-agent"));
		System.out.println("-----------------------------------------------------");
	
		return map;
	}

/*
 * @PostMapping public Member write(@RequestBody Member member,
 * HttpServletRequest request) { String clientIp = request.getRemoteAddr();
 * Member member = memberService.addMember(member, clientIp); return member; }
 * 
 * @DeleteMapping("/{id}") public Map<String, String> delete(@PathVariable(name
 * ="id") Long id, HttpServletRequest request) { String clientIp =
 * request.getRemoteAddr(); int deleteCount = memberService.deleteMember(id,
 * clientIp); return Collections.singletonMap("success", deleteCount > 0 ?
 * "true" : "false"); }
 */

// 사용자가 입력한 name, email, password가 member에 저장된다.
/*
 * @PostMapping("/join") public void join(@ModelAttribute Member member,
 * HttpServletResponse response) throws Exception { System.out.println("오나");
 * member.setPassword(passwordEncoder.encode(member.getPassword())); String msg
 * = memberService.Member(member, false); PrintWriter out =
 * response.getWriter(); out.println("<script>");
 * out.println("alert('"+msg+"');");
 * out.println("location.href='/members/loginform';"); out.println("</script>");
 * out.close(); }
 * 
 * @GetMapping("/welcome") public String welcome(){ return "members/welcome"; }
 */

/*
 * @RequestMapping("/join") public String join(Member m, Model model) {
 * System.out.println(m);
 * System.out.println(passwordEncoder.encode(m.getPassword()));
 * 
 * String encPwd = passwordEncoder.encode(m.getPassword());
 * m.setPassword(encPwd);
 * 
 * 
 * System.out.println(m);
 * 
 * // 이제 서비스로 이동 int result = memberService.insertMember(m); if(result > 0) {
 * return "redirect:home.do"; }else { model.addAttribute("msg","회원가입실패"); return
 * "common/errorPage"; }
 * 
 * }
 */

/*
 * @GetMapping("/memberinfo") public String memberInfo(Principal principal,
 * ModelMap modelMap){ // 자기정보 가져오는거임 String loginId = principal.getName();
 * System.out.println(loginId); Member member =
 * memberService.getMemberByEmail(loginId); modelMap.addAttribute("member",
 * member);
 * 
 * return "members/memberinfo"; }
 */
}
package tw.eeit117.wematch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eeit117.wematch.model.Member;
import tw.eeit117.wematch.model.MemberService;

@Controller
public class MemberAdminController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/preInsert", method = RequestMethod.POST)
	public String preInsert(Model m) {
		List<Member> m1 = memberService.selectAllMember();		
		m.addAttribute("results", m1);
		
		return "MemberAdminPage";
	}

//	@RequestMapping(value = "/preUpdate", method = RequestMethod.GET)
//	public String preUpdate(@RequestParam(name = "memberAccount") String memberAccount,
//			@RequestParam(name = "memberPwd") String memberPwd, Model m) {
//		m.addAttribute("result", memberService.selectMember(memberAccount, memberPwd));
//		return "MemberAdminPage";
//	}待開發中

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Integer id) {
		Member member = new Member();
		member.setMemberId(id);
		memberService.deleteMember(member.getMemberId());
		return "MemberAdminPage";
	}
}

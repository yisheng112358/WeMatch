package tw.eeit117.wematch.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tw.eeit117.wematch.member.model.Member;
import tw.eeit117.wematch.member.model.MemberService;

@Controller("MemberAdminController")
public class MemberAdminController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(path = "/MemberAdminPage", method = RequestMethod.GET)
	public String MemberAdminPage() {
		return "MemberAdminPage";
	}

	@RequestMapping(value = "/preInsert", method = RequestMethod.POST)
	public String preInsert(Model m) {
		List<Member> m1 = memberService.selectAllMember();		
		m.addAttribute("results", m1);
		
		return "MemberAdminPage";
	}
	
	@RequestMapping(path = "/preInsert.do", method = RequestMethod.GET)
	public String create(Model m) {
		return "MemberAdminPage_c";
	}
	
	
	@RequestMapping(path = "/Insert", method = RequestMethod.POST)
	public String createcheck(HttpServletRequest request, @ModelAttribute("Member")Member member, Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		Boolean check = memberService.insertMember(member.getMemberAccount(), member.getMemberPwd());
		if(check) {
			return "MemberAdminPage";			
		}else {
			errors.put("msg", "Insert Error.");
			return "MemberAdminPage_c";
		}
	}
	@RequestMapping(path = "/MemberPage_Adminupdate", method = RequestMethod.GET)
	public String Update() {
		return "MemberAdminPage_u";
	}
	
	@RequestMapping(value = "/preUpdate", method = RequestMethod.GET)
	public String preUpdate(Integer id, Model m) {
		Member member = memberService.selectMemberById(id);
		m.addAttribute("Member", member);
		return "MemberAdminPage_r";
	}
	
	@RequestMapping(path = "/UpdateSend", method = RequestMethod.POST)
	public String UpdateSend(@ModelAttribute("Member")Member member, Model m, HttpSession session) {		
		session.setAttribute("memberAccount", member.getMemberAccount());
		session.setAttribute("name", member.getMemberName());
		session.setAttribute("nickname", member.getNickname());
		session.setAttribute("gender", member.getGender());
		session.setAttribute("email", member.getMemberEmail());
		session.setAttribute("birthday", member.getBirthdayDate());
		session.setAttribute("starSign", member.getStarSign());
		session.setAttribute("city", member.getCity());
		session.setAttribute("booldtype", member.getBloodType());
		session.setAttribute("hobbies", member.getHobbies());
		session.setAttribute("selfinfo", member.getSelfIntro());
		memberService.adminUpdateMember(member, session);
		
		return "MemberAdminPage_r";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Integer id) {
		Member member = new Member();
		member.setMemberId(id);
		memberService.deleteMember(member.getMemberId());
		return "MemberAdminPage";
	}
}

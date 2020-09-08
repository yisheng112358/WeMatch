package tw.eeit117.wematch.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import tw.eeit117.wematch.model.Member;
import tw.eeit117.wematch.model.MemberDAO;
import tw.eeit117.wematch.model.MemberService;

@Controller
@SessionAttributes(names = { "user", "pwd" })
public class MemberController {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private MemberService memberService;

	@RequestMapping(path = "/loginsystem.controller", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request, @RequestParam(name = "memberAccount", required = true) String myUser,
			@RequestParam(name = "memberPwd", required = true) String myPwd, Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		//MemberPage
		if (myUser == null || myUser.length() == 0) {
			errors.put("name", "name is required");
		}
		if (myPwd == null || myPwd.length() == 0) {
			errors.put("pwd", "password is required");
		}
		if (errors != null && !errors.isEmpty()) {
			return "SignInPage";
		}

//		MemberDAO mDAO = (MemberDAO)context.getBean("MemberDAO");
		Boolean checkUser = memberService.checkLogin(new Member(myUser, myPwd));
		Member users = memberService.selectMember(myUser, myPwd);
		System.out.println("MemberStatus:" + users.getMemberStatus());
		
		m.addAttribute("MemberAccount", myUser);
		m.addAttribute("MemberPwd", myPwd);
		m.addAttribute("checkUser", checkUser);

		if (checkUser) {
			//AdminPage
			if(users.getMemberStatus()==2) {
				return "MemberAdminPage";
			}
			else { 
				return "MemberPage";}
			}
		errors.put("msg", "please input correct useraccount or password");
		return "SignInPage";
		
	}

	@RequestMapping(path = "/register.controller", method = RequestMethod.POST)
	public String memberCreate(HttpServletRequest request, @RequestParam(name = "memberAccount") String myUser,
			@RequestParam(name = "memberPwd") String myPwd, Model m) {
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		if (myUser == null || myUser.length() == 0) {
			errors.put("name", "name is required");
		}
		if (myPwd == null || myPwd.length() == 0) {
			errors.put("pwd", "password is required");
		}
		if (errors != null && !errors.isEmpty()) {
			return "registerPage";
		}

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		Boolean check = memberService.insertMember(myUser, myPwd);

		if(check) {
		m.addAttribute("MemberAccount", myUser);
		m.addAttribute("MemberPwd", myPwd);
		return "MemberPage";
		}
		errors.put("msg", "帳號密碼重複");
		return "registerPage";
	}

	@RequestMapping(path = "/MemberPage_updatedata", method = RequestMethod.POST)
	@ModelAttribute(name = "Member")
	public String memberUpdate(HttpServletRequest request, HttpServletResponse response, Model m, Member member) throws Exception {
		m.addAttribute("Member", new Member());
		
		//		System.out.println(m.getAttribute("memberAccount"));
//		System.out.println(m.getAttribute("memberPwd"));
//		Member mem = memberService.selectMember(m.getAttribute("memberAccount").toString(), m.getAttribute("memberPwd").toString());
//		
//		if (request.getParameter("memberName") != null) {
//			mem.setMemberName(request.getParameter("memberName"));
//			m.addAttribute("memberName", request.getParameter("memberName"));
//		}
//		if (request.getParameter("gender") != null) {
//			mem.setGender(request.getParameter("gender"));
//		}
//		if (request.getParameter("memberEmail") != null) {
//			mem.setMemberEmail(request.getParameter("memberEmail"));
//		}
//		if (request.getParameter("nickname") != null) {
//			mem.setNickname(request.getParameter("nickname"));
//		}
//		if (request.getParameter("birthday") != null) {
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			java.util.Date utilDate = sdf.parse(request.getParameter("birthday"));
//			mem.setBirthdayDate(utilDate);
//		}
//		if (request.getParameter("starSign") != null) {
//			mem.setStarSign(request.getParameter("starSign"));
//		}
//		if (request.getParameter("city") != null) {
//			mem.setCity(request.getParameter("city"));
//		}
//		if (request.getParameter("bloodType") != null) {
//			mem.setMemberName(request.getParameter("bloodType"));
//		}
//		if (request.getParameter("hobbies") != null) {
//			mem.setHobbies(request.getParameter("hobbies"));
//		}
//		if (request.getParameter("selfIntro") != null) {
//			mem.setSelfIntro(request.getParameter("selfIntro"));
//		}
//		if (request.getParameter("hobbies") != null) {
//			mem.setHobbies(request.getParameter("hobbies"));
//		}
//		//照片上傳還沒寫
//		System.out.println(mem.getMemberName());
//		memberService.updateMember(mem);
		memberService.updateMember(member);
		return "MemberPage";
	}
}

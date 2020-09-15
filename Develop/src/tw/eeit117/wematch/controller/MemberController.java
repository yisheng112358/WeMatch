package tw.eeit117.wematch.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import tw.eeit117.wematch.model.Member;
import tw.eeit117.wematch.model.MemberDAO;
import tw.eeit117.wematch.model.MemberService;

@Controller
@SessionAttributes(names = { "MemberAccount", "MemberPwd", "Member", "MemberStatus" })
public class MemberController {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private MemberService memberService;

	@RequestMapping(path = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "SignInPage";
	}

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String register() {
		return "registerPage";
	}

	@RequestMapping(path = "/loginsystem.controller", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request,
			@RequestParam(name = "memberAccount", required = true) String myUser,
			@RequestParam(name = "memberPwd", required = true) String myPwd, Model m, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		// MemberPage
		if (myUser == null || myUser.length() == 0) {
			errors.put("name", "name is required");
		}
		if (myPwd == null || myPwd.length() == 0) {
			errors.put("pwd", "password is required");
		}
		if (errors != null && !errors.isEmpty()) {
			return "SignInPage";
		}

		MemberDAO mDAO = (MemberDAO) context.getBean("MemberDAO");
		Boolean checkUser = memberService.checkLogin(new Member(myUser, myPwd));
		Member users = memberService.selectMember(myUser, myPwd);
		int id = users.getMemberId();

		m.addAttribute("MemberAccount", myUser);
		m.addAttribute("MemberPwd", myPwd);
		m.addAttribute("checkUser", checkUser);

		if (checkUser) {
			// AdminPage
			if (users.getMemberStatus() == 2) {
				session.setAttribute("Account", myUser);
				session.setAttribute("Status", users.getMemberStatus());
				session.setAttribute("id", id);
				return "MemberAdminPage";
			} else {
				session.setAttribute("Account", myUser);
				session.setAttribute("Status", users.getMemberStatus());
				session.setAttribute("id", id);
				return "MemberPage";
			}
		}
		errors.put("msg", "please input correct useraccount or password");
		return "SignInPage";

	}

	@GetMapping("/MemberForgot")
	public String MemberForgot() {
		return "MemberForgot";
	}

	@PostMapping("/memberforgot.controller")
	public String memberforgotAction(@RequestParam("memberAccount") String memberAccount) {
		Member member = memberService.selectMemberByAccount(memberAccount);
		String pwd = member.getMemberPwd();
		request.setAttribute("newPwd", pwd);
		return "memberforgotAction";
	}

	@RequestMapping(path = "/register.controller", method = RequestMethod.POST)
	public String memberCreate(HttpServletRequest request, @RequestParam(name = "memberAccount") String myUser,
			@RequestParam(name = "memberPwd") String myPwd, Model m, HttpSession session) {

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
		Member users = memberService.selectMember(myUser, myPwd);
		int id = users.getMemberId();

		if (check) {
			m.addAttribute("MemberAccount", myUser);
			m.addAttribute("MemberPwd", myPwd);
			session.setAttribute("Account", myUser);
			session.setAttribute("Password", myPwd);
			session.setAttribute("Status", users.getMemberStatus());
			session.setAttribute("id", id);
			return "MemberPage";
		}
		errors.put("msg", "帳號密碼重複");
		return "registerPage";
	}

	@RequestMapping(path = "/MemberPage_update", method = RequestMethod.GET)
	public String MemberPage_update(Model m) {
		Member member = new Member();
		m.addAttribute("Member", member);
		return "MemberPage_update";
	}

	@RequestMapping(path = "/MemberPage_DB", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("Member") Member member, Model m, HttpSession session) {
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
		memberService.updateMember(member, session);

		return "MemberPage";
	}

	@ResponseBody
	@RequestMapping(path = "/test", method = RequestMethod.GET)
	public List<Member> test() {
		return memberService.selectAllMember();
	}

	@Transactional
	@PostMapping(value = "/CheckMemberAccount", produces = { "application/json" })
	public @ResponseBody Map<String, String> checkMemberAccount(@RequestParam("account1") String memberAccount) {
		System.out.println(memberAccount);
		Map<String, String> map = new HashMap<>();
		String mAccount = memberService.checkMemberAccount(memberAccount);
		map.put("id", mAccount);
		return map;
	}
}

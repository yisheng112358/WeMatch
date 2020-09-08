package tw.eeit117.wematch.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TurnPage {
	@RequestMapping(path = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "SignInPage";
	}
	
	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String register() {
		return "registerPage";
	}
	
	@RequestMapping(path = "/MemberPage_update", method = RequestMethod.GET)
	public String MemberPage_update() {
		
		//擋
		return "MemberPage_update";
	}
	
	@RequestMapping(path = "/MemberAdmin", method = RequestMethod.POST)
	public String checkloginAdmin(HttpServletRequest request, @RequestParam(name = "account1") String myUser,
			@RequestParam(name = "pwd1") String myPwd, Model m) {

		return "MemberAdminPage";
	}
}

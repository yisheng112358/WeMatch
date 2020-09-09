package tw.eeit117.wematch.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/SignUpJdbcConnServlet.do")
@javax.servlet.annotation.MultipartConfig
public class SignUpJdbcConnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();

			String memberAccount = request.getParameter("memberAccount");
			String memberPwd = request.getParameter("memberPwd");
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String nickname = request.getParameter("nickname");
			String gender = request.getParameter("gender");
			String city = request.getParameter("city");
			String birthday = request.getParameter("birthday");
			String starSign = request.getParameter("starSign");
			String bloodType = request.getParameter("bloodType");
			String[] hobbies = request.getParameterValues("hobbies");
			Collection<Part> uploadParts = request.getParts();
			int memberStatus = 1; // 1: general member by default
			String selfIntro = request.getParameter("selfIntro");

			processInsert(memberAccount, memberPwd, memberName, memberEmail, nickname, gender, city, birthday, starSign,
					bloodType, hobbies, uploadParts, memberStatus, selfIntro);

			response.sendRedirect("SignInPage.jsp");

			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void processInsert(String memberAccount, String memberPwd, String memberName, String memberEmail,
			String nickname, String gender, String city, String birthday, String starSign, String bloodType,
			String[] hobbies, Collection<Part> uploadParts, int memberStatus, String selfIntro) throws Exception {
		JdbcConnServlet jdbcConnServlet = new JdbcConnServlet();

		String sqlstr = "INSERT INTO members(member_account, member_pwd, member_name, member_email, nickname, gender, city, birthday, star_sign, blood_type, hobbies, picture_1, picture_2, member_status, self_intro) Values(?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?);";
		PreparedStatement preState = jdbcConnServlet.getConn().prepareStatement(sqlstr);
		preState.setString(1, memberAccount);
		preState.setString(2, memberPwd);
		preState.setString(3, memberName);
		preState.setString(4, memberEmail);
		preState.setString(5, nickname);
		preState.setString(6, gender);
		preState.setString(7, city);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// out.write("birthday: " + birthday);
		java.util.Date utilDate = sdf.parse(birthday);
		preState.setDate(8, new java.sql.Date(utilDate.getTime()));
		preState.setString(9, starSign);
		preState.setString(10, bloodType);
		String joinedHobbies = String.join(", ", hobbies);
		preState.setString(11, joinedHobbies);
		ArrayList<Part> uploadPics = new ArrayList<Part>();
		for (Part pic : uploadParts) {
			if (pic.getContentType() != null && pic.getContentType().contains("image")) {
				uploadPics.add(pic);
			}
		}
		if (uploadPics.isEmpty()) {
			preState.setBinaryStream(12, null);
			preState.setBinaryStream(13, null);
		} else {
			if (uploadPics.size() == 1) {
				preState.setBinaryStream(12, uploadPics.get(0).getInputStream());
				preState.setBinaryStream(13, null);
			} else if (uploadPics.size() >= 2) {
				preState.setBinaryStream(12, uploadPics.get(0).getInputStream());
				preState.setBinaryStream(13, uploadPics.get(1).getInputStream());
			}
		}
		preState.setInt(14, memberStatus);
		preState.setString(15, selfIntro);
		preState.execute();
		System.out.println(memberAccount + "已註冊完成");
		preState.close();

		jdbcConnServlet.closeConn();
	}

}

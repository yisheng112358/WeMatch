package tw.eeit117.wematch.jdbc;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

@WebServlet("/SignUpJdbcConnServlet.do")
@ javax.servlet.annotation.MultipartConfig
public class SignUpJdbcConnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	private void createConn() throws Exception {
		InitialContext context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/connectSQLServerJdbc/WeMatch");
		conn = ds.getConnection();

		boolean status2 = !conn.isClosed();
		out.write("Connction Status2:" + status2 + "<br/>");
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) {
		try {			
			request.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			
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


			createConn();
			processInsert(memberAccount, memberPwd, memberName, memberEmail, nickname, gender, city, birthday, starSign,
					bloodType, hobbies, uploadParts, memberStatus, selfIntro);
			
			closeConn();

			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void processInsert(String memberAccount, String memberPwd, String memberName, String memberEmail,
			String nickname, String gender, String city, String birthday, String starSign, String bloodType,
			String[] hobbies, Collection<Part> uploadParts, int memberStatus, String selfIntro)
			throws SQLException, IOException, ParseException {
		String sqlstr = "Insert Into members(member_account, member_pwd, member_name, member_email, nickname, gender, city, birthday, star_sign, blood_type, hobbies, picture_1, picture_2, member_status, self_intro) Values(?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
		PreparedStatement preState = conn.prepareStatement(sqlstr);
		preState.setString(1, memberAccount);
		preState.setString(2, memberPwd);
		preState.setString(3, memberName);
		preState.setString(4, memberEmail);
		preState.setString(5, nickname);
		preState.setString(6, gender);
		preState.setString(7, city);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		out.write("birthday: " + birthday);
		java.util.Date utilDate = sdf.parse(birthday);
		preState.setDate(8, new java.sql.Date(utilDate.getTime()));
		preState.setString(9, starSign);
		preState.setString(10, bloodType);
		String joinedHobbies = String.join(", ", hobbies);
		preState.setString(11, joinedHobbies);
		Collection<Part> uploadPics = new ArrayList<Part>();
		for (Part pic: uploadParts) {
			if(pic.getContentType()!=null && pic.getContentType().contains("image")) {
				uploadPics.add(pic);
			}
		}
		Iterator<Part> pic = uploadPics.iterator();
		preState.setBinaryStream(12, (FileInputStream)pic.next().getInputStream());
		preState.setBinaryStream(13, (FileInputStream)pic.next().getInputStream());
		
		preState.setInt(14, memberStatus);
		preState.setString(15, selfIntro);
		preState.execute();
		preState.close();
	}

	private void processQuery() throws SQLException {
		String sqlstr = "Select * From Profiles";
		PreparedStatement preState = conn.prepareStatement(sqlstr);
		ResultSet rs = preState.executeQuery();

		while (rs.next()) {
			out.write(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + "<br/>");
		}

		rs.close();
		preState.close();
	}

	private void closeConn() throws SQLException {
		if (conn != null) {
			conn.close();
			out.write("Connection Closed.<br/>");
		}
	}

}

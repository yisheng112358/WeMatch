package tw.eeit117.wematch.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignInJdbcConnServlet.do")
@javax.servlet.annotation.MultipartConfig
public class SignInJdbcConnServlet extends HttpServlet {
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

			String memberName = processQuery(memberAccount, memberPwd);
			if (!memberName.equals("")) {
				out.write(memberName + "您好！觀迎光臨！");
			}

			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String processQuery(String memberAccount, String memberPwd) throws Exception {
		JdbcConnServlet jdbcConnServlet = new JdbcConnServlet();
		String sqlstr = "SELECT * FROM members WHERE member_account = ? AND member_pwd = ?;";
		PreparedStatement preState = jdbcConnServlet.getConn().prepareStatement(sqlstr);
		preState.setString(1, memberAccount);
		preState.setString(2, memberPwd);
		ResultSet rs = preState.executeQuery();

		String memberName = "";
		if (rs.next()) {
			memberName = rs.getString(4);
		} else {
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('您輸入的訊息可能錯誤或尚未註冊帳號！');");
			   out.println("location='SignInPage.jsp';");
			   out.println("</script>");
		}

		rs.close();
		preState.close();
		jdbcConnServlet.closeConn();
		return memberName;
	}

}

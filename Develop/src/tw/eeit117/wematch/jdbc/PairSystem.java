package tw.eeit117.wematch.jdbc;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/PairSystem.do")
public class PairSystem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private String bloodType;
	private String gender;
	private PrintWriter out;
	private BufferedOutputStream bos1;
	private BufferedOutputStream bos2;
	private String ShowName;
	private String ShowName2;
	private LinkedList list;
	private String city;
	private String star_sign;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("image/jpg");
		bloodType = request.getParameter("bloodType");
		gender = request.getParameter("gender");
		city = request.getParameter("city");
		star_sign = request.getParameter("star_sign");

		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		out = response.getWriter();
		out.write("bloodType:" + bloodType + "<br/>");
		out.write("Sex:" + gender + "<br/>");
		out.write("city:" + city + "<br/>");
		out.write("star_sign:" + star_sign + "<br/>");

		try {
			selectuser();

			request.setAttribute("Name", list);

			RequestDispatcher rd = request.getRequestDispatcher("PairResult.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();
		}

		out.close();

	}

	private void createConn() throws Exception {
		InitialContext context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/connectSQLServerJdbc/WeMatch");
		conn = ds.getConnection();

		boolean status2 = !conn.isClosed();
		out.write("Connction Status2:" + status2 + "<br/>");
	}

	private void selectuser() throws Exception {

		createConn();
		PreparedStatement state = conn
				.prepareStatement("Select * From members Where blood_type=? and gender=? and city=? and star_sign=?");
		state.setString(1, bloodType);
		state.setString(2, gender);
		state.setString(3, city);
		state.setString(4, star_sign);

		ResultSet rs = state.executeQuery();

		int i = 1;

		list = new LinkedList();

		while (rs.next()) {

			out.write("命中注定" + i + ":" + rs.getString(4) + "<br/>");
//			out.write("命中注定"+i+":" + rs.getString(2) + "<br/>");
//			ShowName=rs.getString(1);
//			ShowName=rs.getString(2);

			list.add(rs.getString(4));
//			 list.add(rs.getString(2));
			System.out.println(list); // 檢查LIST裡面資料

			bos1 = new BufferedOutputStream(
					new FileOutputStream("..\\workspace\\WeMatch_dev\\WebContent\\temp\\" + i + "0.jpg"));
			bos1.write(rs.getBytes(13));
			bos2 = new BufferedOutputStream(
					new FileOutputStream("..\\workspace\\WeMatch_dev\\WebContent\\temp\\" + i + "00.jpg"));
			bos2.write(rs.getBytes(14));

			i++;
			out.write(i);
		}

		bos1.flush();
		bos1.close();
		bos2.flush();
		bos2.close();

		rs.close();
		state.close();
	}

}

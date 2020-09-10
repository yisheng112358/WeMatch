package tw.eeit117.wematch.jdbc;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PairSystem.do")
public class PairSystem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("image/jpg");
			String bloodType = request.getParameter("bloodType");
			String gender = request.getParameter("gender");
			String city = request.getParameter("city");
			String star_sign = request.getParameter("star_sign");

			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			LinkedHashMap<String, List<String>> imageMap = selectuser(bloodType, gender, city, star_sign);

			request.setAttribute("matchNames", imageMap.keySet().toArray());
			request.setAttribute("imageMap", imageMap);

			RequestDispatcher rd = request.getRequestDispatcher("PairResult.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private LinkedHashMap<String, List<String>> selectuser(String bloodType, String gender, String city,
			String star_sign) throws Exception {
		JdbcConnServlet jdbcConnServlet = new JdbcConnServlet();
		PreparedStatement state = jdbcConnServlet.getConn()
				.prepareStatement("Select * From members Where blood_type=? and gender=? and city=? and star_sign=?");
		state.setString(1, bloodType);
		state.setString(2, gender);
		state.setString(3, city);
		state.setString(4, star_sign);
		ResultSet rs = state.executeQuery();

		List<String> nameList = new ArrayList<String>();
		LinkedHashMap<String, List<String>> imageMap = new LinkedHashMap<String, List<String>>();
		while (rs.next()) {
			List<String> imageList = new ArrayList<String>();

			String matchName = rs.getString(4);
			nameList.add(matchName);

			InputStream inputStream1 = rs.getBlob(13).getBinaryStream();
			ByteArrayOutputStream outputStream1 = new ByteArrayOutputStream();
			byte[] buffer1 = new byte[4096];
			int bytesRead1 = -1;
			while ((bytesRead1 = inputStream1.read(buffer1)) != -1) {
				outputStream1.write(buffer1, 0, bytesRead1);
			}
			byte[] imageBytes1 = outputStream1.toByteArray();
			imageList.add(Base64.getEncoder().encodeToString(imageBytes1));

			inputStream1.close();
			outputStream1.close();

			InputStream inputStream2 = rs.getBlob(14).getBinaryStream();
			ByteArrayOutputStream outputStream2 = new ByteArrayOutputStream();
			byte[] buffer2 = new byte[4096];
			int bytesRead2 = -1;
			while ((bytesRead2 = inputStream2.read(buffer2)) != -1) {
				outputStream2.write(buffer2, 0, bytesRead2);
			}
			byte[] imageBytes2 = outputStream2.toByteArray();
			imageList.add(Base64.getEncoder().encodeToString(imageBytes2));

			inputStream2.close();
			outputStream2.close();

			imageMap.put(matchName, imageList);
		}

		System.out.println(nameList); // 檢查LIST裡面資料

		rs.close();
		state.close();
		jdbcConnServlet.closeConn();

		return imageMap;
	}

}

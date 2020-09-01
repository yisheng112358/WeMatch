package tw.eeit117.wematch.jdbc;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import tw.eeit117.wematch.member.Member;

public class TestMembersGenerator {

	private Connection conn;

	public static void main(String[] args) throws Exception {

		Member mem1 = new Member("doraemon001", "zxcvb234!", "小叮噹", "doraemon@gmail.com", "dora", "M", "KLU",
				"1990-01-29", "ARI", "A", new String[] { "sport" },
				new FileInputStream("WebContent\\testData\\dora01.jpg"),
				new FileInputStream("WebContent\\testData\\dora02.jpg"), 1, "我喜歡大雄很久了");
		Member mem2 = new Member("yaguza002", "aervb1234!", "胖虎", "yaguza002@gmail.com", "fattiger", "M", "KLU",
				"1980-06-30", "ARI", "A", new String[] { "travel" },
				new FileInputStream("WebContent\\testData\\fattiger01.jpg"),
				new FileInputStream("WebContent\\testData\\fattiger02.jpg"), 1, "小夫是我的!");
		Member mem3 = new Member("afuuuuu003", "yhjkcvb254!", "小夫", "afuuuu@gmail.com", "afu", "M", "KLU", "1980-10-18",
				"ARI", "A", new String[] { "reading" }, new FileInputStream("WebContent\\testData\\afu01.jpg"),
				new FileInputStream("WebContent\\testData\\afu02.jpg"), 1, "我是胖虎的人!");
		Member mem4 = new Member("nobita004", "gkohvb2h4!", "大雄", "noobita@gmail.com", "nobita", "M", "KLU",
				"1980-04-04", "ARI", "A", new String[] { "movie" },
				new FileInputStream("WebContent\\testData\\nobita01.jpg"),
				new FileInputStream("WebContent\\testData\\nobita02.jpg"), 1, "多拉A夢救救我啦~胖虎打我");
		Member mem5 = new Member("shitsuka005", "shiivb674!", "靜香", "shitsuka@gmail.com", "shitsuka", "F", "TPH",
				"1980-11-29", "SGR", "A", new String[] { "shopping" },
				new FileInputStream("WebContent\\testData\\shituka01.jpg"),
				new FileInputStream("WebContent\\testData\\shituka02.jpg"), 1, "大雄你怎麼又偷看我洗澡!");

		TestMembersGenerator testMembersGenerator = new TestMembersGenerator();
		testMembersGenerator.createConn();
		testMembersGenerator.processInsert(mem1);
		testMembersGenerator.processInsert(mem2);
		testMembersGenerator.processInsert(mem3);
		testMembersGenerator.processInsert(mem4);
		testMembersGenerator.processInsert(mem5);
		testMembersGenerator.closeConn();
	}

	private void processInsert(Member mem) throws Exception {
		String sqlstr = "INSERT INTO members(member_account, member_pwd, member_name, member_email, nickname, gender, city, birthday, star_sign, blood_type, hobbies, picture_1, picture_2, member_status, self_intro) Values(?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?);";
		PreparedStatement preState = conn.prepareStatement(sqlstr);
		preState.setString(1, mem.getMemberAccount());
		preState.setString(2, mem.getMemberPwd());
		preState.setString(3, mem.getMemberName());
		preState.setString(4, mem.getMemberEmail());
		preState.setString(5, mem.getNickname());
		preState.setString(6, mem.getGender());
		preState.setString(7, mem.getCity());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = sdf.parse(mem.getBirthday());
		preState.setDate(8, new java.sql.Date(utilDate.getTime()));
		preState.setString(9, mem.getStarSign());
		preState.setString(10, mem.getBloodType());
		String joinedHobbies = String.join(", ", mem.getHobbies());
		preState.setString(11, joinedHobbies);
		ArrayList<FileInputStream> pics = new ArrayList<FileInputStream>();
		pics.add(mem.getPic1());
		pics.add(mem.getPic2());
		if (pics.isEmpty()) {
			preState.setBinaryStream(12, null);
			preState.setBinaryStream(13, null);
		} else {
			if (pics.size() == 1) {
				preState.setBinaryStream(12, (InputStream) pics.get(0));
				preState.setBinaryStream(13, null);
			} else if (pics.size() >= 2) {
				preState.setBinaryStream(12, (InputStream) pics.get(0));
				preState.setBinaryStream(13, (InputStream) pics.get(1));
			}
		}
		preState.setInt(14, mem.getMemberStatus());
		preState.setString(15, mem.getSelfIntro());
		preState.execute();
		System.out.println(mem.getMemberAccount() + "已註冊完成");
		preState.close();
	}

	private boolean createConn() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String urlstr = "jdbc:sqlserver://localhost:1433;databaseName=wematch;user=sa;password=0000";
			conn = DriverManager.getConnection(urlstr);

			boolean status = !conn.isClosed();
			System.out.println("Connction open status:" + status);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private void closeConn() throws SQLException {
		if (conn != null) {
			conn.close();
			System.out.println("connection closed.");
		}
	}
}

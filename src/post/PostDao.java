package post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class PostDao {
	private static PostDao instance;

	private PostDao() {
	}

	public static PostDao getInstance() {
		if (instance == null) {
			instance = new PostDao();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection con = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			System.out.println("DB연결성공");
		} catch (Exception e) {
			System.out.println("DB연결실패");
			System.out.println(e.getMessage());
		}
		return con;
	}

	public int insertPost(HttpServletRequest request, Post post) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		String text = (String) request.getAttribute("text");
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into POST " + "values(seq_pid.nextval,sysdate,0,?,?,?,?,?,?,null,0,null)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			// question
			pstmt.setString(1, null);
			// text
			pstmt.setString(2, text);
			// videoURL
			pstmt.setString(3, null);
			// imageURL
			pstmt.setString(4, null);
			// audioURL
			pstmt.setString(5, null);
			// mid
			pstmt.setString(6, id);
			result = pstmt.executeUpdate();
			System.out.println(id);
			System.out.println(text);
			System.out.println("작성성공");
		} catch (Exception e) {
			System.out.println("작성실패");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
			}
		}
		return result;
	}
}

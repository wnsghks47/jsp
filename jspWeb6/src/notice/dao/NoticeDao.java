package notice.dao;

import java.sql.*;

import notice.vo.Notice;

public class NoticeDao {
	public int update(Notice notice) throws Exception {

		String sql="update notices set title=?,content=? where seq=?";
		//db connect
		//드라이버로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//접속
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="scott";
		String pw="123456";
		Connection con=DriverManager.getConnection(url, user, pw);
		//실행
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());
		
		//결과
		int af=pstmt.executeUpdate();
		System.out.println("af : "+af);
		return af;
	}
	
	public Notice getNotice(String seq) throws Exception {

		//dbconnect
		String sql="select * from notices where seq="+seq;
		//db connect
		//드라이버로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//접속
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="scott";
		String pw="123456";
		Connection con=DriverManager.getConnection(url, user, pw);
		//실행
		Statement st=con.createStatement();

		//결과
		ResultSet rs=st.executeQuery(sql);//select 실행
		rs.next();
		
		//Notice에 임시저장하기
		Notice n=new Notice();
		n.setSeq(rs.getString("seq"));
		n.setWriter(rs.getString("writer"));
		n.setTitle(rs.getString("title"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		st.close();
		con.close();
		
		return n;
	}
}

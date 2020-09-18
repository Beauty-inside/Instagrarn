package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vo.UserVO;

public class UserDAO {
	
	@Autowired
	DataSource dataSource;
	
	public int insert( UserVO vo ) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String phone = vo.getPhone();
		String full_name = vo.getFullname();
		String id = vo.getId();
		String pwd = vo.getPwd();

		int res = jdbcTemplate.update("insert into Insta_user (idx, phone, full_name, id, pwd) "
				+ "VALUES (0, ?, ?, ?, ?)", phone, full_name, id, pwd);
		
		return res;
	}
	
	public UserVO select_one( UserVO vo ) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String phone = vo.getPhone();
		String pwd = vo.getPwd();

		String sql = "select * from Insta_user where phone='" + phone + "' and pwd='"+ pwd +"'";
		
		List<UserVO> loginlist = jdbcTemplate.query(sql, new RowMapper<UserVO>() {
			@Override
			public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserVO vo = new UserVO(
						rs.getInt("idx"),
						rs.getString("full_name"),
						rs.getString("id")
						);
				return vo;
			}
		});
		
		if(loginlist.size() != 0) {
			return loginlist.get(0);
		}
		
		return null;
	}
}

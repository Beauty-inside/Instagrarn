package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

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
	public int select_one_check( String phone ) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	
		String sql = "select * from Insta_user where phone='" + phone + "'";
		
		List<UserVO> checkid = jdbcTemplate.query(sql, new RowMapper<UserVO>() {
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
		if(checkid.size() != 0) {
			return -1;
		}
		return 1;
	}
	public int select_one_check_id( String id ) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	
		String sql = "select * from Insta_user where id='" + id + "'";
		
		List<UserVO> checkid = jdbcTemplate.query(sql, new RowMapper<UserVO>() {
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
		if(checkid.size() != 0) {
			return -1;
		}
		return 1;
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

	public UserVO select(int user_idx) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from Insta_user where idx = " + user_idx;
		
		List<UserVO> list =jdbcTemplate.query(sql, new RowMapper<UserVO>() {

			@Override
			public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserVO vo = new UserVO(
						rs.getInt("idx"),
						rs.getString("full_name"),
						rs.getString("id"));
				return vo;
			}
			
		});
		return list.get(0);
	}
	
	public int insert_follow(int user_idx, int follow_idx) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int res = jdbcTemplate.update("insert into Insta_follow (idx, follower_idx, following_idx) "
				+ "VALUES (0, ?, ?)", user_idx, follow_idx);
		
		return res;
	}
}

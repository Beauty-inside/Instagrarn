package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vo.ProfileVO;

public class ProfileDAO {
	
	@Autowired
	DataSource dataSource;

	public int insert(ProfileVO vo) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String content = vo.getContent();
		String area = vo.getArea();
		String img = vo.getImg();
		int user_idx = vo.getUser_idx();
		System.out.println(area);
		
		int res = jdbcTemplate.update("insert into Insta_board (board_idx, user_idx, content, img, area) "
				+ "VALUES (0, ?, ?, ?, ?)", user_idx, content, img, area);
		return res;
	}


	public List<ProfileVO> select(int user_idx) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from Insta_board where user_idx = " + user_idx + " order by board_idx desc";
		
		List<ProfileVO> list =jdbcTemplate.query(sql, new RowMapper<ProfileVO>() {

			@Override
			public ProfileVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProfileVO list = new ProfileVO(
						rs.getInt("board_idx"),
						rs.getInt("user_idx"),
						rs.getString("img"),
						rs.getString("content"),
						rs.getString("area"),
						rs.getInt("like_num"));
				return list;
			}
			
		});
		return list;
	}

	public List<ProfileVO> select_post(int user_idx, int page) {
		int set_page = page * 3;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);//where user_idx = " + user_idx + "
		String sql = "select * from Insta_board order by board_idx desc limit " + set_page + ", 3";
		
		List<ProfileVO> list =jdbcTemplate.query(sql, new RowMapper<ProfileVO>() {

			@Override
			public ProfileVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProfileVO list = new ProfileVO(
						rs.getInt("board_idx"),
						rs.getInt("user_idx"),
						rs.getString("img"),
						rs.getString("content"),
						rs.getString("area"),
						rs.getInt("like_num"));
				
				list.setIsLike(false);
				return list;
			}
			
		});
		return list;
	}
	
	public List<Integer> select_like(int user_idx) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select board_idx from Insta_likes where user_idx = '" + user_idx + "'";
		
		List<Integer> list =jdbcTemplate.query(sql, new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				int board = rs.getInt("board_idx");
				return board;
			}
			
		});
		
		return list;
	}
	
	public int clicked_like(int board_idx) {
		String sql = "update Insta_board set like_num = like_num + 1 where board_idx=" + board_idx;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int res = jdbcTemplate.update(sql);
		
		return res;
	}
	
	public int clicked_like_DB(int board_idx, int user_idx){

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		int res = jdbcTemplate.update("insert into Insta_likes (idx, user_idx, board_idx) "
				+ "VALUES (0, ?, ?)", user_idx, board_idx);
		
		return res;
	}
	
	public int add_reply_DB(int board_idx, int user_idx, String reply){

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update("insert into Insta_reply (idx, board_idx, user_idx, reply) "
				+ "VALUES (0, ?, ?, ?)", user_idx, board_idx, reply);
		
		return board_idx;
	}
	
	public int unclicked_like(int board_idx) {
		String sql = "update Insta_board set like_num = like_num - 1 where board_idx=" + board_idx;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int res = jdbcTemplate.update(sql);
		
		return res;
	}
	
	public int clicked_unlike_DB(int board_idx, int user_idx){

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		int res = jdbcTemplate.update("DELETE FROM Insta_likes WHERE user_idx = ? AND board_idx = ?", user_idx, board_idx);
		
		return res;
	}
}

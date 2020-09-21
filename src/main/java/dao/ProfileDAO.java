package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
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
		System.out.println("페이지머냐"+set_page);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from Insta_board where user_idx = " + user_idx + " order by board_idx desc limit " + set_page + ", 3";
		
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
	
	public int clicked_like(int board_idx) {
		String sql = "update Insta_board set like_num = like_num + 1 where board_idx=" + board_idx;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int res = jdbcTemplate.update(sql);
		
		return res;
	}
	
	public int unclicked_like(int board_idx) {
		String sql = "update Insta_board set like_num = like_num - 1 where board_idx=" + board_idx;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int res = jdbcTemplate.update(sql);
		
		return res;
	}
	
}

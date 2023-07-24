package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.vo.BoardVO;

public class BoardDAO {
	
	public void insertBoard(BoardVO vo) {

		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO user_board (seq, title, content, user_id, views) ");
		sql.append("VALUES ((select nvl(max(seq),0) + 1 from user_board), ?, ?, ?, 0) ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	public void updateBoard(BoardVO vo) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("update user_board set title=?, content=?, updated_at = TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS') ");
		sql.append("where seq = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getSeq());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	public void addViews(int seq) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("update user_board set views = views + 1 ");
		sql.append("where seq = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public List<BoardVO> boardView() {
		List<BoardVO> postList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from user_board ORDER BY seq DESC");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setSeq(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setUserId(rs.getString(4));
				vo.setCreateAt(rs.getString(5));
				vo.setUpdateAt(rs.getString(6));
				vo.setViews(rs.getString(7));
				postList.add(vo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return postList;
	}
	public BoardVO postView(int seq) {
		StringBuilder sql = new StringBuilder();
		BoardVO vo = new BoardVO();
		sql.append("select * from user_board where seq=? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setInt(1, seq);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setSeq(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setUserId(rs.getString(4));
				vo.setCreateAt(rs.getString(5));
				vo.setUpdateAt(rs.getString(6));
				vo.setViews(rs.getString(7));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	
	public void deleteBoard(int seq) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from user_board where seq=? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

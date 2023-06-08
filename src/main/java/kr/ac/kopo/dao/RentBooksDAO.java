package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.vo.BookVO;
import kr.ac.kopo.vo.UserVO;

public class RentBooksDAO {

	public List<BookVO> getUserRentData(String id) {
		
		List<BookVO> bookList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_RENTED ");
		sql.append("WHERE ID = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				/////////
				BookVO book = new BookVO();
				book.setIsbn(rs.getString(1));
				book.setRentUserId(rs.getString(2));
				book.setBookName(rs.getString(3));
				
				// 대여일
				book.setRentalDate(rs.getString(4));
				
				// 반납일
				book.setReturnDate(rs.getString(5));
				
				/////////
				
				bookList.add(book);	
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return bookList;
	}
	
	public BookVO getRentDataWithIsbn(String isbn) {
		
		
		BookVO book = new BookVO();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_RENTED ");
		sql.append("WHERE ISBN = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setString(1, isbn);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				/////////
				book.setIsbn(rs.getString(1));
				book.setRentUserId(rs.getString(2));
				book.setBookName(rs.getString(3));
				
				// 대여일
				book.setRentalDate(rs.getString(4));
				
				// 반납일
				book.setReturnDate(rs.getString(5));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return book;
	}
	
	public void returnBook(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE USER_RENTED ");
		sql.append("WHERE ID = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			pstmt.setString(1, id); //////////////
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

// -*- coding: EUC-KR -*-

package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.vo.BookVO;

public class LibraryBooksDAO {

	public List<BookVO> searchBooks(BookVO vo) {
		
		
		List<BookVO> bookList = new ArrayList<>();
		String bookName = vo.getBookName();
		String writer = vo.getWriter();
		String publisher = vo.getPublisher();
		
		// 
		String orAnd1 = (bookName == "" || writer == "") ? "OR" : "AND";
		String orAnd2 = (writer == "" || publisher == "") ? "OR" : "AND";
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM LIBRARY_BOOKS "); // �뼇履� 媛� 以� �븯�굹媛� NULL�씠硫� OR �븘�땲硫� AND
		sql.append("WHERE BOOK_NAME = ? " + orAnd1 + " WRITER = ? " + orAnd2 + " PUBLISHER = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, bookName);
			pstmt.setString(2, writer);
			pstmt.setString(3, publisher);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BookVO book = new BookVO();
				book.setBookName(rs.getString(2));
				book.setWriter(rs.getString(3));
				book.setPublisher(rs.getString(4));
				book.setIsbn(rs.getString(1));
				book.setRentUserId(rs.getString(5));
				bookList.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookList;
	}
	
	public List<BookVO> searchAllBooks() {

		List<BookVO> bookList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM LIBRARY_BOOKS ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				BookVO book = new BookVO();
				book.setBookName(rs.getString(2));
				book.setWriter(rs.getString(3));
				book.setPublisher(rs.getString(4));
				book.setIsbn(rs.getString(1));
				book.setRentUserId(rs.getString(5));
				bookList.add(book);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookList;
	}
	
	public BookVO searchBookWithIsbn(String isbn) {
		StringBuilder sql = new StringBuilder();
		BookVO vo = new BookVO();
		sql.append("SELECT ISBN, RENT_USER_ID, BOOK_NAME ");
		sql.append("FROM LIBRARY_BOOKS ");
		sql.append("WHERE ISBN = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				pstmt.setString(1, isbn);
				
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					vo.setIsbn(rs.getString(1));
					vo.setRentUserId(rs.getString(2));
					vo.setBookName(rs.getString(3));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		return vo;
	}
	
	public void rentBook(BookVO vo) {
						// isbn id bookname
		
		// 1. user_rented �뀒�씠釉� �뾽�뜲�씠�듃
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO USER_RENTED (ISBN, ID, BOOK_NAME, RENTAL_DATE, RETURN_DATE) ");
		sql.append("VALUES(?, ?, ?, SYSDATE, SYSDATE + 7) ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
				pstmt.setString(1, vo.getIsbn());
				pstmt.setString(2, vo.getRentUserId());
				pstmt.setString(3, vo.getBookName());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

		// 2. �룄�꽌愿� �뀒�씠釉� rent_user_id 媛� �뾽�뜲�씠�듃
		StringBuilder sql2 = new StringBuilder();
		sql2.append("UPDATE LIBRARY_BOOKS ");
		sql2.append("SET RENT_USER_ID = ? ");
		sql2.append("WHERE ISBN = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql2.toString());
			) {
				pstmt.setString(1, vo.getRentUserId());
				pstmt.setString(2, vo.getIsbn());

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	public void returnBook(String isbn) {
		// isbn id bookname
		
		// 1. user_rented �뀒�씠釉� �젅肄붾뱶 �궘�젣
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE USER_RENTED ");
		sql.append("WHERE ISBN = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			pstmt.setString(1, isbn);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 2. �룄�꽌愿� �뀒�씠釉� rent_user_id 媛� �뾽�뜲�씠�듃
		StringBuilder sql2 = new StringBuilder();
		sql2.append("UPDATE LIBRARY_BOOKS ");
		sql2.append("SET RENT_USER_ID = NULL ");
		sql2.append("WHERE ISBN = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql2.toString());
				) {
			pstmt.setString(1, isbn);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void returnBookWithId(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE LIBRARY_BOOKS ");
		sql.append("SET RENT_USER_ID = NULL ");
		sql.append("WHERE RENT_USER_ID = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean isbnChack(String isbn) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ISBN ");
		sql.append("FROM LIBRARY_BOOKS ");
		sql.append("WHERE ISBN = ? ");
		int chackCnt = 0;
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, isbn);
			ResultSet rs = pstmt.executeQuery();
			
			// �씪�씤�씠 �꽭�뼱吏�硫� 以묐났
			while (rs.next()) {
				++ chackCnt;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 湲곗〈�뿉 �뾾�쑝硫� true �엳�쑝硫� false
		return chackCnt == 0 ? true : false;
	}
	
	public void bookRegistration(BookVO vo) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO LIBRARY_BOOKS(ISBN, BOOK_NAME, WRITER, PUBLISHER) ");
		sql.append("VALUES(?, ?, ?, ?)");
	
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			pstmt.setString(1, vo.getIsbn());
			pstmt.setString(2, vo.getBookName());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getPublisher());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void bookRemove(String isbn) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE LIBRARY_BOOKS ");
		sql.append("WHERE ISBN = ? ");
	
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setString(1, isbn);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BookVO> RentBookList() {
		
		List<BookVO> bookList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT LB.BOOK_NAME, LB.ISBN, LB.RENT_USER_ID, UR.RENTAL_DATE, UR.RETURN_DATE ");
		sql.append("FROM LIBRARY_BOOKS LB ");
		sql.append("JOIN USER_RENTED UR ON UR.ISBN = LB.ISBN ");
		sql.append("WHERE RENT_USER_ID IS NOT NULL ");
	
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BookVO vo = new BookVO();
				vo.setBookName(rs.getString(1));
				vo.setIsbn(rs.getString(2));
				vo.setRentUserId(rs.getString(3));
				
				String rd = rs.getString(4);
				rd = rd.split(" ")[0];
				rd = rd.replace("-", "");
				vo.setRentalDate(Integer.parseInt(rd));
				
				String re = rs.getString(5);
				re = re.split(" ")[0];
				re = re.replace("-", "");
				vo.setReturnDate(Integer.parseInt(re));
				
				bookList.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}
}




































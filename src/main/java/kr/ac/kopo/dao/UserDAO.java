package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.vo.UserVO;

public class UserDAO {
	
	// 지금의 오류는 birthDate 타입을 int에서 Date 타입으로 바꿔서 발생하는 오류임
	public boolean idChack(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ID, PASSWORD ");
		sql.append("FROM USER_INFO ");
		sql.append("WHERE ID = ? ");
		int chackCnt = 0;
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// �씪�씤�씠 �꽭�뼱吏�硫� 以묐났
			while (rs.next()) {
				++ chackCnt;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 아이디가 중복이 아닐경우 true 반환
		return chackCnt == 0 ? true : false;
	}

	public void userDataInsert(UserVO vo) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO USER_INFO(ID, PASSWORD, NAME, ");
		sql.append("BIRTH_DATE, EMAIL, PHONE_NUM)");
		sql.append("VALUES(?, ?, ? ");
		sql.append(	", to_date(?, 'YYYY-MM-DD'), ?, ?)");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getBirthDate()); // �궇�옄媛믪쑝濡� 諛붽퓭�빞�븿
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getPhoneNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public UserVO userLogIn(UserVO vo) {
//		System.out.println("userLoginDAOstart");
//		System.out.println(vo.getId());
//		System.out.println(vo.getPassword());
		
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ID, PASSWORD, ADMIN_RIGHT ");
		sql.append("FROM USER_INFO ");
		sql.append("WHERE ID = ? AND PASSWORD = ? ");
		int chackCnt = 0;
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			// 유저탐색
			while (rs.next()) {
				++ chackCnt;
				vo.setAdminRight(rs.getInt(3));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return chackCnt == 1 ? vo : null;
	}
	
	public UserVO getUserData(String id) {
		
		UserVO userVo = new UserVO();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_INFO ");
		sql.append("WHERE ID = ? ");
		int chackCnt = 0;
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			userVo.setId(rs.getString("ID"));
			userVo.setPassword(rs.getString("PASSWORD"));
			userVo.setName(rs.getString("NAME"));
			
			// �깮�씪 泥섎━
			userVo.setBirthDate(rs.getString(4).split(" ")[0]);
			
			userVo.setEmail(rs.getString("EMAIL"));
			userVo.setPhoneNum(rs.getString("PHONE_NUM"));

			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return userVo;
	}
	
	public void userDataUpdate(UserVO vo) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE USER_INFO ");
		sql.append("SET PASSWORD = ?, NAME = ?, BIRTH_DATE = to_date(?, 'YYYY-MM-DD'), EMAIL = ?, PHONE_NUM = ? ");
		sql.append("WHERE ID = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getBirthDate()); // �궇�옄媛믪쑝濡� 諛붽퓭�빞�븿
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhoneNum());
			pstmt.setString(6, vo.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// �뜲�씠�꽣 �궘�젣
	public void userDataRemove(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM USER_INFO ");
		sql.append("WHERE ID = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 유저탐색
	
	public List<UserVO> searchMembersWithId(String id) {
		
		List<UserVO> userList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_INFO ");
		sql.append("WHERE ID LIKE ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, "%"+id+"%");

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				UserVO userVo = new UserVO();
				
				userVo.setId(rs.getString(1));
				userVo.setPassword(rs.getString(2));
				userVo.setName(rs.getString(3));
				userVo.setBirthDate(rs.getString(4).split(" ")[0]);
				userVo.setEmail(rs.getString(5));
				userVo.setPhoneNum(rs.getString(6));
				userVo.setAdminRight(rs.getInt(7));
	
				userList.add(userVo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	public List<UserVO> searchMembersWithName(String name) {
		
		List<UserVO> userList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_INFO ");
		sql.append("WHERE NAME LIKE ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setString(1, "%"+name+"%");
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				UserVO userVo = new UserVO();
				
				userVo.setId(rs.getString(1));
				userVo.setPassword(rs.getString(2));
				userVo.setName(rs.getString(3));
				userVo.setBirthDate(rs.getString(4).split(" ")[0]);
				userVo.setEmail(rs.getString(5));
				userVo.setPhoneNum(rs.getString(6));
				userVo.setAdminRight(rs.getInt(7));
				
				userList.add(userVo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	public List<UserVO> searchMembersWithEmail(String email) {
		
		List<UserVO> userList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_INFO ");
		sql.append("WHERE EMAIL LIKE ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setString(1, "%"+email+"%");
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				UserVO userVo = new UserVO();
				
				userVo.setId(rs.getString(1));
				userVo.setPassword(rs.getString(2));
				userVo.setName(rs.getString(3));
				userVo.setBirthDate(rs.getString(4).split(" ")[0]);
				userVo.setEmail(rs.getString(5));
				userVo.setPhoneNum(rs.getString(6));
				userVo.setAdminRight(rs.getInt(7));
				
				userList.add(userVo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	public List<UserVO> searchMembersWithPhoneNum(String phoneNum) {
		
		List<UserVO> userList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_INFO ");
		sql.append("WHERE PHONE_NUM LIKE ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setString(1, "%"+phoneNum+"%");
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				UserVO userVo = new UserVO();
				
				userVo.setId(rs.getString(1));
				userVo.setPassword(rs.getString(2));
				userVo.setName(rs.getString(3));
				userVo.setBirthDate(rs.getString(4).split(" ")[0]);
				userVo.setEmail(rs.getString(5));
				userVo.setPhoneNum(rs.getString(6));
				userVo.setAdminRight(rs.getInt(7));
				
				userList.add(userVo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	public List<UserVO> searchAllMembers() {
		
		List<UserVO> userList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USER_INFO ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				UserVO userVo = new UserVO();
				
				userVo.setId(rs.getString(1));
				userVo.setPassword(rs.getString(2));
				userVo.setName(rs.getString(3));

				userVo.setBirthDate(rs.getString(4).split(" ")[0]);
				
				userVo.setEmail(rs.getString(5));
				userVo.setPhoneNum(rs.getString(6));
				userVo.setAdminRight(rs.getInt(7));
	
				userList.add(userVo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	
	
	public void giveAdminRights(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE USER_INFO ");
		sql.append("SET ADMIN_RIGHT = 1 ");
		sql.append("WHERE ID = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, id);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

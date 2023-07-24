package kr.ac.kopo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.ac.kopo.vo.BoardVO;
import kr.ac.kopo.vo.UserVO;

@Mapper
public interface SqlMapper {
	
	//lib
	
	@Select("SELECT EMAIL FROM USER_INFO WHERE ID = #{id}")
	UserVO getUserEmailwithId(String id);
	
	@Insert("INSERT INTO LIB_COMMENT(COMMENT_ID, SEQ, PARENTS_CO_ID, DEPTH, USER_ID, CONTENT) "
		+	"VALUES((select nvl(max(COMMENT_ID), 1) + 1 from LIB_COMMENT), "
		+ 	"#{seq}, 0, 1, #{userId}, #{content}) ")
	void insertComment(BoardVO vo);
	
	@Select("SELECT * FROM LIB_COMMENT WHERE SEQ = #{seq} ORDER BY COMMENT_ID")
	List<BoardVO> getCommentList(int seq);
	
	@Delete("DELETE LIB_COMMENT WHERE COMMENT_ID = #{commentId}")
	void delComment(int commentId);
	
	
}

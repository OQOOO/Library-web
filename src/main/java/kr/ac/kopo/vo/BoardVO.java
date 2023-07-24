package kr.ac.kopo.vo;

public class BoardVO {
	private int seq;
	private String title;
	private String content;
	private String userId;
	private String createAt;
	private String updateAt;
	private String views;
	private int commentId;
	
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getCommentId() {
		return commentId;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCreateAt() {
		return createAt;
	}
	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}
	public String getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(String updateAt) {
		this.updateAt = updateAt;
	}
	
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
		this.views = views;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "UserBoardVO [title=" + title + ", content=" + content + ", userId=" + userId + "]";
	}
}

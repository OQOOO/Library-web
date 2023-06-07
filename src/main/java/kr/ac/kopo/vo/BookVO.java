package kr.ac.kopo.vo;

public class BookVO {

	private String isbn;
	private String bookName;
	private String writer;
	private String publisher;
	private String rentUserId;
	private String rentalDate;
	private String returnDate;
	
	public BookVO() {
		
	}
	
	// �룄�꽌 �젙蹂�
	public BookVO(String isbn, String bookName, String writer, String publisher, String rentUserId) {
		super();
		this.isbn = isbn;
		this.bookName = bookName;
		this.writer = writer;
		this.publisher = publisher;
		this.rentUserId = rentUserId;
	}

	// ���뿬 �젙蹂�
	/*
	public BookVO(String isbn, String rentUserId, String bookName, String rentalDate, String returnDate) {
		super();
		this.isbn = isbn;
		this.rentUserId = rentUserId;
		this.bookName = bookName;
		this.rentalDate = rentalDate;
		this.returnDate = returnDate;
	}*/

	public String getIsbn() {
		return isbn;
	}
	
	public String getBookName() {
		return bookName;
	}
	
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getPublisher() {
		return publisher;
	}
	
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getRentUserId() {
		return rentUserId;
	}

	public void setRentUserId(String rentUserId) {
		this.rentUserId = rentUserId;
	}

	public String getRentalDate() {
		return rentalDate;
	}

	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	@Override
	public String toString() {
		return "BookVO [isbn=" + isbn + ", bookName=" + bookName + ", writer=" + writer + ", publisher=" + publisher
				+ ", rentUserId=" + rentUserId + ", rentalDate=" + rentalDate + ", returnDate=" + returnDate + "]";
	}

	
	
	
}

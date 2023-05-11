package com.itwillbs.spring_mvc_board.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

/*
 mvc_board3.tiny_reply_board 테이블 생성
 ------------------------------------
 글번호(reply_num) : 정수, PK
 원본글번호(board_num) : 정수, NN
 작성자(reply_name) : 문자 20글자, NN
 내용(reply_content) : 문자 100글자, NN
 참조글번호(reply_re_ref) : 정수, NN
 들여쓰기레벨(reply_re_lev) : 정수, NN
 순서번호(reply_re_seq) : 정수, NN
 작성일(reply_date) : 날짜 및 시각(DATETIME), NN
 --------------------------------------
 CREATE TABLE tiny_reply_board (
	reply_num INT PRIMARY KEY,
	board_num INT NOT NULL,
	reply_name VARCHAR(20) NOT NULL,
	reply_content VARCHAR(100) NOT NULL,
	reply_re_ref INT NOT NULL,
	reply_re_lev INT NOT NULL,
	reply_re_seq INT NOT NULL,
	reply_date DATETIME NOT NULL,
	FOREIGN KEY (board_num) REFERENCES board(board_num) ON DELETE CASCADE
 );
 */
public class TinyReplyBoardVO {
	// board 테이블의 각 컬럼에 대응하는 멤버변수 선언 및 Getter/Setter 정의
	private int reply_num;
	private int board_num;
	private String reply_name;
	private String reply_content;
	private int reply_re_ref;
	private int reply_re_lev;
	private int reply_re_seq;
	private Timestamp reply_date; // java.sql.TimeStamp(날짜 및 시각 관리)
	
	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getReply_name() {
		return reply_name;
	}

	public void setReply_name(String reply_name) {
		this.reply_name = reply_name;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getReply_re_ref() {
		return reply_re_ref;
	}

	public void setReply_re_ref(int reply_re_ref) {
		this.reply_re_ref = reply_re_ref;
	}

	public int getReply_re_lev() {
		return reply_re_lev;
	}

	public void setReply_re_lev(int reply_re_lev) {
		this.reply_re_lev = reply_re_lev;
	}

	public int getReply_re_seq() {
		return reply_re_seq;
	}

	public void setReply_re_seq(int reply_re_seq) {
		this.reply_re_seq = reply_re_seq;
	}

	public Timestamp getReply_date() {
		return reply_date;
	}

	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "TinyReplyBoardVO [reply_num=" + reply_num + ", board_num=" + board_num + ", reply_name=" + reply_name
				+ ", reply_content=" + reply_content + ", reply_re_ref=" + reply_re_ref + ", reply_re_lev="
				+ reply_re_lev + ", reply_re_seq=" + reply_re_seq + ", reply_date=" + reply_date + "]";
	}

	
}










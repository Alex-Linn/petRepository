package com.mdd.mt.model;

import java.util.Date;

public class CommentView {
	private Integer id;

	private Integer movieId;

	private Integer userId;
	
	private String userName;
	
	private String userPicture;

	private Integer score;

	private Integer dianzan;
	
	private Date createTime;

	private String comment;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getDianzan() {
		return dianzan;
	}

	public void setDianzan(Integer dianzan) {
		this.dianzan = dianzan;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "CommentView [id=" + id + ", movieId=" + movieId + ", userId=" + userId + ", userName=" + userName
				+ ", userPicture=" + userPicture + ", score=" + score + ", dianzan=" + dianzan + ", createTime="
				+ createTime + ", comment=" + comment + "]";
	}

	
	
}
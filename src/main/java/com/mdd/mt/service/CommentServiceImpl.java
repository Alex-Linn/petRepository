package com.mdd.mt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mdd.mt.mapper.CommentMapper;
import com.mdd.mt.model.Comment;

@Component
public class CommentServiceImpl {

	@Autowired
	private CommentMapper commentMapper;

	/**
	 * 获取电影的所有评论
	 * 
	 * @param movieId
	 * @return
	 */
	public List<Comment> getCommentByMovieId(int movieId) {
		List<Comment> commentList = commentMapper.getCommentByMovieId(movieId);
		return commentList;
	}

	/**
	 * 发布评论
	 * 
	 * @param comment
	 */
	public void insertComment(Comment comment) {
		if (comment != null) {
			commentMapper.insert(comment);
		}
	}
}

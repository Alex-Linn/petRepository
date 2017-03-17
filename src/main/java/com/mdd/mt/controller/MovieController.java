package com.mdd.mt.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mdd.mt.model.Comment;
import com.mdd.mt.model.CommentView;
import com.mdd.mt.model.Movie;
import com.mdd.mt.model.User;
import com.mdd.mt.service.CommentServiceImpl;
import com.mdd.mt.service.MovieServiceImpl;
import com.mdd.mt.service.UserService;

/**
 * 
 * @author xwl
 *
 */
@Controller
@RequestMapping("/mt/")
public class MovieController {
	@Autowired
	private MovieServiceImpl movieServiceImpl;

	@Autowired
	private CommentServiceImpl commentServiceImpl;

	@Autowired
	private UserService userService;

	/**
	 * 加载首页信息
	 * 
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadIndex")
	public String loadIndex(ModelMap modelMap) {
		// 已上映
		List<Movie> isShowMovieList = movieServiceImpl.getTopSixMovie(1);
		// 未上映
		List<Movie> noShowMovieList = movieServiceImpl.getTopSixMovie(0);
		modelMap.put("isShowMovieList", isShowMovieList);
		modelMap.put("noShowMovieList", noShowMovieList);
		return "index";
	}

	/**
	 * 电影详细信息
	 * 
	 * @param movieId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("movieDetail")
	public String movieDetail(@Param("movieId") int movieId, ModelMap modelMap) {
		movieDetailUtil(movieId, modelMap);
		return "movieDetail";
	}

	/**
	 * 发布评论
	 * @param comment
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "postComment",method=RequestMethod.POST)
	public String postComment(Comment comment, ModelMap modelMap) {
		movieDetailUtil(comment.getMovieId(), modelMap);
		commentServiceImpl.insertComment(comment);
		return "movieDetailWithComment";
	}

	/**
	 * 加载电影详细信息
	 * @param movieId
	 * @param modelMap
	 */
	private void movieDetailUtil(int movieId, ModelMap modelMap) {
		// 电影信息
		Movie movie = movieServiceImpl.getMovieById(movieId);
		modelMap.addAttribute("movie", movie);
		// 影评信息
		List<CommentView> commentViewList = new ArrayList<CommentView>();
		List<Comment> commentList = commentServiceImpl.getCommentByMovieId(movieId);
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			User user = userService.getUserById(comment.getUserId());
			if (user != null) {
				BeanUtils.copyProperties(comment, commentView);
				commentView.setUserName(user.getUserName());
				commentView.setUserPicture(user.getUserPicture());
				commentView.setUserTel(user.getUserTel());
				commentViewList.add(commentView);
			}
		}
		modelMap.addAttribute("commentViewList", commentViewList);
	}
}

package com.mdd.mt.mapper;

import com.mdd.mt.model.Movie;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
     * Created by Administrator on 2017/1/1.
     */
    public interface MovieMapper {
        /**
         * 保存电影
         * @param moiveList
         */
        void saveMoive(List<Movie> moiveList);

        /**
         * 根据电影名字查询
         * @param moiveName
         * @return
         */
        Movie queryMovieByName(@Param("moiveName") String moiveName);

}

package com.mdd.mt.service;

import com.mdd.mt.mapper.MovieMapper;
import com.mdd.mt.model.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/1/2.
 */
@Service
public class MovieServiceImpl {
    @Autowired
    private MovieMapper movieMapper;

    public void saveMoive(List<Movie> moiveList){
        if(moiveList!=null){
            movieMapper.saveMoive(moiveList);
        }else {

        }
    }

}

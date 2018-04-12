package com.manager.service;

import com.manager.bean.Results;

import java.util.List;

public interface ResultsService {
    int deleteByPrimaryKey(Integer id);

    int insert(Results record);

    int insertSelective(Results record);

    List<Results> selectAll();

    Results selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Results record);

    int updateByPrimaryKey(Results record);

    List<Results> selectBySelective(Results record);
}
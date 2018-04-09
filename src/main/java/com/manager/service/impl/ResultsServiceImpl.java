package com.manager.service.impl;

import com.manager.bean.Results;
import com.manager.mapper.ResultsMapper;
import com.manager.service.ResultsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResultsServiceImpl implements ResultsService{

    @Autowired
    private ResultsMapper resultsMapper;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return resultsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Results record) {
        return resultsMapper.insert(record);
    }

    @Override
    public int insertSelective(Results record) {
        return resultsMapper.insertSelective(record);
    }

    @Override
    public List<Results> selectAll() {
        return resultsMapper.selectAll();
    }

    @Override
    public Results selectByPrimaryKey(Integer id) {
        return resultsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Results record) {
        return resultsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Results record) {
        return resultsMapper.updateByPrimaryKey(record);
    }
}

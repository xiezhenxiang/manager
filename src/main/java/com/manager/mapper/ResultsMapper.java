package com.manager.mapper;

import com.manager.bean.Results;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ResultsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Results record);

    int insertSelective(Results record);

    List<Results> selectBySelective(Results record);

    List<Results> selectAll();

    Results selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Results record);

    int updateByPrimaryKey(Results record);
}
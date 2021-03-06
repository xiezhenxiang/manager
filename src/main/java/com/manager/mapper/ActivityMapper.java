package com.manager.mapper;

import com.manager.bean.Activity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity record);

    int insertSelective(Activity record);

    List<Activity> selectAll();

    List<Activity> selectBySelective(Activity para);

    Activity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);

    int getApplyCount(Integer id);
}
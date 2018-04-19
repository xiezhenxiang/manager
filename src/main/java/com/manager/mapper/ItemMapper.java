package com.manager.mapper;

import com.manager.bean.Item;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface ItemMapper {
    int deleteByPrimaryKey(int id);

    int insert(Item record);

    int insertSelective(Item record);

    List<Item> selectAll();

    List<Item> selectBySelective(Item para);

    Item selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);

    void cancelApply(Map<String, Object> para);
}
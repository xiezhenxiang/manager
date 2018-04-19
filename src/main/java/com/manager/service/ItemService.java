package com.manager.service;

import com.manager.bean.Item;

import java.util.List;
import java.util.Map;

public interface ItemService {
    int deleteByPrimaryKey(int id);

    int insert(Item record);

    int insertSelective(Item record);

    List<Item> selectAll();

    Item selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);

    List<Item> selectBySelective(Item para);

    void cancelApply(Map<String, Object> para);
}
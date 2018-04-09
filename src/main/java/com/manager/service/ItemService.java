package com.manager.service;

import com.manager.bean.Item;

import java.util.List;

public interface ItemService {
    int deleteByPrimaryKey(int id);

    int insert(Item record);

    int insertSelective(Item record);

    List<Item> selectAll();

    Item selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);
}
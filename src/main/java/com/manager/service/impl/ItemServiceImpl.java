package com.manager.service.impl;

import com.manager.bean.Item;
import com.manager.mapper.ItemMapper;
import com.manager.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ItemServiceImpl implements ItemService{

    @Autowired
    private ItemMapper itemMapper;


    @Override
    public int deleteByPrimaryKey(int id) {
        return itemMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Item record) {
        return itemMapper.insert(record);
    }

    @Override
    public int insertSelective(Item record) {
        return itemMapper.insertSelective(record);
    }

    @Override
    public List<Item> selectAll() {
        return itemMapper.selectAll();
    }

    @Override
    public Item selectByPrimaryKey(int id) {
        return itemMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Item record) {
        return itemMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Item record) {
        return itemMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Item> selectBySelective(Item para) {
        return itemMapper.selectBySelective(para);
    }

    @Override
    public void cancelApply(Map<String, Object> para) {
        itemMapper.cancelApply(para);
    }
}

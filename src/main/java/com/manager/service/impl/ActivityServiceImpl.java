package com.manager.service.impl;

import com.manager.bean.Activity;
import com.manager.mapper.ActivityMapper;
import com.manager.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ActivityServiceImpl implements ActivityService {


    @Autowired
    ActivityMapper activityMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return activityMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Activity record) {
        return activityMapper.insert(record);
    }

    @Override
    public int insertSelective(Activity record) {
        return activityMapper.insertSelective(record);
    }

    @Override
    public Activity selectByPrimaryKey(Integer id) {
        return activityMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Activity> selectAll() {
        return activityMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKeySelective(Activity record) {
        return activityMapper.updateByPrimaryKeySelective(record);
    }


    @Override
    public int updateByPrimaryKey(Activity record) {
        return activityMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Activity> selectBySelective(Activity para) {
        return activityMapper.selectBySelective(para);
    }

    @Override
    public int getApplyCount(Integer id) {
        return activityMapper.getApplyCount(id);
    }
}

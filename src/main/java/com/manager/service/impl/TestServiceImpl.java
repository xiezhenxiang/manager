package com.manager.service.impl;

import com.manager.bean.Role;
import com.manager.mapper.TestMapper;
import com.manager.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestMapper testMapper;

    @Override
    public List<Role> getList() {
        return  testMapper.getList();
    }
}

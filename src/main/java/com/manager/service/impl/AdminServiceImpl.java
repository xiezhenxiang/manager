package com.manager.service.impl;

import com.manager.bean.Admin;
import com.manager.bean.Rp;
import com.manager.mapper.ActivityMapper;
import com.manager.mapper.AdminMapper;
import com.manager.mapper.RpMapper;
import com.manager.mapper.UserMapper;
import com.manager.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RpMapper rpMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return adminMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Admin record) {
        return adminMapper.insert(record);
    }

    @Override
    public List<Admin> selectAll() {
        return adminMapper.selectAll();
    }

    @Override
    public int insertSelective(Admin record) {
        return adminMapper.insertSelective(record);
    }

    @Override
    public Admin selectByPrimaryKey(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Admin record) {
        return adminMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Admin record) {
        return adminMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Admin> selectAdminSelective(Admin para) {
        return adminMapper.selectAdminSelective(para);
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Admin> selectByKeyword(String keyword) {
        return adminMapper.selectByKeyWord(keyword);
    }

    @Override
    public List<Integer> getPrivilegeById(int id) {
        List<Integer> ls = adminMapper.getPrivilegeById(id);
        return ls;
    }

    @Override
    public void addPower(int rId, int pid) {
        Rp rp = new Rp();
        rp.setPid(pid);
        rp.setRid(rId);
        rpMapper.insertSelective(rp);
    }

    @Override
    public void delRp(int rId) {
        rpMapper.delRp(rId);
    }

    @Override
    public List<Integer> getPs(Integer rId) {
        List<Integer> ps = rpMapper.getPs(rId);
        return ps;
    }
}

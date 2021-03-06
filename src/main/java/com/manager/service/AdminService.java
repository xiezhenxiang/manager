package com.manager.service;

import com.manager.bean.Admin;

import java.util.List;

public interface AdminService {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    List<Admin> selectAll();

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    List<Admin> selectAdminSelective(Admin para);

    void deleteUser(Integer id);

    List<Admin> selectByKeyword(String keyword);

    List<Integer> getPrivilegeById(int id);

    void addPower(int rId, int pid);

    void delRp(int rId);

    List<Integer> getPs(Integer rId);
}
package com.manager.mapper;

import com.manager.bean.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    List<Admin> selectAll();

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    List<Admin> selectAdminSelective(Admin para);

    List<Admin> selectByKeyWord(@Param("keyword") String keyword);

    List<Integer> getPrivilegeById(@Param("id")int id);
}
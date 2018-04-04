package com.manager.mapper;

import com.manager.bean.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TestMapper {

    List<Role> getList();
}

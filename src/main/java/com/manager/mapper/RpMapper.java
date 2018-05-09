package com.manager.mapper;

import com.manager.bean.Rp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RpMapper {
    int insert(Rp record);

    int insertSelective(Rp record);

    void delRp(@Param("rId") int rId);

    List<Integer> getPs(@Param("rId")Integer rId);
}
package com.manager.mapper;

import com.manager.bean.Rp;

public interface RpMapper {
    int insert(Rp record);

    int insertSelective(Rp record);
}
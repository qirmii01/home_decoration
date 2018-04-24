package com.hd.mapper;

import com.hd.domain.DecorationEffectImg;

public interface DecorationEffectImgMapper {
    int deleteByPrimaryKey(String id);

    int insert(DecorationEffectImg record);

    int insertSelective(DecorationEffectImg record);

    DecorationEffectImg selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DecorationEffectImg record);

    int updateByPrimaryKey(DecorationEffectImg record);
}
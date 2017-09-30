package com.kf.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PushInfoTagMapper {

    void insertPushInfoTag(@Param("tagId") Integer tagId, @Param("piId") Integer piId, @Param("piTagContent") Integer piTagContent);
}

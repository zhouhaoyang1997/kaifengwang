package com.kf.mapper;

import com.kf.pojo.PushInfoClass;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface PushInfoClassMapper {

    List<PushInfoClass> selectAll(@Param("mcId") int mcId);
}


package com.kf.mapper;

import com.kf.pojo.MainClass;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MainClassMapper {

    List<MainClass> selectAllClass();

    String selectMcName(@Param("mcId") Integer mcId);
}

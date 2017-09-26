package com.kf.mapper;

import com.kf.pojo.MainClass;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainClassMapper {

    List<MainClass> selectAllClass();
}

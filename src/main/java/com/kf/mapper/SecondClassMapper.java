package com.kf.mapper;

import com.kf.pojo.SecondClass;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SecondClassMapper {
    List<SecondClass> selectAllSecondClass(@Param("mcId") int mcId);
}

package com.kf.mapper;

import com.kf.pojo.Advert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdvertMapper {
    List<Advert> selectAdvertByPage(@Param("page")String page);
}

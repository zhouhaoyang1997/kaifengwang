package com.kf.mapper;

import com.kf.pojo.HotSearch;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 18236 on 2017/10/26.
 */
@Mapper
public interface HotSearchMapper {


    List<HotSearch> selectHotSearch(@Param("numLim")Integer num);
}

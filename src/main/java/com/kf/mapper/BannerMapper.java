package com.kf.mapper;

import com.kf.pojo.Banner;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 18236 on 2017/11/17.
 */
@Mapper
public interface BannerMapper {
    List<Banner> selectBannerByMcId(@Param("mcId") Integer mcId);
}

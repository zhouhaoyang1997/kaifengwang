package com.kf.mapper;

import com.kf.pojo.District;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by 18236 on 2017/9/26.
 */
@Mapper
public interface DistrictMapper {
    List<District> selectAllDistrict();
}

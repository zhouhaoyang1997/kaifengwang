package com.kf.mapper;

import com.kf.pojo.Tag;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 18236 on 2017/9/26.
 */
@Mapper
public interface TagMapper {
    List<Tag> selectAllTag(@Param("mcId") int mcId);
}

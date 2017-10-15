package com.kf.mapper;

import com.kf.pojo.Tip;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by 18236 on 2017/10/14.
 */
@Mapper
public interface TipMapper {
    void insertTip(Tip tip);
}

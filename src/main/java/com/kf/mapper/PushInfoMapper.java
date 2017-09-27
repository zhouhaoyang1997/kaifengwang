package com.kf.mapper;

import com.kf.pojo.PushInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by 18236 on 2017/9/26.
 */
@Mapper
public interface PushInfoMapper {

    public List<PushInfo> selectAllJob();

}

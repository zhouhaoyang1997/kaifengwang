package com.kf.mapper;

import com.kf.pojo.PushInfo;
import com.kf.vo.TagValue;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * Created by 18236 on 2017/9/26.
 */
@Mapper
public interface PushInfoMapper {

    List<PushInfo> selectAllJob(@Param("mcId") Integer mcId, @Param("scId") Integer scId, @Param("districtId") Integer districtId, @Param("tags") List<TagValue> tags, @Param("tagNum") Integer tagNum);


    void addPushInfo(PushInfo pushInfo);
}

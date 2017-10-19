package com.kf.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PicContentMapper {
    void insertPicContent(@Param("picId") int picId, @Param("piId") Integer piId, @Param("pcContent") String pcContent);

    void updatePicContent(@Param("picId") int picId, @Param("piId") Integer piId, @Param("pcContent") String pcContent);
}

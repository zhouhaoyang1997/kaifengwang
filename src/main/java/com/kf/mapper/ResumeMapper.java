package com.kf.mapper;

import com.kf.pojo.Resume;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * Created by 18236 on 2017/11/2.
 */
@Mapper
public interface ResumeMapper {
    void insertResume(Resume resume);


    Resume selectResumeByUserId(@Param("userId")Integer userId);

    void updateResume(Resume resume);
}

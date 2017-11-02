package com.kf.mapper;

import com.kf.pojo.Resume;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by 18236 on 2017/11/2.
 */
@Mapper
public interface ResumeMapper {
    void insertResume(Resume resume);
}

package com.kf.mapper;

import com.kf.pojo.Resume;
import com.kf.vo.ResumeMin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 18236 on 2017/11/2.
 */
@Mapper
public interface ResumeMapper {
    void insertResume(Resume resume);


    Resume selectResumeByUserId(@Param("userId")Integer userId);

    void updateResume(Resume resume);

    void updateResumeCvOpenFlag(@Param("cvId") Integer cvId,@Param("openFlag") Integer openFlag);

    List<Resume> selectResumeList(@Param("resumeMin")ResumeMin resumeMin);


    Resume selectResumeByCvId(@Param("cvId")Integer cvId);

    List<Resume> selectResumeByNum(@Param("num")Integer num);
}

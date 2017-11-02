package com.kf.service;

import com.kf.mapper.ResumeMapper;
import com.kf.pojo.Resume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 18236 on 2017/11/2.
 */
@Service
public class ResumeService {

    @Autowired
    private ResumeMapper resumeMapper;

    /**
     * 插入简历信息，返回简历id备用
     * @param resume
     * @return
     */
    public Integer insertResume(Resume resume){
        resumeMapper.insertResume(resume);
        return resume.getCvId();
    }
}

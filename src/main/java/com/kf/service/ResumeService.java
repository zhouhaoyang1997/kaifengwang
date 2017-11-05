package com.kf.service;

import com.kf.mapper.ResumeMapper;
import com.kf.pojo.Resume;
import com.kf.util.FileUtil;
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
    public Integer insertOrUpdateResume(Resume resume,String basePath){
        Resume resume1 = getResume(resume.getUserId());
        //如果数据库中已存在,更新
        if(resume1!=null){
            //如果已有图片则删除
            if(resume1.getCvImg()!=null){
                FileUtil.deleteImg(basePath+resume1.getCvImg());
            }
            resumeMapper.updateResume(resume);
        }else{
            resumeMapper.insertResume(resume);
        }
        return resume.getCvId();
    }


    public Resume getResume(Integer userId){
        return resumeMapper.selectResumeByUserId(userId);
    }
}

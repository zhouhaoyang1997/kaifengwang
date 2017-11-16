package com.kf.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kf.mapper.ResumeMapper;
import com.kf.pojo.PushInfo;
import com.kf.pojo.Resume;
import com.kf.util.BasePage;
import com.kf.util.FileUtil;
import com.kf.util.PageUtil;
import com.kf.vo.ResumeMin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 18236 on 2017/11/2.
 */
@Service
public class ResumeService {

    @Autowired
    private ResumeMapper resumeMapper;


    @Autowired
    private BasePage basePage;

    /**
     * 插入简历信息，返回简历id备用
     * @param resume
     * @return
     */
    public Integer insertOrUpdateResume(Resume resume,String basePath,boolean deletePicFlag){
        Resume resume1 = getResume(resume.getUserId());
        //如果数据库中已存在,更新
        if(resume1!=null){
            //如果已有图片则删除
            if(resume1.getCvImg()!=null&&deletePicFlag){
                FileUtil.deleteImg(basePath+resume1.getCvImg());
            }
            resume.setCvId(resume1.getCvId());
            resumeMapper.updateResume(resume);
        }else{
            resumeMapper.insertResume(resume);
        }
        return resume.getCvId();
    }


    public List<Resume> getResumeList(ResumeMin resumeMin, Integer pageNum, PageUtil pageUtil){
        PageHelper.startPage(pageNum,basePage.getPageSize());
        List<Resume> resumes = resumeMapper.selectResumeList(resumeMin);
        PageInfo<Resume> pageInfo=new PageInfo<>(resumes);
        pageUtil.setPageNums(pageInfo.getPages());
        pageUtil.setTotal(pageInfo.getTotal());
        return resumes;
    }

    public List<Resume> getResumeByNum(Integer num){
        return resumeMapper.selectResumeByNum(num);
    }


    public Resume getResume(Integer userId){
        return resumeMapper.selectResumeByUserId(userId);
    }

    public void updateResumeOpenFlag(Integer openFlag,Integer cvId){
        resumeMapper.updateResumeCvOpenFlag(cvId,openFlag);
    }

    public Resume getResumeByCvId(Integer cvId){
        return resumeMapper.selectResumeByCvId(cvId);
    }

}

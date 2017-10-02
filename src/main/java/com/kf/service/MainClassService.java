package com.kf.service;

import com.kf.mapper.MainClassMapper;
import com.kf.pojo.MainClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainClassService {
    @Autowired
    public MainClassMapper mainClassMapper;

    /**
     * 该方法用来获取首页所有的大类
     * @return
     */
    public List<MainClass> getMainClass(){
        return mainClassMapper.selectAllClass();
    }



    public String getMcName(Integer mcId){
        return mainClassMapper.selectMcName(mcId);
    }
}

package com.kf.service;

import com.kf.mapper.SecondClassMapper;
import com.kf.pojo.SecondClass;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 18236 on 2017/9/25.
 */
@Service
public class SecondClassService {

    @Autowired
    public SecondClassMapper secondClassMapper;

    /**
     * 获取大类下的所有小类
     * @param mcId
     * @return
     */
    public List<SecondClass> getAllSecondClass(int mcId){
        return secondClassMapper.selectAllSecondClass( mcId);
    }
}

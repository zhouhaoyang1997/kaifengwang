package com.kf.service;

import com.kf.mapper.PushInfoMapper;
import com.kf.pojo.PushInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
/**
 * Created by 18236 on 2017/9/26.
 */
@Service
public class PushInfoService {
    @Autowired
    private PushInfoMapper jobInfoMapper;

    public List<PushInfo> getAllJob(){
        return jobInfoMapper.selectAllJob();
    }
}

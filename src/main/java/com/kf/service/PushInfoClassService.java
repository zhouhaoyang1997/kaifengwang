package com.kf.service;

import com.kf.mapper.PushInfoClassMapper;
import com.kf.pojo.PushInfoClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PushInfoClassService {

    @Autowired
    public PushInfoClassMapper picm;

    public List<PushInfoClass> getAllPush(int mcId){
        return picm.selectAll(mcId);
    }

    //得到所有其他信息id
    public List<Integer> getAllPushId(int mcId){
        return picm.selectAllPicId(mcId);
    }
}

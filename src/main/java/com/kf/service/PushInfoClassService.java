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

}

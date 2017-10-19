package com.kf.service;

import com.kf.mapper.PushInfoTagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PushInfoTagService {

    @Autowired
    private PushInfoTagMapper pushInfoTagMapper;

    public void addPushInfoTag(Integer tagId,Integer piId,Integer piTagContent){
        pushInfoTagMapper.insertPushInfoTag(tagId,piId,piTagContent);
    }

    public void updateInfoTag(Integer tagId,Integer piId,Integer piTagContent){
        pushInfoTagMapper.updatePushInfoTag(tagId,piId,piTagContent);
    }
}

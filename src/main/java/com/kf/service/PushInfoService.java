package com.kf.service;

import com.kf.mapper.PushInfoMapper;
import com.kf.pojo.BaseInfo;
import com.kf.pojo.PushInfo;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
/**
 * Created by 18236 on 2017/9/26.
 */
@Service
public class PushInfoService {
    @Autowired
    private PushInfoMapper pushInfoMapper;

    public List<PushInfo> getAllJob(Integer mcId, Integer scId,Integer districtId,List<String> tagValues,Integer tagNum){
        return pushInfoMapper.selectAllJob(mcId,scId,districtId,tagValues,tagNum);
    }

    public boolean getPushIsExists(Integer piId){
        return pushInfoMapper.selectPushForPushExists(piId)!=null;
    }

    public Integer addPushInfo(PushInfo pushInfo){
        pushInfoMapper.addPushInfo(pushInfo);
        return pushInfo.getPiId();
    }

    public PushInfo getInfoByPiId(Integer piId){
        return pushInfoMapper.selectInfoByPiId(piId);
    }

    /**
     * 根据当前用户和当前信息状态查看所有的信息 如果status传入为null默认查询当前用户所有信息
     * @param userId
     * @param status
     * @return
     */
    public List<BaseInfo> getBaseInfoByUserIdAndStatus(Integer userId,Integer status){
        return pushInfoMapper.selectBaseInfoByPiIdAndStatus(userId,status);
    }

    public List<BaseInfo> getBaseInfoByUserIdAndOpStatus(Integer userId,Integer status){
        return pushInfoMapper.selectBaseInfoByPiIdAndOpStatus(userId,status);
    }
    /**
     * 通过用户id查到当前用户收藏的信息
     * @param userId
     * @return
     */
    public List<BaseInfo> getCollectionByUserId(Integer userId){
        return pushInfoMapper.selectCollectionByUserId(userId);
    }

    public void updatePushInfoStatus(Integer piId,Integer userId,Integer status){
        pushInfoMapper.updatePushInfoStatus(piId,userId,status);
    }


    public void addCollection(Integer userId,Integer piId){
        pushInfoMapper.addCollection(piId, userId);
    }

    public boolean collectionIsExists(Integer userId,Integer piId){
        return pushInfoMapper.collectionIsExists(piId, userId)!=null;
    }

    public String getImgUrl(Integer piId,Integer userId){
        return  pushInfoMapper.selectPicUrl(piId,userId);
    }

    public PushInfo getInfoByPiIdAndUserId(Integer userId,Integer piId){
        return pushInfoMapper.selectInfoByPiIdAndUserId(piId,userId);
    }

    public void updatePushInfo(BaseInfo baseInfo){
        pushInfoMapper.updateInfoByPushInfo(baseInfo);
    }

    public void updatePicUrl(String piImg,Integer piId,Integer userId){
        pushInfoMapper.updatePicUrl(piImg,piId,userId);
    }

    public void deletePushInfo(Integer piId,Integer userId){
        pushInfoMapper.deletePushInfo(piId,userId);
    }
}

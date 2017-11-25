package com.kf.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kf.mapper.PushInfoMapper;
import com.kf.pojo.BaseInfo;
import com.kf.pojo.PushInfo;
import com.kf.util.*;
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

    @Autowired
    private BasePath basePath;

    @Autowired
    private BasePage basePage;

    /**
     * 获取推荐信息
     * @param mcId
     * @param scId
     * @return
     */
    public List<BaseInfo> getRecommend(Integer mcId,Integer scId){
        return pushInfoMapper.selectRecommend(mcId,scId);
    }



    /**
     * 该方法用于构造信息的tag和pic信息
     * @param pageUtil
     * @param basePush
     */
    private void initPushInfo(PageUtil pageUtil,List<PushInfo> basePush){
        PageInfo<PushInfo> pageInfo=new PageInfo<PushInfo>(basePush);
        pageUtil.setPageNums(pageInfo.getPages());
        pageUtil.setTotal(pageInfo.getTotal());
        for(PushInfo pushInfo:basePush){
            pushInfo.setTagValues(pushInfoMapper.selectAllTagByPiId(pushInfo.getPiId()));
            pushInfo.setOtherInfos(pushInfoMapper.selectAllPicByPiId(pushInfo.getPiId()));
        }
    }


    //进行分页查询
    public List<PushInfo> getAllJob(Integer mcId, Integer scId, Integer districtId,
                                    List<String> tagValues, Integer tagNum, Integer pageNum, PageUtil pageUtil){
        PageHelper.startPage(pageNum,basePage.getPageSize());
        List<PushInfo> basePush = pushInfoMapper.selectAllJob(mcId,scId,districtId,tagValues,tagNum);
        initPushInfo(pageUtil,basePush);
        return basePush;
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

    public void deleteCollection(Integer userId,Integer piId){
        pushInfoMapper.deleteCollection(piId,userId);
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
        String imgUrls = getImgUrl(piId,userId);
        if(imgUrls!=null&&CommonUtil.isNotNullAndNotEmpty(imgUrls)){
            for(String imgUrl:imgUrls.split("#")){
                FileUtil.deleteImg(basePath.getPathValue()+imgUrl);
            }
        }
        pushInfoMapper.deletePushInfo(piId,userId);
    }


    /**
     * 修改当前信息的阅读量
     * @param piId
     */
    public void updateInfoScan(Integer piId){
        pushInfoMapper.updateInfoReadNum(piId);
    }


    /**
     * 搜索
     *
     */
    public List<PushInfo> getAllInfoByKeyWords(String keyWords,Integer district,Integer pageNum,PageUtil pageUtil){
        PageHelper.startPage(pageNum,basePage.getPageSize());
        keyWords = "%"+keyWords+"%";
        List<PushInfo> basePush = pushInfoMapper.selectByKeyAndDistrict(keyWords,district);
        initPushInfo(pageUtil,basePush);
        return basePush;
    }
    /**
     * 获取用户收藏数
     */
    public Integer getCollectionCountByUserId(Integer userId){

        return pushInfoMapper.getCollectionCountByUserId(userId);
    }
   /**
     * 获取用户发布数
     */
    public Integer getPushCountByUserId(Integer userId){
        return pushInfoMapper.getPushCountByUserId(userId);
    }

}

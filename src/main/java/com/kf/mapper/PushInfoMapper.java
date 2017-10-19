package com.kf.mapper;

import com.kf.pojo.BaseInfo;
import com.kf.pojo.PushInfo;
import com.kf.vo.TagValue;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * Created by 18236 on 2017/9/26.
 */
@Mapper
public interface PushInfoMapper {

    List<PushInfo> selectAllJob(@Param("mcId")Integer mcId, @Param("scId") Integer scId,@Param("districtId")Integer districtId, @Param("tags") List<String> tags,@Param("tagNum")Integer tagNum);

    PushInfo selectInfoByPiId(@Param("piId")Integer piId);

    void addPushInfo(PushInfo pushInfo);

    /**
     * 查询某个状态的信息
     * @param userId
     * @param status
     * @return
     */
    List<BaseInfo> selectBaseInfoByPiIdAndStatus(@Param("userId")Integer userId,@Param("status")Integer status);

    /**
     * 上面的方法的对立面,查询出某个状态之外的信息
     * @param userId
     * @param status
     * @return
     */
    List<BaseInfo> selectBaseInfoByPiIdAndOpStatus(@Param("userId")Integer userId,@Param("status")Integer status);

    List<BaseInfo> selectCollectionByUserId(@Param("userId")Integer userId);

    /**
     * 修改当前信息状态,可用于删除信息,将信息处于审核状态
     * @param status
     */
    void updatePushInfoStatus(@Param("piId") Integer piId,@Param("userId")Integer userId,@Param("status")Integer status);


    Integer selectPushForPushExists(@Param("piId")Integer piId);


    //用于收藏信息
    void addCollection(@Param("piId") Integer piId,@Param("userId") Integer userId);

    /**
     * 用来判断信息是否已经被收藏
     * @param piId
     * @param userId
     * @return
     */
    Integer collectionIsExists(@Param("piId") Integer piId,@Param("userId") Integer userId);

    PushInfo selectInfoByPiIdAndUserId(@Param("piId")Integer piId,@Param("userId")Integer userId);

    void updateInfoByPushInfo(BaseInfo baseInfo);

    String selectPicUrl(@Param("piId")Integer piId,@Param("userId")Integer userId);
}

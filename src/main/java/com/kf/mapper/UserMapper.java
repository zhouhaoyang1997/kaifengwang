package com.kf.mapper;

import com.kf.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;
/**
 * Created by 18236 on 2017/9/24.
 */
@Mapper
public interface UserMapper {

    /**
     *
     * @param user
     */
    void addUser(User user);

    List<User> selectUser(User user);


    void updateUserLastLoginTime(@Param("userId") Integer userId,@Param("time") Timestamp time);


    User selectUserInfoByUserId(@Param("userId") Integer userId);

    /**
     * 查询当前用户收藏的信息的id
     * @param userId
     * @return
     */
    List<Integer> selectUserCollectionByUserId(@Param("userId")Integer userId);


    void updateUserPwd(@Param("userId")Integer userId,@Param("userPassword")String userPassword);

    //下面的两个方法是判断是否有除了该用户之外的该手机号
    Integer selectUserCountByUserPhone(@Param("userId")Integer userId,@Param("userPhone")String userPhone);

    Integer selectUserCountByUserEmail(@Param("userId")Integer userId,@Param("userEmail")String userEmail);

    //下面的方式是全局判断
    Integer selectUserByUserEmail(@Param("userEmail")String userEmail);

    Integer selectUserByUserName(@Param("userName")String userName);

    void updateUserPhone(@Param("userId")Integer userId,@Param("userPhone") String userPhone);

    void updateUserEmail(@Param("userId")Integer userId,@Param("userEmail") String userEmail);

    void updateUserProfileInfo(@Param("userDescription")String userDescription,@Param("userId")Integer userId);

    void updateUserImg(@Param("userId")Integer userId,@Param("userImg")String userImg);

    /**
     * 修改当前用户公司认证状态
     * @param userId
     * @param userAttc
     */
    void updateUserAttc(@Param("userId")Integer userId,@Param("userAttc")Integer userAttc);
}

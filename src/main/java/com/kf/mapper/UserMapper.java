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

    User selectUserByUserPhone(@Param("userPhone")String userPhone);

    User selectUserByUserEmail(@Param("userEmail")String userEmail);

    void updateUserPhone(@Param("userId")Integer userId,@Param("userPhone") String userPhone);

    void updateUserEmail(@Param("userId")Integer userId,@Param("userEmail") String userEmail);
}

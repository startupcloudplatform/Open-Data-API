/**
 * 
 */
package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.inno.odag.dao.UserDao;
import com.inno.odag.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession sql;

    @Override
    public UserDto getUserInfo(UserDto userDto) {
        // TODO Auto-generated method stub
        return sql.selectOne("user", userDto);
    }
    @Override
    public List<UserDto> getUserInfos(UserDto userDto) {
        // TODO Auto-generated method stub
        return sql.selectList("userList", userDto);
    }
    @Override
    public int createUserInfo(UserDto userDto) {
        // TODO Auto-generated method stub
        return sql.insert("userInsert", userDto);
    }
    @Override
    public int updateUserInfo(UserDto userDto) {
        // TODO Auto-generated method stub
        return sql.update("userUpdate", userDto);
    }
    @Override
    public int deleteUserInfo(UserDto userDto) {
        // TODO Auto-generated method stub
        return sql.delete("userDelete", userDto);
    }
}
package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.inno.odag.dao.UserOpenapiDao;
import com.inno.odag.dto.UserOpenapiDto;

@Repository
public class UserOpenapiDaoImpl implements UserOpenapiDao {
    @Autowired
    private SqlSession sql;

    @Override
    public UserOpenapiDto getUserOpenapiInfo(UserOpenapiDto userOpenapiDto) {
        return sql.selectOne("userOpenapi", userOpenapiDto);
    }
    @Override
    public List<UserOpenapiDto> getUserOpenapiInfos(UserOpenapiDto userOpenapiDto){
        return sql.selectList("userOpenapi", userOpenapiDto);
    }
    @Override
    public int createUserOpenapiInfo(UserOpenapiDto userOpenapiDto) {
        return sql.insert("userOpenapiInsert", userOpenapiDto);
    }
    @Override
    public int updateUserOpenapiInfo(UserOpenapiDto userOpenapiDto) {
        return sql.update("userOpenapiUpdate", userOpenapiDto);
    }
    @Override
    public int deleteUserOpenapiInfo(UserOpenapiDto userOpenapiDto) {
        return sql.delete("userOpenapiDelete", userOpenapiDto);
    }
}

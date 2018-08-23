package com.inno.odag.interceptor;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;

import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author choijinwook@innogrid.com
 * @since 2016. 5. 12.
 * @version 0.1.0
 */

@Intercepts
(
    {
        @Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class})
       ,@Signature(type = Executor.class, method = "query",  args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class, CacheKey.class, BoundSql.class})
       ,@Signature(type = Executor.class, method = "query",  args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class})
    }
)
public class MyBatisSqlLogIntercetor implements Interceptor {
  private Logger sqlLog = LoggerFactory.getLogger(getClass());

  /**
   * {@inheritdoc}
   */
  @Override
  public Object intercept(Invocation invocation) throws Throwable {

    Object[] args = invocation.getArgs();
    MappedStatement ms = (MappedStatement) args[0];
    Object param = args[1];
    BoundSql boundSql = ms.getBoundSql(param);

    sqlLog.info("====================================");
    sqlLog.info("{}", invocation.getMethod().getName());
    sqlLog.info("====================================");
    sqlLog.info(ms.getId());
    sqlLog.info("====================================");
    try {
      sqlLog.info("{}", "\n" + bindSql(boundSql).replaceAll("(?m)^[ \t]*\r?\n", ""));
    } catch (Exception e) {
      sqlLog.error("error: {}", e);
    }
    sqlLog.info("====================================");
    sqlLog.info("{}", param);
    sqlLog.info("====================================");

    return invocation.proceed();
  }

  /**
   *
   * @param boundSql
   * @return
   * @throws NoSuchFieldException
   * @throws IllegalAccessException
   */
  @SuppressWarnings({"rawtypes", "unchecked"})
  private String bindSql(BoundSql boundSql) throws NoSuchFieldException, IllegalAccessException {

    // 쿼리실행시 맵핑되는 파라미터를 구한다
    Object param = boundSql.getParameterObject();
    // 쿼리문을 가져온다(이 상태에서의 쿼리는 값이 들어갈 부분에 ?가 있다)
    String sql = boundSql.getSql();

    // 바인딩 파라미터가 없으면
    if (param == null) {
      sql = sql.replaceFirst("\\?", "''");
      return sql;
    }

    // 해당 파라미터의 클래스가 Integer, Long, Float, Double 클래스일 경우
    if (param instanceof Integer || param instanceof Long || param instanceof Float || param instanceof Double) {
      sql = sql.replaceFirst("\\?", param.toString());
      // 해당 파라미터의 클래스가 String인 경우
    } else if (param instanceof String) {
      sql = sql.replaceFirst("\\?", "'" + param + "'");
      // 해당 파라미터의 클래스가 Map인 경우
    } else if (param instanceof Map) {
//            sqlLog.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : {}",param);
      List<ParameterMapping> paramMapping = boundSql.getParameterMappings();
      for (ParameterMapping mapping : paramMapping) {
        String propValue = mapping.getProperty();
        if (!propValue.startsWith("__frch")) {
          Object value = ((Map) param).get(propValue);
          if (value == null) {
            continue;
          }

          if (value instanceof String) {
            sql = sql.replaceFirst("\\?", "'" + value + "'");
          } else {
            sql = sql.replaceFirst("\\?", value.toString());
          }
        }
      }
      sqlLog.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {}", ((Map) param).values());
      sqlLog.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {}", (((Map) param).keySet()));
      List<?> list = new ArrayList<Object>(((Map) param).values());
      if (list != null && list.size() > 0) {
        for (ParameterMapping mapping : paramMapping) {

          String propValue = mapping.getProperty();
          sqlLog.info("$$$$$$$$$$$$$$$ {} ", propValue);
          sqlLog.info("$$$$$$$$$$$$$$$ {} ", mapping);
          if (propValue.startsWith("__frch")) {
            if (propValue.contains("entity_")) {
              int _idx = Integer.parseInt(propValue.substring(propValue.indexOf("entity_") + 7, propValue.indexOf(".")));
              Object obj = list.get(_idx);

              Class<? extends Object> paramClass = obj.getClass();
              propValue = propValue.substring(propValue.indexOf(".") + 1);
              Field field = null;

              try {
                field = paramClass.getDeclaredField(propValue);
              } catch (Exception e) {

              } finally {
                if (field == null) {
                  try {
                    field = paramClass.getSuperclass().getDeclaredField(propValue);
                  } catch (Exception e) {
                  }
                }
              }
              field.setAccessible(true);

              Class<?> javaType = mapping.getJavaType();
              if (String.class == javaType) {
                sql = sql.replaceFirst("\\?", "'" + Matcher.quoteReplacement("" + field.get(obj)) + "'");
              } else {
                sql = sql.replaceFirst("\\?", field.get(obj).toString());
              }
            } else {
              Class<?> javaType = boundSql.getAdditionalParameter(propValue).getClass();
              if (String.class == javaType) {
                sql = sql.replaceFirst("\\?", "'" + boundSql.getAdditionalParameter(propValue) + "'");
              } else {
                sql = sql.replaceFirst("\\?", "" + boundSql.getAdditionalParameter(propValue));
              }
            }
          }else {
            if(boundSql.hasAdditionalParameter(propValue)) {
              Class<?> javaType = boundSql.getAdditionalParameter(propValue).getClass();
              if (String.class == javaType) {
                sql = sql.replaceFirst("\\?", "'" + boundSql.getAdditionalParameter(propValue) + "'");
              } else {
                sql = sql.replaceFirst("\\?", "" + boundSql.getAdditionalParameter(propValue));
              }
            }
          }
        }
      }
      // 해당 파라미터의 클래스가 사용자 정의 클래스인 경우
    } else {
      List<ParameterMapping> paramMapping = boundSql.getParameterMappings();
      Class<? extends Object> paramClass = param.getClass();
      for (ParameterMapping mapping : paramMapping) {
        String propValue = mapping.getProperty();

        Field field = null;
        if (!propValue.startsWith("__frch")) {
          try {
            field = paramClass.getDeclaredField(propValue);
          } catch (Exception e) {

          } finally {
            if (field == null) {
              try {
                field = paramClass.getSuperclass().getDeclaredField(propValue);
              } catch (Exception e) {
              }
            }
          }
          field.setAccessible(true);
          Class<?> javaType = mapping.getJavaType();
          if (String.class == javaType) {
            sql = sql.replaceFirst("\\?", "'" + field.get(param) + "'");
          } else {
            sql = sql.replaceFirst("\\?", field.get(param).toString());
          }
        } else {
          Class<?> javaType = boundSql.getAdditionalParameter(propValue).getClass();
          if (String.class == javaType) {
            sql = sql.replaceFirst("\\?", "'" + boundSql.getAdditionalParameter(propValue) + "'");
          } else {
            sql = sql.replaceFirst("\\?", (String) boundSql.getAdditionalParameter(propValue));
          }
        }
      }
    }
    return sql;
  }

  /**
   * {@inheritdoc}
   */
  @Override
  public Object plugin(Object target) {

    return Plugin.wrap(target, this);
  }

  /**
   * {@inheritdoc}
   */
  @Override
  public void setProperties(Properties properties) {
  }
}
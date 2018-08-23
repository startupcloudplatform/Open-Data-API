/**
 * 
 */
package com.inno.odag.interceptor;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.inno.odag.constants.User;
import com.inno.odag.util.Config;

/**
 * @author choijinwook@innogrid.com
 * @since 2016. 3. 14.
 * @version 0.1.0 
 */

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * <span>
     *   Session 확인을 제외할 Pattern URL을 지정합니다.
     *   <br />
     *   {"/", "/login", "no-session", "*.json"}이 <code>String[]</code>로, 현제 Session 확인 제외로 지정되어 있습니다.
     * </span>
     */

    private String[] patterns = Config.getCommon().getString("login.ignorePatternUrl").split(",");
    
    /**
     * {@inheritDoc}
     * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
     */

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

        boolean result = false;

        HttpSession session = request.getSession();
        String path = request.getServletPath();

        logger.info("LOGIN INTERCEPTOR - session :{}", session.getAttribute(User.SESSION_USER_LOGIN_ID));
        
        try {

            //Session 확인을 하거나 무시할지 판별하여 Session 확인을 합니다. - 최진욱

            if (isNormalURLPattern(path)) {
                
                logger.info("URL에 대한 Session 검사 시작!");
                
                String userLoginId = (String)session.getAttribute(User.SESSION_USER_LOGIN_ID);
                //String userId = (String)session.getAttribute(User.SESSION_USER_USER_ID);
                
                
                
                
/*
                if(StringUtils.isEmpty(userLoginId)
                        || StringUtils.isEmpty(userId)){
                    throw new Exception("세션이 종료되었습니다.");
                }
*/
                
                
                logger.info("session.isNew() : {}", session.isNew());

                //새로운 Session이고 List<ProgramEntity>가 null인지 확인합니다.
                //만약 둘다 true일 경우 Exception을 던지게 됩니다.
                
                if (session.isNew()){
                    throw new Exception("세션이 종료되었습니다.");
                }
            }

            //Session확인을 위한 디버깅
            logger.info("session is alive!!!");
            
            
            result = true;

        } catch (Exception nse) {
            nse.printStackTrace();
            logger.debug("session is dead!!!");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            try {
                if(path.contains("json")){
                    
                }else{
                    logger.debug("request.getContextPath() : {}",request.getContextPath());
                    response.sendRedirect(request.getContextPath()+"/");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            result = false;
        }

        return result;
    } // of preHandle

    /**
     * Pattern URL과 요청이 들어온 Request Servlet Path와 비교함
     * <pre>
     * Pattern URL은 Session 확인을 할 것인지 아니면 무시할 것인지 비교 확인합니다.
     * 만약에 Request Servlet Path와 Pattern URL이 매칭 되는 경우({@code false}) Session 확인을 하지 않습니다.
     * 하지만 Request Servlet Path와 Pattern URL이 매칭 되는 않을 경우({@code true}) Session을 확인합니다.
     * </pre>
     * @param servletPath 요청되어져 들어오는 Request Servlet Path
     * @return <code> <span style="font-weight:bold">true</span> 매칭(Matching)되는 URL이 없음</code>
     *          <br />
     *          <code> <span style="font-weight:bold">false</span> 매칭(Matching)되는 URL이 있음</code>
     */

    private boolean isNormalURLPattern(String servletPath) {
//        logger.debug("Servlet Path : {}", servletPath);
//        logger.debug("Patterns Length : {}", patterns.length);

        boolean result = true;

        if (patterns != null) {
            for (String pattern : patterns) {
//                logger.debug("Pattern : {}", pattern);
//                logger.debug("servletPath : {}", servletPath);
                if (pattern.trim().equals(servletPath)) {
                    result = false;
                    logger.debug("pattern: {} : {}", pattern, result);
                    break;
                }                    
            }
        }
        result = true;
        return result;
    }
}

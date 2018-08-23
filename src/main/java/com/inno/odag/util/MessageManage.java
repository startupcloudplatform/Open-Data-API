/**
 * 
 */
package com.inno.odag.util;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.support.MessageSourceAccessor;

/**
 * @author choijinwook@innogrid.com
 * @since 2018. 4. 10.
 * @version 0.1.0
 */
public class MessageManage {
    private final static Logger logger = LoggerFactory.getLogger(MessageManage.class);

    private static MessageSourceAccessor messageSourceAccessor = null;

    public void setMessageSourceAccessor(MessageSourceAccessor messageSourceAccessor) {
        MessageManage.messageSourceAccessor = messageSourceAccessor;
    }

    /**
     * Desc: 
     * @Mehtod Name : getMessage
     * @param key
     * @return
     */
    public static String getMessage(String key) {
        
        try {

            logger.debug("messageSourceAccessor: {}", messageSourceAccessor);
            
            return messageSourceAccessor.getMessage(key, Locale.getDefault());

        } catch (NoSuchMessageException e) {
            
            logger.error("NoSuchMessageException: {}", e.getMessage());

        } catch (Exception e) {
            
            logger.error("Exception: {}", e.getMessage());
        }
        
        return "";
    }
    
    /**
     * Desc: 
     * @Mehtod Name : getMessage
     * @param key
     * @param objs
     * @return
     */
    public static String getMessage(String key, Object[] objs) {
        
        try {

            return messageSourceAccessor.getMessage(key, objs, Locale.getDefault());
            
        } catch (NoSuchMessageException e) {
            
            logger.error("NoSuchMessageException: {}", e.getMessage());

        } catch (Exception e) {
            
            logger.error("Exception: {}", e.getMessage());
        }

        return "";
    }
}

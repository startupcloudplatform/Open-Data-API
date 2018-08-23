/**
 * 
 */
package com.inno.odag.util;

import org.apache.commons.configuration.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 * @author choijinwook@innogrid.com
 * @since 2018. 4. 10.
 * @version 0.1.0
 */
public class Config {
    /** 
     * Desc : Constructor of CommonConfiguration.java class
     */
    private Config() {}
    
    private static Configuration commonConfig;
    
    @Autowired
    @Qualifier("commonConfig")
    public void setCommon(Configuration config) {
        commonConfig = config;
    }

    public static Configuration getCommon() {
        return commonConfig;
    }
}

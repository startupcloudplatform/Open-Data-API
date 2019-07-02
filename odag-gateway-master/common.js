var pool = require('./db_pool').pool;

// key generation
var keyGeneration = module.exports.keyGeneration = (user_id, service_id, res) => {

    console.log("key gen");

    var serviceKey =  Math.random().toString(32).slice(2) + Math.random().toString(32).slice(2) + Math.random().toString(32).slice(2);

    //key 중복 확인
    var sqlQuery = 'SELECT * FROM odag.user WHERE auth_key = \'' + serviceKey + '\'';

    pool.getConnection(function(err, conn){
        conn.query(sqlQuery, function(err, rows) {
            if(err) { throw err; }

            console.log(sqlQuery);
            console.log(rows);

            // (중복확인) key가 DB에 이미 있는 경우 1, 아니면 0
            if (rows.length === 1) {
                // 서비스 등록이 되어 있음
                console.log("Key registration already exists");
                console.log("re-generation");
                keyGeneration(user_id,service_id,res);
            }
            else {
                // 키 등록 시작
                var sqlQuery = 'UPDATE odag.user\n' +
                    'SET auth_key = \'' + serviceKey + '\'\n' +
                    'WHERE user_id= \'' + user_id + '\';\n';

                pool.getConnection(function(err, conn){
                    conn.query(sqlQuery, function(err, rows) {
                        if(err) { throw err; }
                        serviceAPIRequest(serviceKey, service_id, res);
                    });
                    conn.release();
                });
            }
        });
        conn.release();
    });
};


// 회원가입시 키 생성
var keyGeneration2 = module.exports.keyGeneration2 = (user_id, service_id, res) => {

    console.log("key gen");

    var serviceKey =  Math.random().toString(32).slice(2) + Math.random().toString(32).slice(2) + Math.random().toString(32).slice(2);

    //key 중복 확인
    var sqlQuery = 'SELECT * FROM odag.developer WHERE auth_key = \'' + serviceKey + '\'';

    pool.getConnection(function(err, conn){
        conn.query(sqlQuery, function(err, rows) {
            if(err) { throw err; }

            console.log(sqlQuery);
            console.log(rows);

            // (중복확인) key가 DB에 이미 있는 경우 1, 아니면 0
            if (rows.length === 1) {
                // 서비스 등록이 되어 있음
                console.log("Key registration already exists");
                console.log("re-generation");
                keyGeneration2(user_id,service_id,res);
            }
            else {
                // 키 등록 시작
                var sqlQuery = 'UPDATE odag.developer\n' +
                    'SET auth_key = \'' + serviceKey + '\'\n' +
                    'WHERE user_id= \'' + user_id + '\';\n';

                pool.getConnection(function(err, conn){
                    conn.query(sqlQuery, function(err, rows) {
                        if(err) { throw err; }
                    });
                    conn.release();
                });
            }
        });
        conn.release();
    });
};

// service 이용 신청
var serviceAPIRequest = module.exports.serviceAPIRequest = (user_id, key, service_id, res) => {

    var sqlQuery = 'INSERT INTO odag.service_matching (odag.service_matching.user_id, odag.service_matching.key, odag.service_matching.service_id) \n' +
        'VALUES (\'' +user_id + '\',\'' +key + '\', \'' + service_id + '\')';

    pool.getConnection(function(err, conn){
        conn.query(sqlQuery, function(err, rows) {
            if(err) { throw err; }

            console.log(sqlQuery);
            console.log(rows);

           // res.send("서비스 등록 완료");

        });
        conn.release();
    });

};
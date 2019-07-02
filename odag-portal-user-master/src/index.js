import React from "react";
import ReactDOM from "react-dom";
import history from "./js/history.js";

import 'react-app-polyfill/ie9'; // For IE 9-11 support
import 'react-app-polyfill/ie11'; // For IE 11 support

import { Router, Route, Switch, Redirect , IndexRoute } from "react-router-dom";
import MainLayout from "./view/main.jsx";

import Main from "./view/main.jsx";
import View_data from "./view/view_data.jsx";
import View_mypage from "./view/view_mypage.jsx";
import Mypage_history from "./view/mypage_history";
import Mypage_favorites from "./view/mypage_favorites";
import Guild from "./view/guild.jsx";
import Login from "./view/login.jsx";
import Login_developer from "./view/login_developer";
import Signin from "./view/signin.jsx";
import Signin_developer from "./view/signin_developer";
import Signin_provider from "./view/signin_provider";
import Findpw from "./view/findpw";
import Newpw from "./view/newpw";
import User_setting from "./view/user_setting";
import Information from "./view/information";
import Notice from "./view/notice";
import Notice_no from "./view/notice_no";
import Notice_write from "./view/notice_write";
import Board from "./view/board";
import Boardwrite from "./view/board_write";
import Board_no from "./view/board_no";
import Board_rewrite from "./view/board_rewrite";
import Request from "./view/request";
import Requestwrite from "./view/request_write";
import Tool from "./view/tool";
import Privacy from "./view/privacy";
import Clause from "./view/clause";
import Mail from "./view/mail";


import "./assets/scss/black-dashboard-react.scss";
import information from "./view/information.jsx";
import login_developer from "./view/login_developer.jsx";



var displayDropdown = (
  <div style={{display: 'flex', justifyContent: 'center'}} >
    <Main />
  </div>
  );

ReactDOM.render(
  
  <Router history={history}>
    <Switch>

      <Route path="/src/mypage.html" render={props => <View_mypage {...props} />} />
      <Route path="/src/mypage_search.html" render={props => <View_mypage {...props} SetTypes = "1"/>} />
      <Route path="/src/mypage_history.html" render={props => <Mypage_history {...props} />} />
      <Route path="/src/mypage_favorites.html" render={props => <Mypage_favorites {...props} />} />
      <Route path="/src/data_recommend.html" render={props => <View_data {...props} dataType = "data_recommend"/>} />
      <Route path="/src/data_oda.html" render={props => <View_data {...props} dataType = "data_oda"/>} />
      <Route path="/src/data_file.html" render={props => <View_data {...props} dataType = "data_file"/>} />
      <Route path="/src/data.html" render={props => <View_data {...props} dataType = "data" />} />
      <Route path="/src/data_recommend_bigdata.html" render={props => <View_data {...props} dataType = "data_recommend_bigdata"/>} />
      <Route path="/src/data_recommend_history.html" render={props => <View_data {...props} dataType = "data_recommend_history"/>} />

           
      <Route path="/login" render={props => <Login {...props} />} />
      <Route path="/login_developer" render={props => <Login_developer {...props} />} />


      <Route path="/signin" render={props => <Signin {...props} />} />
      <Route path="/signin_developer" render={props => <Signin_developer {...props} />} />
      <Route path="/signin_provider" render={props => <Signin_provider {...props} />} />
      <Route path="/findpw" render={props => <Findpw {...props} />} />
      <Route path="/newpw" render={props => <Newpw {...props} />} />
      <Route path="/user_setting" render={props => <User_setting {...props} />} />

      <Route path="/information" render={props => <Information {...props} />} />

      <Route path="/tool" render={props => <Tool {...props} dataType = "tool"/>} />
      <Route path="/bigdata" render={props => <Tool {...props} dataType = "bigdata"/>} />
      <Route path="/AI" render={props => <Tool {...props} dataType = "AI"/>} />
      <Route path="/etc" render={props => <Tool {...props} dataType = "etc"/>} />

      <Route path="/notice" render={props => <Notice {...props} />} />
      <Route path="/notice_no" render={props => <Notice_no {...props}/>} />
      <Route path="/noticewrite" render={props => <Notice_write {...props}/>} />
      <Route path="/board" render={props => <Board {...props} />} />
      <Route path="/boardwrite" render={props => <Boardwrite {...props} />} />
      <Route path="/board_no" render={props => <Board_no {...props}/>} />
      <Route path="/board_rewrite" render={props => <Board_rewrite {...props}/>} />
      <Route path="/request" render={props => <Request {...props} />} />
      <Route path="/requestwrite" render={props => <Requestwrite {...props} />} />

      <Route path="/src/guide.html" render={props => <Guild {...props} />} />      
      <Route path="/src/privacy.html" render={props => <Privacy {...props} />} />      
      <Route path="/src/clause.html" render={props => <Clause {...props} />} />  
      <Route path="/src/mail.html" render={props => <Mail {...props} />} />  
 
      <Route path="/" render={props => <MainLayout {...props} />} />    

    </Switch>
  </Router>
  ,
  document.getElementById("root")

  
);


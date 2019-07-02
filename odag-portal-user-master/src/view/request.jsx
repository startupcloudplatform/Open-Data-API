import React from 'react';

import axios from "axios";
import classNames from 'classnames';

// reactstrap components
import {
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
  UncontrolledDropdown,
  NavLink
} from "reactstrap";

import { withStyles } from '@material-ui/core/styles';
import history from '../js/history.js';
import TextField from '@material-ui/core/TextField';
import Clock from './clock';
import MenuItem from '@material-ui/core/MenuItem';


import CardList from '../view/templates/temp_request';
import Sub_request from '../view/templates/temp_sub_request';
import Sub_Oda_carddetail from '../view/templates/temp_sub_Oda_carddetail';

import CustomPaginationActionsTable from './main_templates/coupon_table.jsx';
import { Divider } from '@material-ui/core';

import normalize from '../assets/css/normalize.css';
import font from '../assets/css/font.css';
import swiper_min from '../assets/css/swiper.min.css';

import styles from '../assets/css/style.css';

import config  from "../js/config.js";
import sub_informationList from '../view/templates/temp_information';

import session_nav from "./layout/session_nav"

import { findDOMNode } from 'react-dom';
import $ from "jquery";
window.$ = $;
class request extends React.Component 
{
  
  state = {
    name: 'Cat in the Hat',
    age: 0,
    multiline: 'Controlled',
    currency: 'NULL',
    word: 'NULL',
    category: 'NULL',
    value: 'cate',
    request_no: 0,
  };

  constructor(...props) {
    super(...props);


    this.handleClickTabTypes = this.handleClickTabTypes.bind(this);
    this.handleClickTabClose = this.handleClickTabClose.bind(this);

    this.handlePopupOpen = this.handlePopupOpen.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handlePopupCancle = this.handlePopupCancle.bind(this);
    this.handlePopupAccept = this.handlePopupAccept.bind(this);

    this.state = { date: new Date() };
    this.child = React.createRef();
    this.state.age = 1000;
    this.state.textFieldValue_value = 1000;
    this.state.bookmark_name = "";

    this.state.TabTypes = 0;
    this.state.openapi_no = null;

    this.state.popupType = 0;

    this.state.word = null;

    this.state.category = this.props.category;
    
    this.state.dataType = this.props.dataType;

  }
  handleClickTabTypes(request_no) 
  {    
    console.log("information notice_no " + request_no)
    if(request_no == request_no)
    {
      this.setState(
        {
          TabTypes : 1,
          request_no : request_no,
        }
      );      
    }
  }

  handleWriteButton = () => {
    history.push("/requestwrite");
  }

  componentDidMount = () => {
    this._getData();

    $(document).ready(function(){
      $(".header_nav_menu2").hover(function(){
       $(".header_nav_menu_sub").stop().slideDown(300);
      });
      $(".on").hover(function(){
        $(".header_nav_menu_sub").stop().slideDown(300);
       });
      $(".header_nav_menu_sub").mouseover(function(){
       $(".header_nav_menu_sub").stop();
      });
      $(".header_nav_menu2").mouseout(function(){
        $(".header_nav_menu_sub").slideUp(300);
       });
       $(".on").mouseout(function(){
        $(".header_nav_menu_sub").slideUp(300);
       });
     });
  };

  handleChange(event) 
  {
    console.log(event.target.value);   
  }  
  _getData = async () => {
    this.setState({
        fetching: true // requesting..
    });

    var urlstring = config.serverpoint + '/bookmark/hong';

    await axios.get(urlstring)
        .then(response => 
        {
            this.state.rows = response.data;

            console.log(this.state.rows);

            this.setState({
                fetching: false // done!
            });

        }) // SUCCESS
        .catch(response => { console.log(response); }); // ERROR
  };

  handlePopupOpen()
  {
   
    this.setState(
      { 
        popupType : 1,
        bookmark_name :""

      });
  }

  handleClickTabClose() 
  {    
    console.log("1123123");
    this.setState(
      {
        TabTypes : 0,
        openapi_no : ""
      }
    );
  }


  handlePopupCancle()
  {
    console.log("Cancle");
    this.setState({ popupType : 0});
  }

  handleChange(event) 
  {
    this.setState({
      openapi_no : event.target.value
    });   
  }  

  handlePopupAccept(event)
  {
    console.log("handlePopupAccept");
    var id = "song";
    var openapi_no = this.state.openapi_no;
    var urlstring = config.serverpoint + '/bookmark/' + id + '/' +  openapi_no;

    console.log(urlstring);
    axios.post(urlstring , {
      openapi_no: this.state.openapi_no
    })
        .then(response => 
        {
            this.state.rows = response.data;

            console.log(this.state.rows);

            this.setState({
                fetching: false // done!
            });

        }) // SUCCESS
        .catch(response => { console.log(response); }); // ERROR


    this.setState({ popupType : 0});
  }

  _handleTextFieldChange_item_type = (e) => {

    this.setState({
      textFieldValue_item_type: e.target.value,
      currency: e.target.value
    });
    //console.log(e.target.value);
  }

  handleToggle = () => {
    const el = findDOMNode(this.refs.toggle);
    $(el).slideToggle();
    const el2 = findDOMNode(this.refs.toggle2);
    $(el2).slideToggle();
    const el3 = findDOMNode(this.refs.toggle3);
    $(el3).slideToggle();
    const el4 = findDOMNode(this.refs.toggle4);
    $(el4).slideToggle();
};

  _handleTextFieldChange_value = (e) => {

    this.setState({
      textFieldValue_value: e.target.value,
      age: e.target.value
    });
    //console.log(this.state.textFieldValue_value);
  }

  _handleTextFieldChange_message = (e) => {

    this.setState({
      textFieldValue_message: e.target.value
    });
    //console.log(this.state.textFieldValue_message);
  }

  _handleTextFieldChange_received_type = (e) => {

    this.setState({
      textFieldValue_received_type: e.target.value
    });
    //console.log(this.state.textFieldValue_received_type);
  }

  render() {
    const { classes } = this.props;

    return (
      
      <div>
         <header className="header_common">
      <div class="layout_inner">
            <h1 class="header_top_logo"><a href="/"><img src={ require('../assets/images/header_logo.png')} alt="Cloudit" /></a></h1>
            <nav class="header_nav">
                <ul class="header_nav_menu">
                    <li class="header_nav_menu2"><a href="../src/guide.html">이용안내</a></li>
                   
                    <li class="header_nav_menu2"><a href="../src/data.html">오픈데이터</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="../src/data_oda.html">오픈데이터 API</a>
                            <a href="../src/data_file.html">파일데이터</a>
                            <a href="../src/data_recommend.html">추천 데이터</a>
                        </div>
                    </li>
                    
                    <li class="header_nav_menu2"><a href="tool">데이터 툴</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="tool">도구</a>
                        </div>
                    </li>
                    <li class="on"><a href="/notice">정보공유</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="/notice">공지사항</a>
                            <a href="/board">자유게시판</a>
                            <a href="/request">API 요청 게시판</a>
                        </div>
                    </li>
                    {sessionStorage.getItem("user") &&
                    <li class="header_nav_menu2"><a href="../src/mypage.html">마이페이지</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="../src/mypage.html">나의 오픈 API</a>
                            <a href="../src/mypage_history.html">나의 사용이력</a>
                            <a href="../src/mypage_favorites.html">즐겨찾기</a>
                        </div>
                    </li>
                    }
                </ul>

                <div class="header_top_user">
                    {
                      session_nav()
                    }
                </div>
            </nav>
        </div>       
      </header>

        <div>
          <section className="sub_nav" style={{ marginTop: '80px', marginBottom: '0px' }}>
            <h2>정보공유</h2>
            <div className="sub_nav_menu">
            
              
              <a href="/notice">공지사항</a>
              <a href="/board">자유게시판</a>
              <a href="/request" className="on2">API 요청 게시판</a>

              {/* {this.state.dataType == "data_file" && <a href="/src/data_file.html" className="on">API 요청 게시판</a>} */}
              {/* {this.state.dataType !== "data_file" && <a href="/src/data_file.html">API 요청 게시판</a>} */}
              

            </div>
          </section>
        </div>

        <main className="main_sub">
          <div className="layout_inner layout_clearfix">
            <div class="layout_sub_side">

        
            <h2>정보공유</h2>
            <div className="sub_nav_menu">

              <a href="/notice">공지사항</a>
              <a href="/board">자유게시판</a>
              <a href="/request" className="on2">API 요청 게시판</a>

              {/* {this.state.dataType == "data_file" && <a href="/src/data_file.html" className="on">API 요청 게시판</a>} */}
              {/* {this.state.dataType !== "data_file" && <a href="/src/data_file.html">API 요청 게시판</a>} */}


                  </div>
                </div>
            <div className="layout_sub_cont"> 
              {
                this.state.TabTypes == 0 &&
               
                <div>
                 <CardList returnType={this.handleClickTabTypes} />
                 
                 </div>
         
              }             
               {
                 this.state.TabTypes == 1 && 
                 <Sub_request
                  request_no={this.state.request_no}                    
                  returnPopupOpen = {this.handlePopupOpen} 
                  returnTabClose = {this.handleClickTabClose}
                 />
               }
            </div>
            {}
          </div>

        </main>

        <footer className="footer_common">
          <div className="footer_cont">
            <div className="layout_inner layout_clearfix">
            <div className="footer_cont_logo">
              <a href="http://www.msit.go.kr">
                <img
                  src={ require('../assets/images/logo4.png') }
                  alt="과학기술정보통신부"
                />
              </a>             
            </div>
            <div className="footer_cont_logo">
              <a href="http://www.nipa.kr">
                <img
                  src={ require('../assets/images/footer_logo_nipa.png') }
                  alt="\uC815\uBCF4\uD1B5\uC2E0\uC0B0\uC5C5\uC9C4\uD765\uC6D0"
                />
              </a>             
            </div>
              <div className="footer_cont_menu">
                <a href="/src/clause.html">이용약관</a>
                <a href="/src/privacy.html">개인정보처리방침</a>
                <a href="/src/mail.html">문의사항</a>
              </div>
            </div>
          </div>
          {}
          <div className="footer_address">
            <div className="layout_inner layout_clearfix">
              <div className="footer_address_company">
              <p className="footer_address_company_address">
              우편번호: 13488 <br/>
              주소: 경기도 성남시 분당구 판교로 289 스타트업캠퍼스 1동 4층
              </p>
              <p>
              Tel : 1670-5005 Fax : 031-606-1519 E-MAIL : help@cloud.or.kr.
              </p>
            </div>
                        <p className="footer_address_copyright">
                          COPYRIGHT 2019 innogrid. All right reserved.
              </p>
            </div>
            {}
          </div>
          {}
        </footer>
      </div>

    );
  }
}
export default withStyles(styles)(request);
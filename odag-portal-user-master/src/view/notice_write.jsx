import React from 'react';

import axios from "axios";
import classNames from 'classnames';

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


import CardList from '../view/templates/temp_information';
import Sub_information from '../view/templates/temp_sub_information';
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

class request_write extends React.Component 
{
  
  state = {
    name: 'Cat in the Hat',
    age: 0,
    multiline: 'Controlled',
    value: 'a',
    currency: 'NULL',
    word: 'NULL',
    category: 'NULL',
    value: 'cate',
    notice_no: 0,
  };

  constructor(...props) {
    super(...props);


    this.handleChange = this.handleChange.bind(this);

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
    this.state.name = this.props.name;
    this.state.dataType = this.props.dataType;

    this.handleReturnCardList = this.handleReturnCardList.bind(this);

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


  handleReturnCardList() {
    history.push('/notice');
}

  componentDidMount = () => {
    this._getData();

  };

  handleChange = name => event => {
    this.setState({
      [name]: event.target.value,
    });
  };

  writeButton = () => {
    var url = config.serverpoint + '/notice';

    console.log("보낼 url = " + url);
    console.log("보낼 제목 = " + this.state.notice_title);
    console.log("보낼 내용 = " + this.state.notice_contents);

    if(!this.state.notice_title){
      alert("제목을 입력하세요")
      return;
    }

    else if(!this.state.notice_contents){
      alert("내용을 입력하세요")
      return;
    }

    else{
      axios.post(url,{
        user_id : sessionStorage.getItem("user"),
        notice_title : this.state.notice_title,
        notice_contents : this.state.notice_contents,
      }).then(function(response){
        console.log("response = " + response);
        alert("글 작성 완료");
        history.push('/notice');
        
      }).catch(response => { console.log("response =" + response);
    });
    }

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
  
 
  render() {
    const { classes } = this.props;
    const { rows, rowsPerPage, page } = this.state;
    return (
      
      <div>
        <header className="header_common">
          <div className="layout_inner">
            <div className="header_top layout_clearfix">
              <h1 className="header_top_logo">
                <a href="/">
                  <img 
                  src={ require('../assets/images/header_logo.png')}
                  alt="Cloudit" />
                </a>
              </h1>
              {

              sessionStorage.getItem("user") == null &&
              <div className="header_top_user">
                <a href="/login">LOGIN</a>
                <a href="/signin">SIGNUP</a>
              </div> 
            }      
            {
              sessionStorage.getItem("user") != null &&
              <div className="header_top_user">
                <div className="header_top_user_photo" />                
                  <UncontrolledDropdown nav style={{ padding: '0px', height: '30px', background: 0 }}>
                    <DropdownToggle
                      caret
                      color="default"
                      data-toggle="dropdown"
                      nav
                      onClick={e => e.preventDefault()}
                      style={{ padding: '0px'}}
                    >
                      <button
                        type="button"
                        className="header_top_user_btn js_arr_toggle js_user_open"
                      >
                        {sessionStorage.getItem("user")}
                      </button>
                      <b className="caret d-none"></b>
                      <p className="d-lg-none">Log out</p>
                    </DropdownToggle>
                    <DropdownMenu className="dropdown-navbar" right tag="ul">
                      <NavLink tag="li">
                        <DropdownItem className="nav-item">Profile</DropdownItem>
                      </NavLink>
                      <NavLink tag="li">
                        <DropdownItem className="nav-item" href="/user_setting">Settings</DropdownItem>
                      </NavLink>
                      <DropdownItem divider tag="li" />
                      <NavLink tag="li">
                        <DropdownItem className="nav-item" href="/login">Log out</DropdownItem>
                      </NavLink>
                    </DropdownMenu>
                  </UncontrolledDropdown>
                </div> 
            }
            </div>
          </div>
          <nav className="header_nav">
        <div className="layout_inner layout_clearfix">
        <button type="button" onClick={this.handleToggle} class="header_nav_btn js_arr_toggle js_nav_btn">전체메뉴</button>        
          <ul className="header_nav_menu">

            <li>
              <a href="../src/guide.html">이용안내</a>
            </li>
            <li>
            <a href="../src/data.html">오픈데이터</a>
              <div className="header_nav_menu_sub js_nav_menu "ref='toggle'>
              <a href="../src/data.html">전체</a>
                <a href="../src/data_oda.html">오픈데이터 API</a>
                <a href="../src/data_file.html">파일데이터</a>
                <a href="../src/data_recommend.html">추천 데이터</a>
              </div>
            </li>
            <li>
                <a href="tool">데이터 툴</a>
                <div className="header_nav_menu_sub js_nav_menu" ref='toggle4'>
                <a href="tool">도구</a>
              </div>
            </li>
            <li>
              <a href="/notice">정보공유</a>
              <div className="header_nav_menu_sub js_nav_menu" ref='toggle2'>
                <a href="/notice">공지사항</a>
                <a href="/board">자유게시판</a>
                <a href="/request">API 요청 게시판</a>
              </div>
            </li>
            {sessionStorage.getItem("user") &&
            <li>
              <a href="../src/mypage.html">마이페이지</a>
              <div className="header_nav_menu_sub js_nav_menu" ref='toggle3'>
                <a href="../src/mypage.html">나의 오픈 API</a>
                <a href="../src/mypage_history.html" >나의 사용이력</a>
                <a href="../src/mypage_favorites.html"> 즐겨찾기</a>
              </div>
            </li>
            }
          </ul>
          </div>
        {}
      </nav>
    
        </header>

        <div>
          <section className="sub_nav" style={{ marginTop: '100px', marginBottom: '0px' }}>
            <h2>정보공유</h2>
            <div className="sub_nav_menu">            
              
              <a href="/notice" className="on">공지사항</a>
              <a href="/board">자유게시판</a>
              <a href="/request">API 요청 게시판</a>

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

              <a href="/notice" className="on">공지사항</a>
              <a href="/board">자유게시판</a>
              <a href="/request">API 요청 게시판</a>

              {/* {this.state.dataType == "data_file" && <a href="/src/data_file.html" className="on">API 요청 게시판</a>} */}
              {/* {this.state.dataType !== "data_file" && <a href="/src/data_file.html">API 요청 게시판</a>} */}


            </div>
                  
            </div>
          
          <div class="layout_sub_cont" >
      <table class="tb_board_write">
            
      <tr>
                        <th>제목</th>
                        <td>
                          <input type="text" id="" placeholder="제목을 입력해 주세요"
                            className={classes.textField}
                            value={this.state.name}
                            onChange={this.handleChange('notice_title')}
                        /></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <div className="cont_board_textarea">
                            <textarea type="text" id="" placeholder="내용을 입력해 주세요"
                            className={classes.textField}
                            value={this.state.name}
                            onChange={this.handleChange('notice_contents')}
                            />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file" id=""/></td>
                    </tr>
                
        </table>
        <div class="cont_data_btns">
                    <button type="submit" class="btn_btm_submit" onClick={this.writeButton}>작성 완료</button>
                    <button type="submit" class="btn_btm_cancel" onClick={this.handleReturnCardList}>취소</button>
                </div>
      </div>
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
export default withStyles(styles)(request_write);
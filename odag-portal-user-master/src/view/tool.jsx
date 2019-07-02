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


import CardList from '../view/templates/temp_toolList';
import Sub_bigdata_carddetail from '../view/templates/temp_sub_bigdata_carddetail';
import Sub_ai_carddetail from '../view/templates/temp_sub_ai_carddetail';

import CustomPaginationActionsTable from './main_templates/coupon_table.jsx';
import { Divider } from '@material-ui/core';

import normalize from '../assets/css/normalize.css';
import font from '../assets/css/font.css';
import swiper_min from '../assets/css/swiper.min.css';

import styles from '../assets/css/style.css';

import config  from "../js/config.js";

import user_sesstion from "./layout/session_nav"

import session_nav from "./layout/session_nav"

import { findDOMNode } from 'react-dom';
import $ from "jquery";
window.$ = $;

var myrows1 = [

];

var myrows2 = [

];
class tool extends React.Component 
{
  
  state = {
    name: 'Cat in the Hat',
    age: 0,
    multiline: 'Controlled',
    currency: 'NULL',
    word: 'NULL',
    category: 'NULL',
    value: 'cate',
    user_id: 'NULL',
    rows: myrows1,
    rows2: myrows2,
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
    this.state.bookmark_no = 1;

    this.state.TabTypes = 0;

    this.state.tool_no = this.props.tool_no;

    this.state.popupType = 0;

    this.state.word = null;

    this.state.category = this.props.category;
    
    this.state.dataType = this.props.dataType;

  }

  search = (event) => {
    var urlParams = new URLSearchParams(window.location.search);

    var searchWord = urlParams.get('name');
    var category = urlParams.get('category');
    
    console.log("aaa searchWord = " + searchWord);

    this.state.word = searchWord;
    this.state.category = category;
    if (!!document.getElementById("search_keyword")) {
      document.getElementById("search_keyword").value = searchWord;
    }

  }

  enterCheck = (e) => {
    if (e.keyCode === 13) {
      e.preventDefault();
      e.stopPropagation();
      this.onClickButton();
    }
  }

  categorys = () => {
    var urlParams = new URLSearchParams(window.location.search);

    var categoryWord = urlParams.get('category');

    console.log("aaa categoryWord = " + categoryWord);

    this.state.category = categoryWord;

  }

  handleCategory = (event) => {
    console.log("cate1 = " + event.target.value);
    this.setState({values: event.target.value});
  }

  onClickButton = (event) => {
    if(this.state.dataType == "tool" && this.state.values == this.state.values){

      this.props.history.push({
        pathname: '/tool',
        search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,
        
      });
      console.log("검색 : " + this.state.values);
      window.location.reload();              
    }
    
    
    // else if(this.state.dataType == "data_recommend" && this.state.values == this.state.values){
    //   this.props.history.push({
    //     pathname: '/src/data_recommend.html',
    //     search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,
    //   });
     
    //   window.location.reload();   
    // }
    
  }

  handleReady()
  {
    alert("준비중 입니다.")
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
 
  handleClickTabTypes(types , data_type) 
  {    

    
    console.log('aaa = ' + types + "/ " + data_type);
    if(data_type == "빅데이터")
    {
      this.setState(
        {
          TabTypes : 1,
          tool_no : types
        }
      );

      
    }
    else if(data_type == "AI")
    {
      this.setState(
        {
          TabTypes : 2,
          tool_no : types
        }
      );

    }
   
  }


  _getData = async () => {
    this.setState({
        fetching: true // requesting..
    });

    var user_id = sessionStorage.getItem("user");
    var urlstring = config.serverpoint + '/bookmark/' + user_id;

    await axios.get(urlstring)
        .then(response => 
        {
            this.state.rows = response.data;

            console.log("ㅁㅁㅁ" + this.state.rows.length);

            if(this.state.rows.length == undefined){
              this.setState({
                fetchings: true // done!
              });
            }

            else{
            this.setState({
                fetchings: false // done!
            });
          }

        }) // SUCCESS
        .catch(response => { console.log(response); }); // ERROR

    var urlstring2 = config.serverpoint + '/recommandation/search'

    await axios.get(urlstring2)
      .then(response => {

        var newRows = [];

        for(var i = 0 ; i < response.data.length ; i++){
              var dataPack = 
              {          
                // ranking : "0",
                search_keywords : "검색어",
              }
              var tempdatapack = eval('(' + JSON.stringify(dataPack) + ')');

              // tempdatapack.ranking = response.data[i].ranking;
              tempdatapack.search_keywords = response.data[i].search_keywords;   

              newRows.push(tempdatapack);            
              
          }
          this.state.rows3 = newRows;
          console.log(newRows);
  
          
              this.setState({
                  fetching: false
              });

      }).catch(response => { console.log(response); });
        
  };

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
        tool_no : ""
      }
    );
  }

  handleCreate(){
    history.push('/src/mypage_favorites.html')
  }

  handlePopupCancle()
  {
    console.log("Cancle");
    this.setState({ popupType : 0});
  }

  handleChange(event) 
  {
    
    this.setState({
      bookmark_name : event.target.value,
    });   
  }  

  handlePopupAccept(event)
  {
    console.log("handlePopupAccept");
    console.log('no = ' + this.state.bookmark_no)
    console.log('name = ' + this.state.bookmark_name)
    var id = sessionStorage.getItem("user");
    this.state.bookmark_name = document.getElementById('test_select').value;
    var no = this.state.bookmark_name
    var tool_no = this.state.tool_no;
    var urlstring = config.serverpoint + '/bookmark/' + id + '/' + no;

    console.log(urlstring);
    axios.post(urlstring , {
      openapi_no: this.state.tool_no
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
    alert("즐겨찾기에 추가하였습니다.");
    window.location.reload();
  }

  _handleTextFieldChange_item_type = (e) => {

    this.setState({
      textFieldValue_item_type: e.target.value,
      currency: e.target.value
    });
    //console.log(e.target.value);
  }

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

    const { rows3 = [] } = this.state;
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
                    
                    <li className="on"><a href="tool">데이터 툴</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="tool">도구</a>
                        </div>
                    </li>
                    <li class="header_nav_menu2"><a href="/notice">정보공유</a>
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
            <h2>데이터 툴</h2>
            <div className="sub_nav_menu">
            
              {this.state.dataType == "tool" &&<a href="/tool" className="on2">도구</a>}
              {this.state.dataType !== "tool" &&<a href="/tool" >도구</a>}

            
             
            </div>
          </section>
        </div>

        <main className="main_sub">
          <div className="layout_inner layout_clearfix">
            <div class="layout_sub_side">

            <h2>데이터 툴</h2>
            <div className="sub_nav_menu">
            
              {this.state.dataType == "tool" &&<a href="/tool" className="on2">도구</a>}
              {this.state.dataType !== "tool" &&<a href="/tool" >도구</a>}

            
             

            </div>
                </div>
            <div className="layout_sub_cont"> 
              {
                this.state.TabTypes == 0 &&
                <div>
                <div className="cont_data_search">  

                <div className="cont_data_search_forms">
                  <form method id="form" onsubmit="return false">
                   
                    <div className="cont_data_search_form_input">
                    
                      <input type="text" id="search_keyword" onKeyDown={this.enterCheck}/>
                      {this.search()}
                      <button type="button" id onClick={this.onClickButton} className="cont_data_search_form_btns">
                        <span>Search</span>
                      </button>
                      
                    </div>
                  </form>
                </div>
              </div>
                {this.categorys()}
                
                <CardList returnType={this.handleClickTabTypes}  dataType = {this.state.dataType} word = {this.state.word} category = {this.state.category} value = {this.state.value}/>
                
                 </div>
              }
              {
                this.state.TabTypes == 1 &&  
                <Sub_bigdata_carddetail 
                  tool_no={this.state.tool_no} 
                  returnPopupOpen = {this.handlePopupOpen} 
                  returnTabClose = {this.handleClickTabClose}
                />
              }
              {
                this.state.TabTypes == 2 &&  
                <Sub_ai_carddetail 
                  tool_no={this.state.tool_no} 
                  returnPopupOpen = {this.handlePopupOpen} 
                  returnTabClose = {this.handleClickTabClose}
                />
              }              
            </div>
            {}
          </div>
          {this.state.popupType == 1 && this.state.fetchings == true &&
         <div class="pop_common">
                <h4 class="pop_tit">알림</h4>
                <div class="pop_cont_wrap">
                    <div class="pop_cont">
                        <div class="pop_cont_select">
                            <p>분류함을 만들어주세요</p>
                            <div>
                            </div>
                        </div>
                    </div>
                    <div class="pop_btns">
                      <button type="submit" class="pop_btn_submit" onClick={this.handleCreate}>확인</button>
                      <button type="button" class="pop_btn_cancel" onClick={this.handlePopupCancle}>취소</button>  
                    </div>
                </div>
            </div>
          }

          {this.state.popupType == 1 && this.state.fetchings == false &&
                <div class="pop_common">
                <h4 class="pop_tit">알림</h4>
                <div class="pop_cont_wrap">
                    <div class="pop_cont">
                        <div class="pop_cont_select">
                            <p>선택한 openAPI를 보관할 분류함을 선택해주세요.</p>
                            <div>
                                <select id='test_select' value={this.state.bookmark_name} onChange={this.handleChange}>
                                    {this.state.rows
                                        .map(row => 
                                        {
                                            return (
                                              
                                                <option value={row.bookmark_no}>{row.bookmark_name}</option>
                                                
                                            
                                            );
                                        })
                                    }                                    
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="pop_btns">
                      <button type="submit" class="pop_btn_submit" onClick={this.handlePopupAccept}>확인</button>
                      <button type="button" class="pop_btn_cancel" onClick={this.handlePopupCancle}>취소</button>
                    </div>
                </div>
            </div>
          }
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
export default withStyles(styles)(tool);
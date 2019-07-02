import React from 'react';
import axios from "axios";
import classNames from 'classnames';

// reactstrap components
import {
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
  UncontrolledDropdown,
  NavLink,
  Table,
  Card,
  CardBody,
} from "reactstrap";

import { withStyles } from '@material-ui/core/styles';
import history from '../js/history.js';
import TextField from '@material-ui/core/TextField';
import Clock from './clock';
import MenuItem from '@material-ui/core/MenuItem';


import CardList from '../view/templates/temp_cardList';
import Sub_file_carddetail from '../view/templates/temp_sub_file_carddetail';
import Sub_Oda_carddetail from '../view/templates/temp_sub_Oda_carddetail';

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
// import Swiper from "./main";
import TagCloud from 'react-tag-cloud';
import randomColor from 'randomcolor';

window.$ = $;

var myrows1 = [

];

var myrows2 = [

];

const bigdata_ranking = {
  slidesPerView: 3,
  slidesPerColumn: 1,
  spaceBetween: 30,
  speed: 1000,
  autoplay: {
    delay: 3000,
    disableOnInteraction: false
  },
};

class Clickable extends React.Component 
{

  constructor(...props) {
    super(...props);
    this.handleClickChild = this.handleClickChild.bind(this);
  }
  
  handleClickChild() {
    this.props.onClick(this.props.id)
  }

  render() {
    return (
      <a href="#" onClick={this.handleClickChild}>{this.props.text}</a>
    )
  }
}

class view_data extends React.Component
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
    startpage : 0,
    endpage : 0,
    page: 0,
    rowsPerPage: 10,
    pagemax: 0,
    pagemap : null,
    rows: myrows1,
    rows2: myrows2,
    bigdata: 'NULL'
  };

  constructor(...props) {
    super(...props);

    this.handleClick = this.handleClick.bind(this);

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

    this.state.openapi_no = null;

    this.state.popupType = 0;

    this.state.word = null;

    this.state.rowsPerPage = 10;
    this.state.page = 0;
    this.state.pagemap = new Array();
    this.state.startpage = 0;
    this.state.endpage = 0;

    this.state.category = this.props.category;

    this.state.dataType = this.props.dataType;

    this.state.recommend = this.props.recommend;

    this.state.bigdata = null;

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
    if(this.state.dataType == "data" && this.state.values == this.state.values){

      this.props.history.push({
        pathname: '/src/data.html',
        search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,

      });
      console.log("검색 : " + this.state.values);
      window.location.reload();
    }

    else if(this.state.dataType == "data_oda" && this.state.values == this.state.values){
      this.props.history.push({
        pathname: '/src/data_oda.html',
        search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,
      });

      window.location.reload();
    }
    else if(this.state.dataType == "data_file" && this.state.values == this.state.values){
      this.props.history.push({
        pathname: '/src/data_file.html',
        search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,
      });

      window.location.reload();
    }
    else if(this.state.dataType == "data_recommend" && this.state.values == this.state.values){
      this.props.history.push({
        pathname: '/src/data_recommend.html',
        search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,
      });

      window.location.reload();
    }
    else if(this.state.dataType == "data_recommend_bigdata" && this.state.values == this.state.values){
      this.props.history.push({
        pathname: '/src/data.html',
        search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,
      });

      window.location.reload();
    }
    else if(this.state.dataType == "data_recommend_history" && this.state.values == this.state.values){
      this.props.history.push({
        pathname: '/src/data_recommend_history.html',
        search: '?name=' + document.getElementById("search_keyword").value + '&category=' + this.state.values,
      });

      window.location.reload();
    }
  }

  onClickBigdataButton = (key) => {

    console.log(key);

    this.props.history.push({
      pathname: '/src/data.html',
      search: '?name=' + key,
    });
    console.log("검색 : " + this.state.values);
    window.location.reload();

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

  handleClickTabTypes(types , activity_type)
  {


    console.log(types + "/ " + activity_type);
    if(activity_type == "download")
    {
      this.setState(
          {
            TabTypes : 1,
            openapi_no : types
          }
      );


    }
    else
    {
      this.setState(
          {
            TabTypes : 2,
            openapi_no : types
          }
      );

    }

  }
  _getData = async () => {
    this.setState({
      fetchings : true, // requesting..
      fetchings_bigdata : true
    });

    if (this.state.dataType !== "data_recommend_bigdata") {
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

    } else {
      var urlstring3 = config.serverpoint + '/recommandation/bigdata/keyword';

      await axios.get(urlstring3)
          .then(response =>
          {
            var newRows = [];

            for(var i = 0 ; i < response.data.length ; i++){
              if(response.data == "검색 결과가 없습니다."){
                console.log("aaa" + response.data)
                alert("검색 결과가 없습니다. 다시 입력해주세요");
                history.push("/main");
                window.location.reload();
                return;
              }
                var dataPack = 
                {          
                  key : "이름",
                  score : "점수",
                }
                var tempdatapack = eval('(' + JSON.stringify(dataPack) + ')');
  
                tempdatapack.key = response.data[i].key;                   
                tempdatapack.score = response.data[i].score;   
               
                newRows.push(tempdatapack);     
                  
              }

            // this.state.fetchings_bigdata = false;
            this.state.bigdata = newRows;
            this.state.pagemax = Math.ceil(response.data.length/this.state.rowsPerPage);
            this.state.endpage = ((Math.floor(parseInt(this.state.page/10))+1)*10);
            for (var i=0; i<this.state.pagemax; i++) {
              this.state.pagemap.push(i);
            } 
            this.setState({
              fetchings_bigdata: false
            });

          }) // SUCCESS
          .catch(response => { console.log(response); }); // ERROR
    }

    var urlstring2 = config.serverpoint + '/recommandation/search';

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

  handleClick(v) {
    this.state.page = v;
  }

  handleFirstPageButtonClick = event => {
    
  };

  handleBackButtonClick = event => {

    if(this.state.page > 9)
    {
      this.state.page -= 9;
      this.state.startpage = (((Math.floor(parseInt(this.state.page/10))+1)*10)-10);
      this.state.endpage = ((Math.floor(parseInt(this.state.page/10))+1)*10);

      this.state.page = this.state.startpage;
    }

  };

  handleNextButtonClick = event => {
    if ( this.state.endpage < this.state.pagemax) {
      this.state.page += 10;
      this.state.page = parseInt(this.state.page/this.state.rowsPerPage) * this.state.rowsPerPage + 1;

      this.state.startpage = (((Math.floor(parseInt(this.state.page/10))+1)*10)-10);
      this.state.endpage = ((Math.floor(parseInt(this.state.page/10))+1)*10);

      this.state.page = this.state.startpage;
    }
  };

  handleLastPageButtonClick = event => {
    
  };

  handleChangePage = (event, page) => {
    
  };


  handleChangeRowsPerPage = event => {
    
  };

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
    var openapi_no = this.state.openapi_no;
    var urlstring = config.serverpoint + '/bookmark/' + id + '/' + no;

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

    const { bigdata, rows3 = [], rowsPerPage, page} = this.state;
    return (

        <div>
   <header className="header_common">
      <div class="layout_inner">
            <h1 class="header_top_logo"><a href="/"><img src={ require('../assets/images/header_logo.png')} alt="Cloudit" /></a></h1>
            <nav class="header_nav">
                <ul class="header_nav_menu">
                    <li><a href="../src/guide.html">이용안내</a></li>
                   
                    <li class="on"><a href="../src/data.html">오픈데이터</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="../src/data_oda.html">오픈데이터 API</a>
                            <a href="../src/data_file.html">파일데이터</a>
                            <a href="../src/data_recommend.html">추천 데이터</a>
                        </div>
                    </li>
                    
                    <li class="header_nav_menu2"><a href="../tool">데이터 툴</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="../tool">도구</a>
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
              <h2>데이터</h2>
              <div className="sub_nav_menu">

                {this.state.dataType == "data" &&<a href="/src/data.html" className="on2">전체</a>}
                {this.state.dataType !== "data" &&<a href="/src/data.html" >전체</a>}


                {this.state.dataType == "data_oda" && <a href="/src/data_oda.html" className="on2">오픈데이터 API</a>}
                {this.state.dataType !== "data_oda" && <a href="/src/data_oda.html">오픈데이터 API</a>}


                {this.state.dataType == "data_file" && <a href="/src/data_file.html" className="on2">파일데이터</a>}
                {this.state.dataType !== "data_file" && <a href="/src/data_file.html">파일데이터</a>}


                {this.state.dataType == "data_recommend" &&<a href="/src/data_recommend.html"  className="on2">추천 데이터</a>}
                {this.state.dataType == "data_recommend_bigdata" &&<a href="/src/data_recommend_bigdata.html"  className="on2">추천 데이터</a>}
                {this.state.dataType == "data_recommend_history" &&<a href="/src/data_recommend_history.html"  className="on2">추천 데이터</a>}
                {(this.state.dataType !== "data_recommend" && this.state.dataType !== "data_recommend_bigdata" && this.state.dataType !== "data_recommend_history") && <a href="/src/data_recommend.html">추천 데이터</a>}

              </div>
            </section>
          </div>

          <main className="main_sub">
            <div className="layout_inner layout_clearfix">
              <div class="layout_sub_side">


                <h2>데이터</h2>
                <div class="sub_nav_menu">
                  {this.state.dataType == "data" &&<a href="/src/data.html" class="on2">전체</a>}
                  {this.state.dataType !== "data" &&<a href="/src/data.html" >전체</a>}


                  {this.state.dataType ==  "data_oda" &&<a href="/src/data_oda.html" class="on2">오픈데이터 API</a>}
                  {this.state.dataType !==  "data_oda" &&<a href="/src/data_oda.html">오픈데이터 API</a>}


                  {this.state.dataType == "data_file" &&<a href="/src/data_file.html" class="on2">파일데이터</a>}
                  {this.state.dataType !== "data_file" &&<a href="/src/data_file.html">파일데이터</a>}



                  {this.state.dataType == "data_recommend" &&<a href="/src/data_recommend.html" class="on2">추천 데이터</a>}
                  {this.state.dataType !== "data_recommend" &&<a href="/src/data_recommend.html">추천 데이터</a>}
                  {
                    (this.state.dataType == "data_recommend" || this.state.dataType == "data_recommend_bigdata" || this.state.dataType == "data_recommend_history") &&
                    <div className="sub_nav_favorites">
                      <ul className="sub_nav_favorites_menu">
                        
                        <li><a href="/src/data_recommend.html" className={this.state.dataType == "data_recommend" && "on2"} style={{ padding: '2px'}}>인기 오픈데이터 추천</a></li>
                        <li><a href="/src/data_recommend_bigdata.html" className={this.state.dataType == "data_recommend_bigdata" && "on2"} style={{ padding: '2px'}}>빅데이터 분석 추천</a></li>
                        <li><a href="/src/data_recommend_history.html" className={this.state.dataType == "data_recommend_history" && "on2"} style={{ padding: '2px'}}>사용량 기반 추천</a></li>
                        
                      </ul>
                    </div>
                  }


                </div>
              </div>
              <div className="layout_sub_cont">
                {
                  this.state.TabTypes == 0 &&
                  <div>
                    <div className="cont_data_search">

                      <div className="cont_data_search_form">
                        <form method id="form" onsubmit="return false">
                          <div className="cont_data_search_form_select">
                            <select value={this.state.values} onChange={this.handleCategory}>
                              <option value>전체</option>
                              <option value="보건의료">보건의료</option>
                              <option value="경제">경제</option>
                              <option value="문화관광">문화관광</option>
                              <option value="교육">교육</option>
                              <option value="환경">환경</option>
                              <option value="공간정보">공간정보</option>
                              <option value="복지">복지</option>
                              <option value="행정">행정</option>
                              <option value="식품">식품</option>
                              <option value="농축수산">농축수산</option>

                            </select>
                          </div>
                          <div className="cont_data_search_form_input">

                            <input type="text" id="search_keyword" onKeyDown={this.enterCheck}/>
                            {this.search()}
                            <button type="button" id onClick={this.onClickButton} className="cont_data_search_form_btn">
                              <span>Search</span>
                            </button>

                          </div>
                        </form>
                      </div>
                      {this.state.dataType !== "data_recommend" && this.state.dataType !== "data_recommend_bigdata" && this.state.dataType !== "data_recommend_history" &&
                        <div className="cont_data_search_keyword">
                          <h4>인기검색어</h4>
                          <ul className="layout_clearfix">


                            {rows3
                                .map(row => {
                                  return (
                                      <li><a
                                          href={"/src/data.html?name=" + row.search_keywords}>{this.state.fetching == false && row.search_keywords}</a>
                                      </li>
                                  );
                                })

                            }

                          </ul>
                        </div>
                      }
                    </div>
                    {this.state.dataType == "data_recommend" &&
                      <div className="favorites_name"> <h3>인기 오픈데이터 추천</h3> </div>
                    }
                    {this.state.dataType == "data_recommend_bigdata" &&
                      <div className="favorites_name"> <h3>빅데이터 분석 추천</h3> </div>
                    }
                    {this.state.dataType == "data_recommend_history" &&
                      <div className="favorites_name"> <h3>사용량 기반 추천</h3> </div>
                    }
                    {this.categorys()}
                    {this.state.dataType !== "data_recommend_bigdata" &&
                    <CardList returnType={this.handleClickTabTypes} dataType={this.state.dataType} word={this.state.word}
                              category={this.state.category} value={this.state.value}/>
                    }
                    {this.state.dataType == "data_recommend_bigdata" &&
                    
                    
                      <table class="tb_data_list">
                           
                        <thead>
                        <tr>
                            <th style={{ width: '120px' }}>순위</th>
                            <th>키워드</th>
                            <th>점수</th>
                        </tr>
                        </thead>
                        <tbody>
                          {
                            this.state.fetchings_bigdata == false &&
                            bigdata
                                .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
                                .map((row, index) =>
                                {
                                  return (
                                      <tr>
                                        <td onClick={() => this.onClickBigdataButton(row.key)} className="text-center">{index+1}</td>
                                        <td onClick={() => this.onClickBigdataButton(row.key)} className="text-center">{row.key}</td>
                                        <td onClick={() => this.onClickBigdataButton(row.key)} className="text-center">{row.score.toFixed(3)}</td>
                                      </tr>
                                  )
                                })
                          }
                        </tbody>
                    </table>
                    }
                    
                      <div className="cont_board_pagenation">
                        <a href="#" className="cont_board_pagenation_btn prev"  onClick={this.handleBackButtonClick}></a>
                        {this.state.fetchings_bigdata == false && 
                            this.state.pagemap
                                .slice(this.state.startpage,this.state.endpage)
                                .map((row, index) =>
                                    {
                                      return (
                                        <Clickable id={index + this.state.startpage} onClick={this.handleClick} text = {(index + this.state.startpage + 1)}/>
                                      )
                                    }
                                )
                          }
                         
                        <a href="#" className="cont_board_pagenation_btn next"  onClick={this.handleNextButtonClick}></a>
                      </div>     
                    
                  </div>
                }
                {
                  this.state.TabTypes == 1 &&
                  <Sub_file_carddetail
                      openapi_no={this.state.openapi_no}
                      returnPopupOpen = {this.handlePopupOpen}
                      returnTabClose = {this.handleClickTabClose}
                  />
                }
                {
                  this.state.TabTypes == 2 &&
                  <Sub_Oda_carddetail
                      openapi_no={this.state.openapi_no}
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
export default withStyles(styles)(view_data);
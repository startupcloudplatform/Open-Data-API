import React from 'react';

import axios from "axios";
import classNames from 'classnames';

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

import $ from "jquery";
window.$ = $;

var myrows = [

];

var myrows2 = [

];

myrows.sort((a, b) => (a.calories < b.calories ? -1 : 1));

class notice_no extends React.Component {
    constructor(...props) {
        super(...props);
        
        this.handleClick = this.handleClick.bind(this);

        this.handlePopupOpen = this.handlePopupOpen.bind(this);

        this.handleReturnCardList = this.handleReturnCardList.bind(this);
        
        this.state.notice_no = this.props.notice_no;

        this.state.returnPopupOpen = this.props.returnPopupOpen;

        this.state.returnTabClose = this.props.returnTabClose;
        
    }
  
    handleReady()
    {
      alert("준비중 입니다.")
    }

    handleClick(v) {
        this.state.page = v;
    }

    handlePopupOpen() {
        this.props.returnPopupOpen();
    }

    handleReturnCardList() {
        this.props.returnTabClose();
    }

    state =
        {
          rows: myrows,
          rows2: myrows2,
            page: 0,
            rowsPerPage: 10,
            pagemax: 0
        };

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

    _getData = async () => {
        this.setState({
            fetching: true // requesting..
        });
        
        console.log('information no : ' + window.location.href);
        console.log('information no : ' + window.location.pathname);
        //console.log('information no : ' + urlParams.get("notice_no"));

        //var urlstring = config.serverpoint + '/notice/' + this.props.notice_no;
        //var urlstring = config.serverpoint + '/notice/' + document.getElementById("notice_no").value;
        var urlstring = config.serverpoint + '/boards' + window.location.pathname;

        console.log('information urls: ' + urlstring);
        
        console.log(urlstring);

        await axios.get(urlstring)
            .then(response => 
            {
                this.state.rows = response.data[0];

                this.setState({
                    fetching: false // done!
                });

            }) // SUCCESS
            .catch(response => { console.log(response); }); // ERROR

            var urlstring2 = config.serverpoint + '/boards' + window.location.pathname + '/comment';

        console.log('information url: ' + urlstring2);
        
        console.log(urlstring2);
        
        await axios.get(urlstring2)
            .then(response => 
            {
                var newRows = [];


                for(var i = 0 ; i < response.data.length ; i++){
                    var dataPack = 
                    {          
                        user_id : "작성자",
                        community_reply_contents : "내용",
                        create_time : "2019.01.21",
                    }
                    var tempdatapack = eval('(' + JSON.stringify(dataPack) + ')');

                    tempdatapack.user_id = response.data[i].user_id;                   
                    tempdatapack.community_reply_contents = response.data[i].community_reply_contents;                   
                    tempdatapack.create_time = response.data[i].create_time;

                    newRows.push(tempdatapack);
                   
                }
                this.state.rows2 = newRows;
               
                    this.setState({
                        fetching: false // done!
                    });
                
                

            }) // SUCCESS
            .catch(response => { console.log(response); }); // ERROR
    };



    handleFirstPageButtonClick = event => {

    };

    handleBackButtonClick = event => {

        if (this.state.page > 10) {
            this.state.page -= 10;
            this.state.page = parseInt(this.state.page / this.state.rowsPerPage) * this.state.rowsPerPage + 1
        }

    };

    handleNextButtonClick = event => {

        this.state.page += 10;
        this.state.page = parseInt(this.state.page / this.state.rowsPerPage) * this.state.rowsPerPage + 1
    };

    handleLastPageButtonClick = event => {

    };

    handleChangePage = (event, page) => {

    };


    handleChangeRowsPerPage = event => {

    };

    handleCursorClick = (event, pagenum) => {
        console.log(pagenum);
    };

    handleChange = name => event => {
      this.setState({
        [name]: event.target.value,
      });
  };
  
    writeButton = () => {
      var url = config.serverpoint + '/boards' + window.location.pathname + '/comment';
  
      console.log("보낼 url = " + url);
      console.log("보낼 내용 = " + this.state.community_reply_contents);

      if(!this.state.community_reply_contents){
        alert("내용을 입력하세요")
        return;
      }
  
      else{
        axios.post(url,{
          community_reply_contents : this.state.community_reply_contents,
        }).then(function(response){
          console.log("information response = " + response);
          alert("댓글 작성 완료");
          window.location.reload();
        }).catch(response => { console.log("information response =" + response);
      });
      }
  
    }

    render() {
      const { rows, rows2, rowsPerPage, page } = this.state;
        //console.log('count: ' + this.state.rows.count);
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
                <a href="/board" className="on2">자유게시판</a>
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
  
                <a href="/notice">공지사항</a>
                <a href="/board" className="on2">자유게시판</a>
                <a href="/request">API 요청 게시판</a>
  
                {/* {this.state.dataType == "data_file" && <a href="/src/data_file.html" className="on">API 요청 게시판</a>} */}
                {/* {this.state.dataType !== "data_file" && <a href="/src/data_file.html">API 요청 게시판</a>} */}
  
  
                    </div>
                  </div>
                  <div>
                {this.state.fetching == false &&
            <div className="layout_sub_cont">                    
                <div className="cont_notice_read">
                    <div className="cont_notice_read_tit layout_clearfix">
                        <div className="tit">{this.state.rows.community_title}</div>
                        <div className="info">
                        <span>작성자 : {this.state.rows.user_id}</span>
                            <span>{this.state.rows.create_time}</span>
                            <span>{this.state.rows.count}</span>
                        </div>
                    </div>

                    <div className="cont_notice_read_body">
                    {this.state.rows.community_contents}
                    </div>
                    <div class="layout_sub_cont" >
                    <table class="tb_board_reply_write">
                        <tr>
                            <td>
                            <input type="text" id="" placeholder="댓글을 입력해 주세요"
                            value={this.state.name}
                            onChange={this.handleChange('community_reply_contents')}
                        />
                            </td>
                            <td><button type="submit" class="btn_btms_submit" onClick={this.writeButton}>확인</button></td>
                        </tr>

                    </table>
                    {/* <div class="cont_board_btns">
                    <button type="submit" class="btn_btm_submit" onClick={this.writeButton}>확인</button>
                </div> */}
                    </div>


                    <table class="board_reply">
                    {rows2
              
              .map(row => 
              {
                return (    
   
                     <tbody>
                     <tr><td><br></br></td></tr>
                     <tr><td class="class1"><strong>{row.user_id}</strong></td> </tr>
                     <tr><td class="class2">{row.community_reply_contents }</td></tr>
                     <tr><td class="class3">{row.create_time}</td></tr>
                     
                                        
                    
                </tbody>
                        
                );
              })
            }
                       
                    </table>

                    <div className="cont_notice_read_btns layout_clearfix">
                        {/* <div>
                            <a href="#이전글" className="btn_btm_normal"><span class="ico_up">이전글</span></a>
                            <a href="#다음글" className="btn_btm_normal"><span class="ico_down">다음글</span></a>
                        </div> */}
                        <div>
                            <a href="/board" className="btn_btm_submit">목록</a>
                        </div>
                    </div>
                </div>
            </div>
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
export default withStyles(styles)(notice_no);
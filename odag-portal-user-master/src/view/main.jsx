import React from 'react';
import Swiper from 'react-id-swiper';
import axios from "axios";
import classNames from 'classnames';
import { withStyles } from '@material-ui/core/styles';
import history from '../js/history.js';
import TextField from '@material-ui/core/TextField';
import Clock from './clock';
import CardList from '../view/templates/temp_cardList';
import Sub_Oda_carddetail from '../view/templates/temp_sub_Oda_carddetail';
import CustomPaginationActionsTable from  '../view/main_templates/coupon_table.jsx';
import { Divider } from '@material-ui/core';
import styles from '../assets/css/style.css';
import normalize from '../assets/css/normalize.css';
import font from '../assets/css/font.css';
import {CopyToClipboard} from 'react-copy-to-clipboard';
import config  from "../js/config.js";
import QuickImage from 'react-quick-image';
import { Route, Link } from 'react-router';
import information from './information.jsx';
import session_nav from "./layout/session_nav"

import { findDOMNode } from 'react-dom';
import $ from "jquery";
window.$ = $;



var myrows2 = [
  
];
var myrows3 = [
  
];
const currencies = [
  
  {
    value: 'NULL',
    label: 'NULL',
  }, 
  {
    value: 'RUBY',
    label: 'RUBY',
  },
  {
    value: 'ITEM',
    label: 'ITEM',
  },
  
];
const QuickImages = ({find}) => (
  <img src={''} alt={find} />
);
QuickImages.defaultProps = {
  find: 'cat'
};
const Administration = () => <QuickImage find="law" />;
const Culture = () => <QuickImage find="culture" />;
const Economy = () => <QuickImage find="economy" />;
const Education = () => <QuickImage find="book" />;
const Environment = () => <QuickImage find="tree" />;
const Food = () => <QuickImage find="food" />;
const Health = () => <QuickImage find="drug" />;
const Random = () => <QuickImage find="random" />;
const Product = () => <QuickImage find="farm" />;
const Space_information = () => <QuickImage find="information" />;
const Welfare = () => <QuickImage find="aged" />;
class main extends React.Component 

{
  state = {
    name: 'Cat in the Hat',
    age: 0,
    multiline: 'Controlled',
    currency: 'NULL',
    value: 'data',
    rows2: myrows2,
    rows3: myrows3,
  };   
 
  constructor(props) {        
    
    super(props);
    // this.state = {
    //   date: new Date(),
    //   displayMenu: false,
    
    // };
    this.child = React.createRef();
    this.state.age = 1000;
    this.state.textFieldValue_value = 1000;
    this.categoryButton = this.categoryButton.bind(this);
    this.showDropdownMenu = this.showDropdownMenu.bind(this);
    this.hideDropdownMenu = this.hideDropdownMenu.bind(this);
    this.state.notice_no = this.props.notice_no;
    this.state.notice_title = this.props.notice_title;
    this.state.create_user_id = this.props.create_user_id;
    this.handleMouseHover = this.handleMouseHover.bind(this);
    this.state={
      isHovering: false,
    }
  }
  handleMouseHover() {
    this.setState(this.toggleHoverState);
  }

  toggleHoverState(state) {
    return {
      isHovering: !state.isHovering,
    };
  }

  showDropdownMenu(event) {
    event.preventDefault();
    this.setState({ displayMenu: true }, () => {
    document.addEventListener('click', this.hideDropdownMenu);
    });
  }
  hideDropdownMenu() {
    this.setState({ displayMenu: false }, () => {
      document.removeEventListener('click', this.hideDropdownMenu);
    });
  }
  handleChange = (event) => {
    this.setState({value: event.target.value});
  }
  handleReady()
  {
    alert("준비중 입니다.")
  }
  onClickButton = () => {
    
    if(this.state.value == "data"){
      this.props.history.push({
        pathname: '/src/data.html',
        search: '?name=' + document.getElementById("search_keyword").value
      });
    }
    else if(this.state.value == "data_oda"){
      this.props.history.push({
        pathname: '/src/data_oda.html',
        search: '?name=' + document.getElementById("search_keyword").value
      });
    }
    else if(this.state.value == "data_file"){
      this.props.history.push({
        pathname: '/src/data_file.html',
        search: '?name=' + document.getElementById("search_keyword").value
      });
    }
    else if(this.state.value == "data_recommend"){
      this.props.history.push({
        pathname: '/src/data_recommend.html',
        search: '?name=' + document.getElementById("search_keyword").value
      });
    }
    else{
      this.props.history.push({
        pathname: '/src/data.html',
        search: '?name=' + document.getElementById("search_keyword").value
      });
    }
  }
  categoryButton(categorys) {
    this.props.history.push({
      pathname: '/src/data.html',
      //search: '?category=' + document.getElementById("shortcut").innerText
      search: '?category=' + categorys
    });
    
  }
  popular_word = (words, params_sub) => {
      return (
          <>
              <ul className="swiper-wrapper">
                  <Swiper {...params_sub}>
                      {words
                          .map(row => {
                              return(
                                  <li className="swiper-slide">
                                      <a class="keyword_item" href={"/src/data.html?name=" + row.search_keywords} >{row.search_keywords}</a>
                                  </li>
                              );
                          })
                      }
                  </Swiper>
              </ul>
          </>
      )
  }

  popular_data = (words, params_popular) => {
    return (
        <>
            <ul className="swiper-wrapper">
                <Swiper {...params_popular}>
                
                    {words
                        .map(row => {
                            return(
                              <li className="swiper-slide">
                              <>                              
                                {row.category == "공간정보" && <Space_information/>}
                                {row.category == "보건의료" && <Health />}
                                {row.category == "경제" && <Economy />}
                                {row.category == "문화관광" && <Culture />}
                                {row.category == "교육" && <Education />}
                                {row.category == "환경" && <Environment />}
                                {row.category == "복지" && <Welfare />}
                                {row.category == "행정" && <Administration />}
                                {row.category == "식품" && <Food />}
                                {row.category == "농축수산" && <Product />}                              
                              
                                      <a href={"/src/data.html?name=" +row.name}>
                                   
                                    <div className="main_index_banner_small_tit">
                                      <p className="main_index_banner_small_tit_txt">
                                        {row.name}
                                      </p>
                                      <p className="main_index_banner_small_tit_date">
                                      {row.update_time}
                                      </p>
                                    </div>
                                    <div className="main_index_banner_small_hit layout_clearfix">
                                      <span>사용 횟수</span>
                                      <strong>{row.openapi_cnt_use}</strong>
                                    </div>
                                        </a>
                                     </>
                                </li>
                            );
                        })
                    }
                </Swiper>
            </ul>
        </>
    )
}
  handleClick = () => {
        
    var data = {
      item_type: this.state.textFieldValue_item_type,
      value: this.state.textFieldValue_value,
      message : this.state.textFieldValue_message,
      received_type : this.state.textFieldValue_received_type,
    }; 
    console.log(data);
    
    if(this.state.textFieldValue_value > 0 && this.state.textFieldValue_item_type != 'NULL')
    {
      axios.post('http://localhost:3030/main/makeDetail', data)
      .then( response => 
      {        
        this.state = {date: new Date()};
        try 
        {
          this.child.current.getAlert();      
        }
        catch (e) {
          
            alert(e);
        }      
       
      } 
      ) // SUCCESS
      .catch
      (
        response => 
        { 
          console.log(response); 
        } 
      );
    }
    else
    {
    } 
  }
  componentDidMount = () => {  
    this.totalcount();

  $(document).ready(function(){
    $(".header_nav_menu2").hover(function(){
     $(".header_nav_menu_sub").stop().slideDown(150);
    });
    $(".header_nav_menu_sub").mouseover(function(){
     $(".header_nav_menu_sub").stop();
    });
    $(".header_nav_menu2").mouseout(function(){
      $(".header_nav_menu_sub").slideUp(150);
     });
   });

};

  totalcount = async () => {
    this.setState({
        fetching: true // requesting..
    });
    var urlstring = config.serverpoint + '/datalist/count';
    await axios.get(urlstring)
        .then(response => 
        {
            this.state.rows = response.data;
            // this.setState({
            //     fetching: false // done!
            // });
        }) // SUCCESS
        .catch(response => { console.log(response); }); // ERROR
      var urlstring = config.serverpoint + '/datalist/filecount';
    await axios.get(urlstring)
        .then(response => 
        {
            this.state.rows4 = response.data;
            console.log('information' + this.state.rows4[0].count);
            this.setState({
                fetchings: false // done!
            });
        }) // SUCCESS
        .catch(response => { console.log(response); }); // ERROR
      //   this.setState({
      //     fetching: true // requesting..
      // });
  
      var requesturl = config.serverpoint + "/notice/notice5"; 
      
      console.log("information requesturl: " + requesturl);
  
      await axios.get(requesturl)
      .then( response => 
      {
                 
          var newRows = [];
          console.log(response.data);
  
          for(var i = 0 ; i < response.data.length ; i++)
          {
              var dataPack = 
              {          
                  notice_no : "100",
                  notice_title : "제목",
                  create_user_id : "운영자",
                  create_time : "2019.01.21",
                  count : "66",  
              }
                 
              var tempdatapack = eval('(' + JSON.stringify(dataPack) + ')');
  
              tempdatapack.notice_no = response.data[i].notice_no;    
              tempdatapack.notice_title = response.data[i].notice_title;    
              tempdatapack.create_user_id = response.data[i].create_user_id;    
              tempdatapack.create_time = response.data[i].create_time; 
              tempdatapack.count = response.data[i].count;
  
              newRows.push(tempdatapack);
              
          }
  
          console.log(newRows);
  
          this.state.rows2 = newRows;
  
          // this.setState({
          //     fetching: false
          // });
          
  
      } ) // SUCCESS
      .catch( response => { console.log(response); } ); // ERROR
      var requesturl2 = config.serverpoint + "/boards/boards5"; 
      
      console.log("information requesturl: " + requesturl2);
  
      await axios.get(requesturl2)
      .then( response => 
      {
                 
          var newRows = [];
          console.log(response.data);
  
          for(var i = 0 ; i < response.data.length ; i++)
          {
              var dataPack = 
              {          
                  community_no : "100",
                  community_title : "제목",
                  create_user_id : "운영자",
                  create_time : "2019.01.21",
                  count : "66",  
              }
                 
              var tempdatapack = eval('(' + JSON.stringify(dataPack) + ')');
  
              tempdatapack.community_no = response.data[i].community_no;    
              tempdatapack.community_title = response.data[i].community_title;    
              tempdatapack.create_user_id = response.data[i].create_user_id;    
              tempdatapack.create_time = response.data[i].create_time; 
              tempdatapack.count = response.data[i].count;
  
              newRows.push(tempdatapack);
              
          }
  
          console.log(newRows);
  
          this.state.rows3 = newRows;
  
          // this.setState({
          //     fetching: false
          // });
          
  
      } ) // SUCCESS
      .catch( response => { console.log(response); } ); // ERROR
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
            this.state.rows5 = newRows;
            console.log(newRows);
    
            
                this.setState({
                    fetching_search: false
                });
  
        }).catch(response => { console.log(response); });
        var requesturl_reco = config.serverpoint + "/recommandation/popular/api"; 
      
        console.log("information requesturl: " + requesturl_reco);
    
        await axios.get(requesturl_reco)
        .then( response => 
        {
                   
            var newRows = [];
            console.log(response.data);
    
            for(var i = 0 ; i < response.data.length ; i++)
            {
                var dataPack = 
                {          
                  openapi_no : "100",
                  name : "제목",
                  provider : "운영자",
                  update_time : "2019.01.21",
                  views_count : "66",  
                  openapi_cnt_use : "1",
                  category : "카테고리",
                }
                   
                var tempdatapack = eval('(' + JSON.stringify(dataPack) + ')');
    
                tempdatapack.openapi_no = response.data[i].openapi_no;    
                tempdatapack.name = response.data[i].name;    
                tempdatapack.provider = response.data[i].provider;    
                tempdatapack.update_time = response.data[i].update_time; 
                tempdatapack.views_count = response.data[i].views_count;
                tempdatapack.openapi_cnt_use = response.data[i].openapi_cnt_use;
                tempdatapack.category = response.data[i].category;
    
                newRows.push(tempdatapack);
                
            }
    
            console.log(newRows);
    
            this.state.rows6 = newRows;
    
            this.setState({
                fetching: false
            });
            
    
        } ) // SUCCESS
        .catch( response => { console.log(response); } ); // ERROR
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



  _handleTextFieldChange_item_type= (e) => {
    
    this.setState({
      textFieldValue_item_type: e.target.value,
      currency : e.target.value
    });
    //console.log(e.target.value);
  }
  _handleTextFieldChange_value= (e) => {
    
    this.setState({
      textFieldValue_value: e.target.value,
      age : e.target.value
    });
    //console.log(this.state.textFieldValue_value);
  }
  _handleTextFieldChange_message= (e) => {
  
  this.setState({
    textFieldValue_message: e.target.value
  });
  //console.log(this.state.textFieldValue_message);
  }
  _handleTextFieldChange_received_type= (e) => {
  
  this.setState({
    textFieldValue_received_type: e.target.value
  });
  //console.log(this.state.textFieldValue_received_type);
  }

  handleScriptCreate() {
    this.setState({ scriptLoaded: false })
  }
   
  handleScriptError() {
    this.setState({ scriptError: true })
  }
   
  handleScriptLoad() {
    this.setState({ scriptLoaded: true })
  }

  
  
  render() 
  {
    const { classes } = this.props;
    const params_sub = {
      direction: 'vertical',
      speed: 500,
      slidesPerView: 'auto',
      autoplay: {
        delay: 2500,
        disableOnInteraction: false
      },
      freeMode: true,
      // scrollbar: {
      //   el: '.swiper-scrollbar',
      // },
      mousewheel: true
    };
    const params_main = {
      spaceBetween: 30,
      speed: 1000,
      centeredSlides: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
      }
    };
    const params_popular = {
      slidesPerView: 3,
      slidesPerColumn: 1,
      spaceBetween: 30,
      speed: 1000,
      autoplay: {
        delay: 3000,
        disableOnInteraction: false
      },
    };
    const {row, rows2, rows3, rows4} = this.state;
    const {rows5 = [], rows6 = [] } = this.state;

    
    return (
     
    <div>   
       <>
      <script src="../asserts/js/jquery-1.9.1.min.js"></script>
      <script src="../asserts/js/jquery.script.js"></script>
      <script src="../asserts/js/swiper.min.js"></script>

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
                
      <section class="header_cont" style={{ marginTop: '83px' }}>
        <div class="layout_inner layout_clearfix">
            <div class="header_cont_search">
                <div class="header_cont_search_wrap">
                    <form method="">
                        <div className="header_cont_search_option js_list_select">
                          <select value={this.state.value} onChange={this.handleChange} class="header_cont_search_option_btn js_arr_toggle">
                              <option value="data" class="header_cont_search_option_btn js_arr_toggle">전체</option>
                              <option value="data_oda" class="header_cont_search_option_btn js_arr_toggle">API데이터</option>
                              <option value="data_file" class="header_cont_search_option_btn js_arr_toggle">FILE데이터</option>
                            </select>
                          </div>
                          <input type="text" id="search_keyword" className="header_cont_search_input" />
                          <button type="submit" id onClick={this.onClickButton} className="header_cont_search_btn">
                          <span>Search</span></button>
                    </form>
                </div>
            </div>

            <div class="header_cont_count">
                <div><span>All<br/>Open Data</span><strong> <div>{this.state.fetching == false && this.state.rows[0].count}</div></strong></div>
                <div><span>New<br/>Open Data</span><strong> <div>{this.state.fetchings == false && this.state.rows4[0].count}</div></strong></div>
            </div>
            
            <div class="header_cont_notice">
              <h3 class="keyword_tit">인기 검색어</h3>
              {this.state.fetching == false &&
              <>
              <div class="swiper-container">
              {this.state.fetching == false &&
                  
                  this.popular_word(rows5, params_sub)
                }
              </div>
              <div class="header_cont_notice_pop">
                  <div class="keyword_tit">인기 검색어</div>
                  <ul>
                      <li><a href={"/src/data.html?name=" + this.state.rows5[0].search_keywords}>1.{this.state.rows5[0].search_keywords}</a></li>
                      <li><a href={"/src/data.html?name=" + this.state.rows5[1].search_keywords}>2.{this.state.rows5[1].search_keywords}</a></li>
                      <li><a href={"/src/data.html?name=" + this.state.rows5[2].search_keywords}>3.{this.state.rows5[2].search_keywords}</a></li>
                      <li><a href={"/src/data.html?name=" + this.state.rows5[3].search_keywords}>4.{this.state.rows5[3].search_keywords}</a></li>
                      <li><a href={"/src/data.html?name=" + this.state.rows5[4].search_keywords}>5.{this.state.rows5[4].search_keywords}</a></li>
                  </ul>
              </div>
              </>
              }
             </div>
              
        </div>
    </section>

      <section className="main_visual">
      {this.state.fetching == false &&
        <div className="swiper-container">
          <ul className="swiper-wrappers">
            <Swiper {...params_main}>
            <li className="swiper-slide main_visual_01">
              <div>
                <p className="tit">OpenData Market & OpenAPI 이용 안내</p>
                <p className="cont">
                  OpenAPI를 제공하는 OpenData Market의 이용 안내를 읽어보세요.
                </p>
                <a href="../src/guide.html" className="slide_btn">
                  View
                </a>
              </div>
            </li>
            <li className="swiper-slide main_visual_02">
              <div>
                <p className="tit">OpenAPI 찾아보기</p>
                <p className="cont">
                 자신에게 맞는 OpenAPI를 체계적인 분류로 나눠 놓은 OpenData Market에서 찾아보세요.
                </p>
                <a href="../src/data_oda.html" className="slide_btn">
                  View
                </a>
              </div>
            </li>
            <li className="swiper-slide main_visual_03">
              <div>
                <p className="tit">OpenData Market 공지사항</p>
                <p className="cont">
                  효율적인 OpenAPI 사용을 위해 OpenData Market의 공지사항을 읽어보세요.
                </p>
                <a href="/notice" className="slide_btn">
                  View
                </a>
              </div>
            </li>
            </Swiper>
          </ul>
          <div className="swiper-pagination" />
        </div>
        }
        {}
        
      </section>
    

         <section className="main_shortcut">
        <div className="layout_inner">
          <a onClick={this.categoryButton.bind(this,"보건의료")} className="main_shortcut_medical">
            <span>보건의료</span>
          </a>
          <a onClick={this.categoryButton.bind(this,"경제")} className="main_shortcut_economy">
            <span>경제</span>
          </a>
          <a onClick={this.categoryButton.bind(this,"문화관광")} className="main_shortcut_culture">
            <span>문화관광</span>
          </a>
          <a onClick={this.categoryButton.bind(this,"교육")} className="main_shortcut_education">
            <span>교육</span>
          </a>
          <a onClick={this.categoryButton.bind(this,"환경")} className="main_shortcut_natunal">
            <span>환경</span>
          </a>          
          <a onClick={this.categoryButton.bind(this,"공간정보")} className="main_shortcut_space">
            <span>공간정보</span>
          </a>          
          <a onClick={this.categoryButton.bind(this,"복지")} className="main_shortcut_welfare">
            <span>복지</span>
          </a>
          <a onClick={this.categoryButton.bind(this,"행정")} className="main_shortcut_admin">
            <span>행정</span>
          </a>
          <a onClick={this.categoryButton.bind(this,"식품")} className="main_shortcut_food">
            <span>식품</span>
          </a>
          <a onClick={this.categoryButton.bind(this,"농축수산")} className="main_shortcut_farming">
            <span>농축수산</span>
          </a>  
        </div>
      </section>
      
      <main className="main_index">
        <div className="layout_inner">
          <div className="main_index_banner_wrap layout_clearfix">
            <div className="main_index_banner_large">
              <h3>오픈데이터</h3>
              <a href="../src/data_oda.html">
                <img src={ require('../assets/images/main_largeBanner.jpg')} alt />
              </a>
            </div>
            <div className="main_index_banner_small swiper-container">
              <h3>인기 오픈데이터</h3>

              <div className="swiper-container">
                  {this.state.fetching == false &&
                    this.popular_data(rows6, params_popular)
                  }
              </div>

              
              <div className="swiper-pagination" />
            </div>
            {}
          </div>
          {}
          <div className="main_index_board_wrap layout_clearfix">
            <section className="main_index_board">
              <div className="main_index_board_group">
                <h3 className="main_index_board_group_text">공지사항</h3>
                <a href="/notice" className="main_index_board_link">
                  <span>More</span>
                </a>
                <table className="main_table">
                    {this.state.fetching == false && rows2
                    .map(row => {
                      return(
                        <tbody>
                           <tr><td className="title"><a href={"/notice_no/" + row.notice_no} id="notice_no">{row.notice_title}</a></td><td className="time">{row.create_time}</td></tr>
                        </tbody>
                      );
                    })                    
                    }
                </table>
                
              </div>
              {}
              <div className="main_index_board_group">
              <h3 className="main_index_board_group_text">커뮤니케이션</h3>
                <a href="/board" className="main_index_board_link">
                  <span>More</span>
                </a>
                <table className="main_table">
                {this.state.fetching == false && rows3
                    .map(row => {
                      return(
                        <tbody>
                           <tr><td className="title"><a href={"/board_no/" + row.community_no} id="board_no">{row.community_title}</a></td><td className="time">{row.create_time}</td></tr>
                        </tbody>
                      );
                    })
                    
                    }
                </table>
                
              </div>
              {}
              
            </section>
            <section className="main_index_banner">
              <a href="https://www.cloud.or.kr">
                <img src={ require('../assets/images/main_banner_01.jpg')} alt="클라우드 혁신센터" />
              </a>
              <a href="https://www.ceart.kr">
                <img
                  src={ require('../assets/images/main_banner_02.jpg')}
                  alt="클라우드 스토어 씨앗"
                />
              </a>
            </section>
          </div>
          {}
        </div>
        {}
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
              <a href="http://localhost:3001">등록하기</a>
              {/* <a href="http://182.252.131.40:3001">등록하기</a> */}
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
      </>
    </div>
    );
    
  }
  
}
export default withStyles(styles)(main);
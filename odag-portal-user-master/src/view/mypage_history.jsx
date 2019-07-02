import React from "react";

import axios from "axios";
import classNames from "classnames";

// react plugin used to create charts
import { Line, Bar } from "react-chartjs-2";

// reactstrap components
import {
  Button,
  ButtonGroup,
  Card,
  CardHeader,
  CardBody,
  CardTitle,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
  UncontrolledDropdown,
  Label,
  FormGroup,
  Input,
  Table,
  Row,
  Col,
  UncontrolledTooltip
} from "reactstrap";

import { withStyles } from "@material-ui/core/styles";
import history from "../js/history.js";
import TextField from "@material-ui/core/TextField";
import Clock from "./clock";
import MenuItem from "@material-ui/core/MenuItem";
import CardList from "../view/templates/temp_cardList";
import Sub_file_carddetail from "../view/templates/temp_sub_file_carddetail";

import CustomPaginationActionsTable from "./main_templates/coupon_table.jsx";
import { Divider } from "@material-ui/core";

import normalize from "../assets/css/normalize.css";
import font from "../assets/css/font.css";
import swiper_min from "../assets/css/swiper.min.css";

//import stylesheet from 'https://fonts.googleapis.com/css?family=Montserrat:600,700';
import styles from "../assets/css/style.css";

//import style_bak from '../assets/css/style_bak.css';
import { CopyToClipboard } from "react-copy-to-clipboard";
import config from "../js/config";
import Swiper from "react-id-swiper";

import session_nav from "./layout/session_nav";

import { findDOMNode } from 'react-dom';
import $ from "jquery";
window.$ = $;

var hoursHistory = new Array();
var hoursLabels = new Array();
var dateHistory = new Array();
var dateLabels = new Array();

let chartOptions = {
  maintainAspectRatio: false,
  legend: {
    display: false
  },
  tooltips: {
    backgroundColor: "#f5f5f5",
    titleFontColor: "#333",
    bodyFontColor: "#666",
    bodySpacing: 4,
    xPadding: 12,
    mode: "nearest",
    intersect: 0,
    position: "nearest"
  },
  responsive: true,
  scales: {
    yAxes: [
      {
        barPercentage: 1.6,
        gridLines: {
          drawBorder: false,
          color: "rgba(29,140,248,0.0)",
          zeroLineColor: "transparent"
        },
        ticks: {
          suggestedMin: 0,
          suggestedMax: hoursHistory.data,
          padding: 20,
          fontColor: "#ffffff"
        }
      }
    ],
    xAxes: [
      {
        barPercentage: 1.6,
        gridLines: {
          drawBorder: false,
          color: "rgba(29,140,248,0.1)",
          zeroLineColor: "transparent"
        },
        ticks: {
          padding: 20,
          fontColor: "#ffffff"
        }
      }
    ]
  }
};

let chartHistory = {
  data1: canvas => {
    let ctx = canvas.getContext("2d");

    let gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

    gradientStroke.addColorStop(1, "rgba(29,140,248,0.2)");
    gradientStroke.addColorStop(0.4, "rgba(29,140,248,0.0)");
    gradientStroke.addColorStop(0, "rgba(29,140,248,0)"); //blue colors

    return {
      labels: hoursLabels,
      datasets: [
        {
          label: "API 사용량",
          fill: true,
          backgroundColor: gradientStroke,
          borderColor: "#1f8ef1",
          borderWidth: 2,
          borderDash: [],
          borderDashOffset: 0.0,
          pointBackgroundColor: "#1f8ef1",
          pointBorderColor: "rgba(255,255,255,0)",
          pointHoverBackgroundColor: "#1f8ef1",
          pointBorderWidth: 20,
          pointHoverRadius: 4,
          pointHoverBorderWidth: 15,
          pointRadius: 4,
          data: hoursHistory.slice(0,24)
        }
      ]
    };
  },
  data2: canvas => {
    let ctx = canvas.getContext("2d");

    let gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

    gradientStroke.addColorStop(1, "rgba(29,140,248,0.2)");
    gradientStroke.addColorStop(0.4, "rgba(29,140,248,0.0)");
    gradientStroke.addColorStop(0, "rgba(29,140,248,0)"); //blue colors

    return {
      labels: dateLabels.slice(23,30),
      datasets: [
        {
          label: "API 사용량",
          fill: true,
          backgroundColor: gradientStroke,
          borderColor: "#1f8ef1",
          borderWidth: 2,
          borderDash: [],
          borderDashOffset: 0.0,
          pointBackgroundColor: "#1f8ef1",
          pointBorderColor: "rgba(255,255,255,0)",
          pointHoverBackgroundColor: "#1f8ef1",
          pointBorderWidth: 20,
          pointHoverRadius: 4,
          pointHoverBorderWidth: 15,
          pointRadius: 4,
          data: dateHistory.slice(23,30)
        }
      ]
    };
  },
  data3: canvas => {
    let ctx = canvas.getContext("2d");

    let gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

    gradientStroke.addColorStop(1, "rgba(29,140,248,0.2)");
    gradientStroke.addColorStop(0.4, "rgba(29,140,248,0.0)");
    gradientStroke.addColorStop(0, "rgba(29,140,248,0)"); //blue colors

    return {
      labels: dateLabels,
      datasets: [
        {
          label: "API 사용량",
          fill: true,
          backgroundColor: gradientStroke,
          borderColor: "#1f8ef1",
          borderWidth: 2,
          borderDash: [],
          borderDashOffset: 0.0,
          pointBackgroundColor: "#1f8ef1",
          pointBorderColor: "rgba(255,255,255,0)",
          pointHoverBackgroundColor: "#1f8ef1",
          pointBorderWidth: 20,
          pointHoverRadius: 4,
          pointHoverBorderWidth: 15,
          pointRadius: 4,
          data: dateHistory.slice(0,30)
        }
      ]
    };
  },
  options: chartOptions
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

class mypage_history extends React.Component {
  state = {
    name: "Cat in the Hat",
    age: 0,
    multiline: "Controlled",
    currency: "NULL",
    num_api: 0,
    historyChart: null,
    period: null,
    maxDay: 0,
    maxWeek: 0,
    maxMonth: 0,
    page: 0,
    rowsPerPage: 0,
    pagemax : 0,
    pagemap : null,
    startpage : 0,
    endpage : 0,
  };

  constructor(props) {
    super(props);
    this.state = { date: new Date() };
    this.child = React.createRef();
    this.state.age = 1000;
    this.state.textFieldValue_value = 1000;
    this.state.num_api = 0;
    this.state.historyChart = "data1";
    this.state.period = "일";
    this.state.maxDay = 0;
    this.state.maxWeek = 0;
    this.state.maxMonth = 0;
    this.state.rowsPerPage = 10;
    this.state.page = 0;
    this.state.pagemap = new Array();
    this.state.startpage = 0;
    this.state.endpage = 0;
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

  setHistoryData = (name, period) => {
    this.setState({
      historyChart: name,
      period: period
    });
  };

  handleClick = (v) => {
    this.setState({
      page: v
    });
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

  handleNextButtonClick = event => {
    if ( this.state.endpage < this.state.pagemax) {
      this.state.page += 10;
      this.state.page = parseInt(this.state.page/this.state.rowsPerPage) * this.state.rowsPerPage + 1;

      this.state.startpage = (((Math.floor(parseInt(this.state.page/10))+1)*10)-10);
      this.state.endpage = ((Math.floor(parseInt(this.state.page/10))+1)*10);

      this.state.page = this.state.startpage;
    }
  };

  _getData = async () => {
    this.setState({
      fetching: true // requesting..
    });

    var user_id = sessionStorage.getItem("user");

    var urlstring = config.serverpoint + "/usermypage/" + user_id + "/user";

    console.log(urlstring);

    await axios
      .get(urlstring)
      .then(response => {

        if(response.data == "데이터 없음"){
          alert("오픈API 신청을 먼저 해주세요")
          history.push("/src/data.html");
          // history.push("/src/mypage.html");
        }

        this.state.rows = response.data;

        console.log(this.state.rows);

        console.log('information data length = ' + response.data.length);
        console.log('information data rowsperpage = ' + this.state.rowsPerPage);
        this.state.pagemax = Math.ceil(response.data.length/this.state.rowsPerPage);
        console.log('information page = ' + this.state.pagemax);
        this.state.endpage = ((Math.floor(parseInt(this.state.page/10))+1)*10);
        for (var i=0; i<this.state.pagemax; i++) {
          this.state.pagemap.push(i);
        }

        this.setState({
          fetching: false // done!
        });
      }) // SUCCESS
      .catch(response => {
        console.log(response);
      }); // ERROR

    var urlstring2 = config.serverpoint + "/history/api/hour/"+user_id+"/success";

    console.log(urlstring2);

    await axios
        .get(urlstring2)
        .then(response2 => {

          var temp1 = response2.data;

          var date = new Date();

          date.setHours(date.getHours()-24);

          for (var i = 0; i < 24; i++) {
            var save = true;

            date.setHours(date.getHours()+1);
            hoursLabels.push(String(date.getHours())+"시");

            for (var x = 0; x < temp1.length; x++) {
              var date2 = new Date(temp1[x]["date"]);
              if (date.getHours() == date2.getHours() && date.getDate() == date2.getDate()) {
                hoursHistory.push(temp1[x]["cnt"]);
                this.state.maxDay = this.state.maxDay + temp1[x]["cnt"];
                save = false;
              } else {
                if (x == temp1.length-1 && save == true) {
                  hoursHistory.push(0);
                  save = true;
                }
              }
            }
          }

          this.setState({
            fetching: false // done!
          });
        }) // SUCCESS
        .catch(response2 => {
          console.log(response2);
        }); // ERROR

    var urlstring3 = config.serverpoint + "/history/api/date/"+user_id+"/success";

    console.log(urlstring3);

    await axios
        .get(urlstring3)
        .then(response3 => {

          var temp2 = response3.data;

          var date = new Date();

          date.setDate(date.getDate()-30);

          for (var i = 0; i < 30; i++) {
            var save = true;

            date.setDate(date.getDate()+1);
            dateLabels.push(String(date.getDate())+"일");

            for (var x = 0; x < temp2.length; x++) {
              var date2 = new Date(temp2[x]["date"]);
              if (date.getDate() == date2.getDate() && date.getMonth() == date2.getMonth()) {
                dateHistory.push(temp2[x]["cnt"]);
                this.state.maxMonth = this.state.maxMonth + temp2[x]["cnt"];
                if (i > 23) {
                  this.state.maxWeek = this.state.maxWeek + temp2[x]["cnt"];
                }
                save = false;
              } else {
                if (x == temp2.length-1 && save == true) {
                  dateHistory.push(0);
                  save = true;
                }
              }
            }
          }

          this.setState({
            fetching: false // done!
          });
        }) // SUCCESS
        .catch(response3 => {
          console.log(response3);
        }); // ERROR
  };



  render() {
    if (sessionStorage.getItem("user")) {
    } else {
      history.push("/login");
    }

    const { classes } = this.props;
    const { rows, rowsPerPage, page } = this.state;

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
                    <li class="header_nav_menu2"><a href="/notice">정보공유</a>
                        <div class="header_nav_menu_sub js_nav_menu">
                            <a href="/notice">공지사항</a>
                            <a href="/board">자유게시판</a>
                            <a href="/request">API 요청 게시판</a>
                        </div>
                    </li>
                    {sessionStorage.getItem("user") &&
                    <li class="on"><a href="../src/mypage.html">마이페이지</a>
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

        <section
          className="sub_nav"
          style={{ marginTop: "80px", marginBottom: "0px" }}
        >
          <h2>마이페이지</h2>
          <div className="sub_nav_menu">
            <a href="/src/mypage.html">나의 오픈 API</a>
            <a href="/src/mypage_history.html" className="on2">
              나의 사용이력
            </a>
            <a href="/src/mypage_favorites.html">즐겨찾기</a>
          </div>
        </section>

        <main className="main_sub">
          <div className="layout_inner layout_clearfix">
            <div className="layout_sub_side">
              <h2>마이페이지</h2>
              <div className="sub_nav_menu">
                <a href="/src/mypage.html">나의 오픈 API</a>
                <a href="/src/mypage_history.html" className="on2">
                  나의 사용이력
                </a>
                <a href="/src/mypage_favorites.html">즐겨찾기</a>
              </div>
            </div>

            <div className="layout_sub_cont">

            { this.state.fetching == true &&
            <div class="cont_msg">
              <div className="cont_msg_inner"><span class="ico_notice">등록된 Open API가 없습니다. Open API를 신청해주세요.</span>
              </div>
            </div>
          }

            { this.state.fetching == false &&
              <div className="cont_mypage_history">
                <div className="cont_history_summary">
                  <div className="cont_history_summary_count">
                    <div className="head">사용</div>
                    {
                      this.state.fetching == false && (
                        <div className="body">
                          <strong className="count">
                            {this.state.rows.length}
                          </strong>
                          <p>사용 신청 완료된 API 개수</p>
                          <strong className="count">
                            {this.state.period == "일" && (this.state.maxDay)}
                            {this.state.period == "주" && (this.state.maxWeek)}
                            {this.state.period == "월" && (this.state.maxMonth)}
                          </strong>
                          <p>{this.state.period}간 총 API 사용량</p>
                        </div>
                      )
                    }

                  </div>
                  <div className="cont_history_summary_graph">
                    <div className="head">사용량</div>

                    <Card className="card-chart">
                      <CardHeader>
                        <Row>
                          <Col className="text-left" sm="6">
                            <CardTitle tag="h2">시간별 사용량</CardTitle>
                          </Col>
                          <Col sm="6">
                            <ButtonGroup
                                className="btn-group-toggle float-right"
                                data-toggle="buttons"
                            >
                              <Button
                                  tag="label"
                                  className={classNames("btn-simple", {
                                    active: this.state.historyChart === "data1"
                                  })}
                                  color="info"
                                  id="0"
                                  size="sm"
                                  onClick={() => this.setHistoryData("data1", "일")}
                              >
                                <input
                                    defaultChecked
                                    className="d-none"
                                    name="options"
                                    type="radio"
                                />
                                <span className="d-none d-sm-block d-md-block d-lg-block d-xl-block">
                                  일
                                </span>
                                <span className="d-block d-sm-none">
                                  <i className="tim-icons icon-single-02" />
                                </span>
                              </Button>
                              <Button
                                  color="info"
                                  id="1"
                                  size="sm"
                                  tag="label"
                                  className={classNames("btn-simple", {
                                    active: this.state.historyChart === "data2"
                                  })}
                                  onClick={() => this.setHistoryData("data2","주")}
                              >
                                <input
                                    className="d-none"
                                    name="options"
                                    type="radio"
                                />
                                <span className="d-none d-sm-block d-md-block d-lg-block d-xl-block">
                                  주
                                </span>
                                <span className="d-block d-sm-none">
                                  <i className="tim-icons icon-gift-2" />
                                </span>
                              </Button>
                              <Button
                                  color="info"
                                  id="2"
                                  size="sm"
                                  tag="label"
                                  className={classNames("btn-simple", {
                                    active: this.state.historyChart === "data3"
                                  })}
                                  onClick={() => this.setHistoryData("data3", "월")}
                              >
                                <input
                                    className="d-none"
                                    name="options"
                                    type="radio"
                                />
                                <span className="d-none d-sm-block d-md-block d-lg-block d-xl-block">
                                  월
                                </span>
                                <span className="d-block d-sm-none">
                                  <i className="tim-icons icon-tap-02" />
                                </span>
                              </Button>
                            </ButtonGroup>
                          </Col>
                        </Row>
                      </CardHeader>
                      <CardBody>
                        <div className="chart-area">
                          {this.state.fetching == false && (
                            <Line
                                data={chartHistory[this.state.historyChart]}
                                options={chartHistory.options}
                            />
                          )}
                        </div>
                      </CardBody>
                    </Card>
                  </div>
                </div>
              </div>
              }
              {this.state.fetching == false && 
              <>
                <table className="tb_mypage_list tb_mypage_list_detail">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>오픈 데이터 API 이름</th>
                      <th>활동 유형</th>
                      <th>URL</th>
                      <th>결과 형태</th>
                      <th>오픈데이터 제공처</th>
                      <th>상세 보기</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                    {this.state.fetching == false && 
                      this.state.rows
                        .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
                        .map((row, index) => {
                      return (

                        <>
                        <tr>
                          <td>{index + 1}</td>

                          <td>
                            {/* <a href="mypage_detail.html"> */}
                            {row.name}
                            {/* </a> */}
                          </td>
                          <td>{row.activity_type}</td>
                          <td>
                            <a href={row.openapi_join_url} target="_blank">
                              {row.openapi_join_url.length > 50 &&
                                row.openapi_join_url.substring(0, 50) + "..."}
                              {row.openapi_join_url.length <= 50 &&
                                row.openapi_join_url}
                            </a>
                          </td>
                          <td> {row.resulttype}</td>
                          <td>{row.provider}</td>
                          <td>
                            <button
                              type="button"
                              className="btn_mypage_list js_tbopen_btn"
                              id={"viewButton_"+(index+1)}
                              onClick={() => document.getElementById("view"+(index+1)).style.display = null}
                            >
                              보기
                            </button>
                          </td>
                        </tr>
                          <tr id={"view"+(index+1)} style={{ display: "none"}}>
                          <td colSpan="8" className="td_inner_wrap">
                            <div className="cont_mypage_detail_inner">
                              <button
                                  type="button"
                                  className="btn_mypage_list_close js_tbclose_btn"
                                  id={"closeButton_"+(index+1)}
                                  onClick={() => document.getElementById("view"+(index+1)).style.display = "none"}
                              >
                                닫기
                              </button>
                              <div className="cont_mypage_detail_inner_tit"></div>
                              <table className="tb_mypage_detail_inner">
                                <tr>
                                  <th>오픈데이터 API 이름</th>
                                  <td>{row.name}</td>
                                  <th>활동 유형</th>
                                  <td>{row.activity_type}</td>
                                </tr>
                                <tr>
                                  <th>오픈데이터 제공처</th>
                                  <td>{row.provider}</td>
                                  <th>결과 형태</th>
                                  <td>{row.resulttype}</td>
                                </tr>
                                <tr>
                                  <th>데이터 신청일</th>
                                  <td>{row.update_time}</td>
                                  <th>데이터 사용량</th>
                                  <td>
                                    {row.points == null && ("0/1000건")}
                                    {row.points != null && (row.points+"/1000건")}
                                  </td>
                                </tr>
                                <tr>
                                  <th>URL</th>
                                  <td colSpan={"3"}>{row.openapi_join_url}</td>
                                </tr>
                                <tr>
                                  <th>설명</th>
                                  <td colSpan={"3"}>{row.comment}</td>
                                </tr>
                              </table>
                            </div>
                          </td>
                        </tr>
                    </>
                  )


                    })}
                    
                  </tbody>
                </table>
              

              <div className="cont_board_pagenation">
                <a href="#" className="cont_board_pagenation_btn prev"  onClick={this.handleBackButtonClick}></a>
                {
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
              </>
              }
              {/* //cont_board_pagenation */}
            </div>
            {/* //layout_sub_cont */}
          </div>
          {/* //layout_inner */}
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
          {/* //footer_cont */}
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
            {/* //layout_inner */}
          </div>
          {/* //footer_address */}
        </footer>
      </div>
    );
  }
}
export default withStyles(styles)(mypage_history);

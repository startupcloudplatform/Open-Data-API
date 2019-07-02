import React from 'react';
import PropTypes from 'prop-types';
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import FormControl from '@material-ui/core/FormControl';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import LockIcon from '@material-ui/icons/LockOutlined';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import withStyles from '@material-ui/core/styles/withStyles';
import Grid from '@material-ui/core/Grid';

import CardContent from '@material-ui/core/CardContent';

import cookie from 'react-cookies'

import axios from "axios";

import history from '../js/history';
import config  from "../js/config.js";

var crypto = require("crypto");


const styles = theme => ({
  main: {
    width: 'auto',
    display: 'block', // Fix IE 11 issue.
    marginLeft: theme.spacing.unit * 3,
    marginRight: theme.spacing.unit * 3,
    [theme.breakpoints.up(400 + theme.spacing.unit * 3 * 2)]: {
      width: 400,
      marginLeft: 'auto',
      marginRight: 'auto',
    },
  },
  paper: {
    marginTop: theme.spacing.unit * 8,
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    padding: `${theme.spacing.unit * 2}px ${theme.spacing.unit * 3}px ${theme.spacing.unit * 3}px`,
  },
  avatar: {
    margin: theme.spacing.unit,
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: '100%', // Fix IE 11 issue.
    marginTop: theme.spacing.unit,
  },
  submit: {
    marginTop: theme.spacing.unit,
    width: 'auto',
    alignItems: 'center',
    justifyContent: 'center',
    marginLeft: 2,
    marginRight: 2,
  },
});

class Login extends React.Component 
{  

  handleLoginButtonClick = async () => {
    
    var id = document.getElementById("email").value;
    var passwd = document.getElementById("password").value;

    var new_passwd = null;

    if (passwd !== null) {
      var hashPassword = crypto.createHash("sha256").update(passwd).digest("hex");

      new_passwd = Buffer.from(hashPassword).toString('base64');

      console.log(new_passwd);
    }

    var urlstring = config.serverpoint + '/login';

    await axios.post(urlstring, {
      user_id: id,
      user_pw: new_passwd
    })
        .then(response => 
        {
            // console.log(response.data);

            if (response.data == "로그인 성공") {
              sessionStorage.setItem("user", id);
              history.push('/');                  
            }
            else {
              history.push("/login");
              window.location.reload();
              console.log("로그인 실패 = ");
            }            

        }) // SUCCESS
        .catch(response => { 
          // console.log(response); 
        }); // ERROR
  };

  enterCheck = (e) => {
    if (e.keyCode === 13) {
      e.preventDefault();
      e.stopPropagation();
      this.handleLoginButtonClick();
    }
  }

  handleLogoutButtonClick = event => {
    sessionStorage.clear();
    history.push("/");
  };

  onLogout() {
    cookie.remove('admin', { path: '/' })
    console.log("aaa " + cookie.load('admin'))
  }

  render() 
  {
      const { classes, theme } = this.props;

      sessionStorage.clear();
      this.onLogout();

      return (
      
<main className="body_membership">

        <a href="/main" className="home">
           <img src={ require('../assets/images/header_logo.png')} alt="Cloudit" />
        </a>

      <div className="logo"><img src={ require("../assets/images/membership_tit.png")} alt="Open Data Market"></img></div>
      <div className="logo2"><img src={ require("../assets/images/footer_logo.png")} alt="nipa 정보통신산업진흥원"></img></div>
      <div className="logo3"><img src={ require("../assets/images/logo3.png")} alt="과학기술정보통신부"></img></div>
        <CssBaseline />

        <Paper className="class_paper">
        
          
          <form className="class_form">
          <div className="signdiv"> 포털 로그인 <span className="sign">Portal Login</span></div>
            
          <section>
            <div class="membership_txt">Open Data Market에 오신 것을 환영합니다.<br/>           
            일반(개인) 사용자 또는 개발자는 일반(개인) 로그인을 <br/>
            기관회원 또는 제공처는 기관 로그인을 해주세요. <br/>
           
            </div>
            </section>

             <Grid container spacing={24}>
                     <CardContent className="cardcontents">                     
                
                            <strong className="tits">
                            일반(개인) 회원</strong>  
                            <Grid container spacing={12}>
                            <Grid item xs={6} sm={2}></Grid>
                          <img 
                  src={ require('../assets/images/membership_developer.png')}
                  alt="Cloudit" />
                        <Grid item xs={6} sm={4}></Grid>
                          <a href="/login_developer" class="btn_confirm">
                            로그인하기
                          </a>
                          </Grid>
                      </CardContent>

                      <Grid item xs={6} sm={1}></Grid>
                  <CardContent className="cardcontents">

                      <strong className="tits">
                      기관(제공처) 회원</strong>         
                      <Grid container spacing={12}>                    
                    <Grid item xs={6} sm={2}></Grid>
                    <img 
                  src={ require('../assets/images/membership_provider.png')}
                  alt="Cloudit" />
                  <Grid item xs={6} sm={4}></Grid>
                    <a href="http://127.0.0.1:3001/login" class="btn_confirm2">
                    {/* <a href="http://182.252.131.40:3001/login" class="btn_confirm2"> */}
                    로그인하기
                    </a>
                  </Grid>
                  </CardContent>

                  </Grid>
          </form>
        </Paper>
      </main>
    );
  }
}


Login.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(Login);
import React from "react";
import style from './style.css';
import "./../App.css";

class LoginPage extends React.Component {
  constructor(props) { 
    super(props); 
    this.state = { email: "" , password: ""}; 
  } 


handleLogIn() {
  
   fetch("http://localhost:59464/login", { 
      method: "POST", 
      headers: { 
        Accept: "application/json", 
        "Content-Type": "application/json; charset=UTF-8" 
      }, 
      body: JSON.stringify({ 
        email: this.state.email, 
        password: this.state.password 
      }) 
    })
      .then(Response => Response.json()) 
      .then(data => { 
        if(data == null){ 
          alert('Wrong email or password')
        }else{ 
          this.props.loggedIn(data); 
          this.props.chosenPage("profile");
        } 
      }) 
  }; 
  handleLogOut(){
    this.props.chosenPage("login")
  }
  render() {
    return (
      <div>
    <link href="https://fonts.googleapis.com/css?family=Pridi&display=swap" rel="stylesheet"></link>
    <link rel="stylesheet" href="https://d1azc1qln24ryf.cloudfront.net/114779/Socicon/style-cf.css?rd5re8"></link>   
    <link rel="stylesheet" href={style}></link>
  <body>
      <nav>
        <div class="logo">
          <h4>FILMSTADEN</h4>
        </div>
        <ul class="nav-links">
          <li><div  onClick={() => this.props.chosenPage("home")}>Start</div></li>
          <li><div onClick={() => this.props.chosenPage("movies")}>Filmer</div></li>
          {!this.props.logain ? (
          <li><div onClick={() => this.props.chosenPage("login")}>Logga in</div></li>
          ) : (
            <div/>
          )}
          {this.props.logain ? (
          <li><div onClick={() => this.props.chosenPage("profile")}>Profil</div></li>
          ) : (
            <div/>
          )}
          {this.props.logain ? (
          <li><div onClick={() => this.props.loggedIn({})}>Logga ut</div></li>
            ) : (
              <div/>
            )}
      </ul>
    </nav>
    <div style={{display: 'flex',  justifyContent:'center', alignItems:'center', height: '100vh'}}>
      <div className="signin">
        <form id="loginForm" >
          <h2 style={style}>Gå till Mina Sidor</h2><br/>

          <input type="Email" name="username" placeholder="E-post" value={this.state.email} onChange={e => this.setState({ email: e.target.value })}/><br/><br/> 

          <input type="password" name="password" placeholder="Lösenord" value={this.state.password} onChange={e => this.setState({ password: e.target.value })}/><br/><br/><br/> 

          <input className="btn" type="button" value="Logga in" onClick={() => this.handleLogIn(this.state.email, this.state.password)} /><br/><br/><br/> 

          <div id="container">
              <div onClick={() => this.props.chosenPage("forgot")} style={{marginright: '0px', fontsize: '16px', fontfamily:'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'}}>Glömt lösenord?</div>
          </div><br/><br/>
          <p>Inte medlem?<div onClick={() => this.props.chosenPage("registration")} style={{padding: '5px', fontsize: '16px'}}>&nbsp;Registrera</div></p><br/><br/>
        </form>
      </div>
    </div>
  </body>
</div>
);
  }
}

export default LoginPage;





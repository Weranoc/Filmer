import React from "react";
import login from './login.css';
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

          <nav>
                  <div className="logo">
                  <h4>FILMSTADEN</h4>
                  </div>
              <ul className="nav-links">
                  <li><a /*href="home"*/ onClick={() => this.props.chosenPage("home")}>Start</a></li>
                  <li><a /*href="movies"*/ onClick={() => this.props.chosenPage("movies")}>Filmer</a></li>
                  {/*this.state.loggedIn === null? (
                  <li><a href="login" onClick={() => this.props.chosenPage("login")}>Logga in</a></li>
                  ) : (
                  <li><a href="login" onClick={this.handleLogOut()}>Logga ut</a></li>
                  )*/}
              </ul>
              </nav>

              <div className="signin">
                  <form id="loginForm">
                  <h2 style={login}>Gå till Mina Sidor</h2><br/>

                  <input type="Email" name="username" placeholder="E-post" value={this.state.email} onChange={e => this.setState({ email: e.target.value })}/><br/><br/> 
  
                  <input type="password" name="password" placeholder="Lösenord" value={this.state.password} onChange={e => this.setState({ password: e.target.value })}/><br/><br/><br/> 
  
                  <input className="btn" type="button" value="Logga in" onClick={() => this.handleLogIn(this.state.email, this.state.password)} /><br/><br/><br/> 
  
                  <div id="container">
                      <a /*href="forgot"*/ onClick={() => this.props.chosenPage("forgot")} style={{marginright: '0px', fontsize: '16px', fontfamily:'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'}}>Glömt lösenord?</a>

                  </div><br/><br/>
                  <p>Inte medlem?<a /*href="registration"*/ onClick={() => this.props.chosenPage("registration")} style={{padding: '5px', fontsize: '16px'}}>&nbsp;Registrera</a></p><br/><br/>

                  {/*Removed for function to go back to previous page not yet created*/}
                  {/*<a href="login" onClick={() => this.props.chosenPage("login")} style={{fontfamily: 'Arial, Helvetica, sans-serif'}}>Tillbaka</a> */}
                  </form>
              </div>

      </div>
);
  }
}

export default LoginPage;
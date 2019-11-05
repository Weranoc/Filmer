import React from "react";
import style from './style.css';
import "./../App.css";

class registrationPage extends React.Component {
  constructor(props) { 
    super(props); 
    var today = new Date(); 
    var dd = String(today.getDate()).padStart(2, '0'); 
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0! 
    var yyyy = today.getFullYear(); 
 
    today = mm + '/' + dd + '/' + yyyy; 
    this.state = { email: "" , password: "", firstName: "", lastName: "", phoneNumber: "", joinDate: today, admin: "member"}; 
  } 
 
  handleClick = () => { 
    fetch("http://localhost:59464/api/Members", { 
      method: "POST", 
      headers: { 
        Accept: "application/json", 
        "Content-Type": "application/json; charset=UTF-8" 
      }, 
      body: JSON.stringify({ 
        email: this.state.email, 
        password: this.state.password, 
        firstName: this.state.firstName, 
        lastName: this.state.lastName, 
        phoneNumber: this.state.phoneNumber, 
        joinDate: this.state.joinDate, 
        admin: this.state.admin 
      }) 
    }).then(Response => { 
        console.log('registatrion res', Response) 
    }).catch(error => { 
        console.log('regostration error', error) 
    }) 
  };
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
          <li><div onClick={() => this.props.chosenPage("home")}>Start</div></li>
          <li><div onClick={() => this.props.chosenPage("movies")}>Filmer</div></li>
          <li><div onClick={() => this.props.chosenPage("login")}>Logga in</div></li>
      </ul>
    </nav>
    <div style={{display: 'flex',  justifyContent:'center', alignItems:'center', height: '100vh'}}>
      <div class="signin">
        <form>
          <h2 style={style}>Registrera medlem</h2><br/>
          <input type="text" name="username" placeholder="Förnamn" value={this.state.firstName} onChange={e => this.setState({ firstName: e.target.value })}></input><br/><br/>

          <input type="text" name="username" placeholder="Efternamn" value={this.state.lastName} onChange={e => this.setState({ lastName: e.target.value })}></input><br/><br/>

          <input type="text" name="username" placeholder="E-post" value={this.state.email} onChange={e => this.setState({ email: e.target.value })}></input><br/><br/> 

          <input type="password" name="password" placeholder="Välj lösenord" value={this.state.password} onChange={e => this.setState({ password: e.target.value })}></input><br/><br/><br/> 

          <input class="btn" type="button" value="Bli medlem" onClick={() => this.handleClick()}></input><br/><br/><br/> 

          <div id="container">
            <p>Redan medlem?<div onClick={() => this.props.chosenPage("login")}>&nbsp;Logga in</div></p><br/><br/>
          </div>
        </form>
      </div>
    </div>
  </body>
</div>
);
  }
}

export default registrationPage;
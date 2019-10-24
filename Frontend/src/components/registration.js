import React from "react";
import login from './login.css';
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

        <html lang="en">
<head>
    <meta charset="UTF-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"></meta>
    <link href="https://fonts.googleapis.com/css?family=Pridi&display=swap" rel="stylesheet"></link>
    <link rel="stylesheet" href={login}></link>
    <link href="https://fonts.googleapis.com/css?family=Play&display=swap" rel="stylesheet"></link>

    <title>Register</title>
</head>
<body>

<nav>
                <div class="logo">
                <h4>FILMSTADEN</h4>
                </div>
            <ul class="nav-links">
                <li><a href="index">Start</a></li>
                <li><a href="currentmovies">Aktuella filmer</a></li>
                <li><a href="comingmovies">Kommande filmer</a></li>
                <li><a href="login">Logga in</a></li>
            </ul>
         </nav>

         <div class="signin">
                <form>
                    <h2 style={login}>Registrera medlem</h2><br></br>

                    <input type="text" name="username" placeholder="Förnamn" value={this.state.firstName} onChange={e => this.setState({ firstName: e.target.value })}></input><br></br><br></br>

                    <input type="text" name="username" placeholder="Efternamn" value={this.state.lastName} onChange={e => this.setState({ lastName: e.target.value })}></input><br></br><br></br>

                    <input type="text" name="username" placeholder="E-post" value={this.state.email} onChange={e => this.setState({ email: e.target.value })}></input><br></br><br></br>

                    <input type="password" name="password" placeholder="Välj lösenord" value={this.state.password} onChange={e => this.setState({ password: e.target.value })}></input><br></br><br></br><br></br>

                    <input class="btn" type="button" value="Bli medlem" onClick={() => this.handleClick()}></input><br></br><br></br><br></br>
                    
                    <div id="container">
                            <p>Redan medlem?<a href="login" style={login}>&nbsp;Logga in</a></p><br></br><br></br>

                            <a id="back" href="index" style={login}>Tillbaka</a> 
                    </div>
                </form>
            </div>

    </body>
    </html>
);
  }
}

export default registrationPage;
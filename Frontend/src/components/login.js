import React from "react";
import login from './login.css';
import login2 from './login2.css';
import "./../App.css";

class LoginPage extends React.Component {
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

        <title>Loggain</title>
    </head>
    <body>

        <nav>
                <div class="logo">
                <h4>FILMSTADEN</h4>
                </div>
            <ul class="nav-links">
                <li><a href="index.html">Start</a></li>
                <li><a href="currentmovies.html">Aktuella filmer</a></li>
                <li><a href="comingmovies.html">Kommande filmer</a></li>
                <li><a href="login.html">Logga in</a></li>
            </ul>
            </nav>

            <div class="signin">
                <form>
                    <h2 style={login2}>Gå till Mina Sidor</h2><br></br>

                    <input type="text" name="username" placeholder="E-post"></input><br></br><br></br>

                    <input type="password" name="password" placeholder="Lösenord"></input><br></br><br></br>

                    <a href="signedin.html"><input class="btn" type="button" value="Logga in"></input></a><br></br><br></br><br></br>
                    
                    <div id="container">
                        <a href="forgot.html" style={login2}>Glömt lösenord?</a>

                    </div>
                    <p>Inte medlem?<a href="signup.html" style={login2}>&nbsp;Registrera</a></p><br></br><br></br>
                    
                    <a id="back" href="index" style={login2}>Tillbaka</a> 
                </form>
            </div>

    </body>
    </html>
);
  }
}

export default LoginPage;
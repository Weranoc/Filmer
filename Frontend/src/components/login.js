import React from "react";
import login from './login.css';
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
                <li><a href="index">Start</a></li>
                <li><a href="currentmovies">Aktuella filmer</a></li>
                <li><a href="comingmovies">Kommande filmer</a></li>
                <li><a href="login">Logga in</a></li>
            </ul>
            </nav>

            <div class="signin">
                <form id="loginForm">
                <h2 style={login}>Gå till Mina Sidor</h2><br/>

                <input type="text" name="username" placeholder="E-post"/><br/><br/>

                <input type="password" name="password" placeholder="Lösenord"/><br/><br/><br/>

                <a href="signedin"><input class="btn" type="button" value="Logga in"/></a><br/><br/><br/>

                <div id="container">
                    <a href="forgot" style={{marginright: '0px', fontsize: '16px', fontfamily:'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'}}>Glömt lösenord?</a>

                </div><br/><br/>
                <p>Inte medlem?<a href="registration" style={{padding: '5px', fontsize: '16px'}}>&nbsp;Registrera</a></p><br/><br/>

                <a href="index" style={{fontfamily: 'Arial, Helvetica, sans-serif'}}>Tillbaka</a> 
                </form>
            </div>

    </body>
    </html>
);
  }
}

export default LoginPage;
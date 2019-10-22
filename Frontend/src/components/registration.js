import React from "react";
import registration from './registration.css';
import registration2 from './registration2.css';
import "./../App.css";

class registrationPage extends React.Component {
  render() {
    return (

        <html lang="en">
<head>
    <meta charset="UTF-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"></meta>
    <link href="https://fonts.googleapis.com/css?family=Pridi&display=swap" rel="stylesheet"></link>
    <link rel="stylesheet" href={registration}></link>
    <link href="https://fonts.googleapis.com/css?family=Play&display=swap" rel="stylesheet"></link>

    <title>Register</title>
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
                    <h2 style={registration2}>Registrera medlem</h2><br></br>

                    <input type="text" name="username" placeholder="Förnamn"></input><br></br><br></br>

                    <input type="text" name="username" placeholder="Efternamn"></input><br></br><br></br>

                    <input type="text" name="username" placeholder="E-post"></input><br></br><br></br>

                    <input type="password" name="password" placeholder="Välj lösenord"></input><br></br><br></br><br></br>

                    <input class="btn" type="button" value="Bli medlem"></input><br></br><br></br><br></br>
                    
                    <div id="container">
                            <p>Redan medlem?<a href="login" style={registration2}>&nbsp;Logga in</a></p><br></br><br></br>

                            <a id="back" href="index" style={registration2}>Tillbaka</a> 
                    </div>
                </form>
            </div>

    </body>
    </html>
);
  }
}

export default registrationPage;
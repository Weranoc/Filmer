import React from 'react';
import style from './style.css';

class index extends React.Component {

    render() {
    
  return (
<html lang="en">
  <head>
    <meta charset="UTF-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"></meta>
    <link href="https://fonts.googleapis.com/css?family=Pridi&display=swap" rel="stylesheet"></link>
    <link rel="stylesheet" href="https://d1azc1qln24ryf.cloudfront.net/114779/Socicon/style-cf.css?rd5re8"></link>   
    <link rel="stylesheet" href={style}></link>

    <title>Start</title>
  </head>

<body>
    
        <nav>
            <div class="logo">
            <h4>FILMSTADEN</h4>
            </div>
        <ul class="nav-links">
            <li><a href="index">Start</a></li>
            <li><a href="currentmovies.js">Aktuella filmer</a></li>
            <li><a href="comingmovies.html">Kommande filmer</a></li>
            <li><a href="login">Logga in</a></li>
        </ul>
    </nav>

    <div class="maindiv"></div>

</body>
<footer id="footer">
        <ul class="socicons-list">
                <li>
                  <a href='https://www.facebook.com/FilmstadenAB/'><span class="socicon-facebook"></span></a> 
                </li>
                  <li>
                  <a href='https://www.instagram.com/filmstaden_ab/'><span class="socicon-instagram"></span></a> 
                </li> 
                <li>
                  <a href='https://twitter.com/filmstadenab'><span class="socicon-twitter"></span></a> 
                </li> 
            </ul>
</footer>

</html>
  );
}
}

export default index;

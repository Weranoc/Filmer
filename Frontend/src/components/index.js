import React from 'react';
import style from './style.css';

class index extends React.Component {
  constructor(props) { 
    super(props);
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
            <li><a /*href="home"*/  onClick={() => this.props.chosenPage("home")}>Start</a></li>
            <li><a /*href="movies"*/ onClick={() => this.props.chosenPage("movies")}>Filmer</a></li>
            {!this.props.logain ? (
            <li><a /*href="login"*/ onClick={() => this.props.chosenPage("login")}>Logga in</a></li>
            ) : (
              <div/>
            )}
            {this.props.logain ? (
            <li><a onClick={() => this.props.loggedIn({})}>Logga ut</a></li>
              ) : (
                <div/>
              )}
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
</div>
  );
}
}

export default index;

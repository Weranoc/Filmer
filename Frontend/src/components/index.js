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
            <li><div /*href="home"*/  onClick={() => this.props.chosenPage("home")}>Start</div></li>
            <li><div /*href="movies"*/ onClick={() => this.props.chosenPage("movies")}>Filmer</div></li>
            {!this.props.logain ? (
            <li><div /*href="login"*/ onClick={() => this.props.chosenPage("login")}>Logga in</div></li>
            ) : (
              <div/>
            )}
            {this.props.logain ? (
          <li><div /*href="login"*/ onClick={() => this.props.chosenPage("profile")}>Profil</div></li>
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

    <div class="maindiv"></div>

</body>
<footer id="footer">
        <ul class="socicons-list">
                <li>
                  <div href='https://www.facebook.com/FilmstadenAB/'><span class="socicon-facebook"></span></div> 
                </li>
                  <li>
                  <div href='https://www.instagram.com/filmstaden_ab/'><span class="socicon-instagram"></span></div> 
                </li> 
                <li>
                  <div href='https://twitter.com/filmstadenab'><span class="socicon-twitter"></span></div> 
                </li> 
            </ul>
</footer>
</div>
  );
}
}

export default index;

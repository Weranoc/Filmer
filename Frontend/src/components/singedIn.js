import React from "react";
import login from './login.css';
import "./../App.css";
import Viewings from './Viewings'

class profilePage extends React.Component {
  constructor(props) { 
    super(props); 
    this.state = { };
    }
    render() {
        return (
            <div>
                    <meta charSet="UTF-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <meta httpEquiv="X-UA-Compatible" content="ie=edge"/>
                    <link href="https://fonts.googleapis.com/css?family=Pridi&display=swap" rel="stylesheet"/>
                    <link rel="stylesheet" href={login}/>
                    <link href="https://fonts.googleapis.com/css?family=Play&display=swap" rel="stylesheet"/>

                    <title>Min sida</title>
                        <nav>
                                <div class="logo">
                                <h4>FILMSTADEN</h4>
                                </div>
                            <ul class="nav-links">
                                <li><a /*href="home"*/ onClick={() => this.props.chosenPage("home")}>Start</a></li>
                                <li><a /*href="movies"*/ onClick={() => this.props.chosenPage("movies")}>Filmer</a></li>
                                <li><a /*href="login"*/ onClick={() => this.props.chosenPage("login")}>Logga ut</a></li>
                            </ul>
                        </nav>

                        <div class="signin">
                                <form>
                                    <h2 style={{color: 'rgb(226, 226, 226)', letterspacing: '3px', fontsize: '20px', fontfamily: 'Pridi, serif'}}>Min profil</h2><Viewings signInToken={this.props.memberToken}/><br/><br/>
                                </form>
                            </div>
            </div>
        );
    }
}
export default profilePage;
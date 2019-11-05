import React from "react";
import style from './style.css';
import "./../App.css";
import Viewings from './Viewings'

class profilePage extends React.Component {
  constructor(props) { 
    super(props); 
    this.state = { };
    }
    handleLogOut(){
        this.props.loggedIn({})
        this.props.chosenPage("login")
    }
    render() {
        return (
            <div>
                <meta charSet="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta httpEquiv="X-UA-Compatible" content="ie=edge"/>
                <link href="https://fonts.googleapis.com/css?family=Pridi&display=swap" rel="stylesheet"/>
                <link rel="stylesheet" href={style}/>
                <link href="https://fonts.googleapis.com/css?family=Play&display=swap" rel="stylesheet"/>

                <title>Min sida</title>
                <nav>
                    <div class="logo">
                        <h4>FILMSTADEN</h4>
                    </div>
                    <ul class="nav-links">
                        <li><div onClick={() => this.props.chosenPage("home")}>Start</div></li>
                        <li><div onClick={() => this.props.chosenPage("movies")}>Filmer</div></li>
                        <li><div onClick={() => this.handleLogOut()}>Logga ut</div></li>
                    </ul>
                </nav>
                <div style={{display: 'flex',  justifyContent:'center', alignItems:'center', height: '100vh'}}>
                    <div class="signin">
                        <form>
                            <h2 style={{color: 'rgb(226, 226, 226)', letterspacing: '3px', fontsize: '20px', fontfamily: 'Pridi, serif'}}>Min profil</h2>
                            <Viewings signInToken={this.props.memberToken} page={this.props.chosenPage} movieItem={this.props.movieItems} ticket={this.props.tickets}/><br/><br/>
                        </form>
                    </div>
                </div>
            </div>
        );
    }
}
export default profilePage;
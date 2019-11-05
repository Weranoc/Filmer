import React, { Component } from "react";
import login from './login.css';

class TestPage extends Component {
  constructor(props) {
    super(props);
    }
    handleLogOut(){
        this.props.loggedIn({})
        this.props.chosenPage("login")
    }
    render(){
        return(
            <div>
                <meta charSet="UTF-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <meta httpEquiv="X-UA-Compatible" content="ie=edge"/>
                    <link href="https://fonts.googleapis.com/css?family=Pridi&display=swap" rel="stylesheet"/>
                    <link rel="stylesheet" href={login}/>
                    <link href="https://fonts.googleapis.com/css?family=Play&display=swap" rel="stylesheet"/>

                    <title></title>
                    <nav>
                            <div class="logo">
                            <h4>FILMSTADEN</h4>
                            </div>
                        <ul class="nav-links">
                            <li><a /*href="home"*/ onClick={() => this.props.chosenPage("home")}>Start</a></li>
                            <li><a /*href="movies"*/ onClick={() => this.props.chosenPage("movies")}>Filmer</a></li>
                            <li><a /*href="login"*/ onClick={() => this.handleLogOut()}>Logga ut</a></li>
                        </ul>
                    </nav>
                    <div class="signin">
                        <form>
                            <div>
                                {this.props.movieItems.Id}. {this.props.movieItems.ViewingDate} - {this.props.movieItems.MovieName} (
                                {this.props.movieItems.Length}m) [Seats: {this.props.movieItems.TotalSeats}] 
                            </div>
                            <input className="btn" type="button" value="Tillback till Profil" onClick={() => this.props.chosenPage("profile")}/>
                        </form>
                    </div>
            </div>
        )
    }
}
export default TestPage
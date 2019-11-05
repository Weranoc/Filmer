import React, { Component } from "react";
import style from './style.css';

class TestPage extends Component {
    constructor(props) {
        super(props);
    this.state = {url: "https://image.tmdb.org/t/p/w185_and_h278_bestv2/"};
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
                <link rel="stylesheet" href={style}/>
                <link href="https://fonts.googleapis.com/css?family=Play&display=swap" rel="stylesheet"/>

                <title></title>
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
                            <div className="viewings">
                                <img src= {this.state.url + this.props.movieItems.Poster} alt="poster"/>
                                <br/>
                                {this.props.movieItems.MovieName}
                                <br/>
                                Salong: {this.props.movieItems.Id}
                                <br/>
                                Tid: {this.props.movieItems.ViewingDate}
                                <br/>
                                Längd:{this.props.movieItems.Length}m
                                <br/>
                                Biljetter: {this.props.tickets}
                                <br/>
                            </div>
                            <input className="btn" type="button" value="Tillback till Profil" onClick={() => this.props.chosenPage("profile")}/>
                        </form>
                    </div>
                </div>
            </div>
        )
    }
}
export default TestPage
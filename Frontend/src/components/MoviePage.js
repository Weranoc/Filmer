import React from 'react';
import style from './MoviePageStyle.css';

class MoviePage extends React.Component {
  constructor() { 
    super();
  }
ticketModal() {
    var x = document.getElementById("msg");
    x.className = "show";
    setTimeout(function() {x.className = x.className.replace("show", ""); }, 3000);
                    }

infoFunction() {
     var popup = document.getElementById("myInfo");
     popup.classList.toggle("show");
                        }

storyFunction() {
     var popup = document.getElementById("myStory");
     popup.classList.toggle("show");
                       }
     
daysFunction() {
     var popup = document.getElementById("myDays");
     popup.classList.toggle("show");
                       }
astraFunction() {
     var popup = document.getElementById("myAstra");
     popup.classList.toggle("show");
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
    <div class="ourMovies">
            
            <img class="movPost" src="https://image.tmdb.org/t/p/w185_and_h278_bestv2/zfE0R94v1E8cuKAerbskfD3VfUt.jpg" alt="poster"/>
           <div class="itInfo">
                <h2 class="title">IT: Chapter 2</h2>
                <p class="release">Premiär: 6 september 2019</p>
                <p class="genre">Genre: Skräck, Thriller</p>

                <div class="popupInfo" onclick={() => this.infoFunction()}>Om filmen
                    <span class="textInfo" id="myInfo">
                            27 år efter händelserna under sommaren 1989 kommer Det tillbaka.
                            Losers Club håller sitt löfte och återvänder till Derry för att sätta stopp
                            för ondskan en gång för alla, men vad de inte vet
                            är att Det den här gången är både starkare och grymmare än någonsin. 
                        </span>
                  </div>

           </div>
        
            <img class="movPost" src="https://image.tmdb.org/t/p/w185_and_h278_bestv2/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg" alt="poster"/>
            <div class="storyInfo">
                <h2 class="title">Toy Story 4</h2>
                <p class="release">Premiär: 30 augusti 2019</p>
                <p class="genre">Genre: Äventyr, Animation</p>

                <div class="popupInfo" onclick={() => this.storyFunction()}>Om filmen
                    <span class="textInfo" id="myStory">
                        Woody har alltid känt sig säker på var han hör hemma och att hans viktigaste uppgift
                        är att ta hand om sitt barn, vare sig det är Andy eller Bonnie. Så när Bonnies nya
                        hemmagjorda leksak Gaffe kallar sig själv för sopa och inte leksak, tar Woody på sig 
                        uppgiften att visa Gaffe varför det är så underbart att vara en leksak.
                        </span>
                  </div>

            </div>
          
            <img class="movPost" src="https://image.tmdb.org/t/p/w185_and_h278_bestv2/f3gYSg0tCXQ6LGDlz002f2O1bBa.jpg" alt="poster"/>
            <div class="myDaysInfo">
            <h2 class="title">438 Days</h2>
            <p class="release">Premiär: 30 augusti 2019</p>
            <p class="genre">Genre: Drama</p>

                <div class="popupInfo" onclick={() => this.daysFunction()}>Om filmen
                    <span class="textInfo" id="myDays">
                        Journalisterna Martin Schibbye och Johan Persson sätter allt på spel när de korsar 
                        gränsen mellan Somalia och Etiopien. De vill undersöka hur jakten på olja 
                        drabbar befolkningen och med egna ögon ta reda på sanningen. 
                        Fem dygn senare ligger de skjutna i öknen och en annan historia tar sin början.
                        </span>
                </div>
            </div>
         
            <img class="movPost" src="https://image.tmdb.org/t/p/w185_and_h278_bestv2/lNnomQxXpRP9mgUwMuSZhA8LXfA.jpg" alt="poster"/>
            <div class="myAstraInfo">
            <h2 class="title">Ad Astra</h2>
            <p class="release">Premiär: 20 september 2019></p>
            <p class="genre">Genre: Science Fiction, Drama</p>

                <div class="popupInfo" onclick={() => this.astraFunction()}>Om filmen
                    <span class="textInfo" id="myAstra">
                        Astronauten Roy McBride färdas till solsystemets yttersta delar för att försöka hitta
                        sin försvunne far. Hans resa kommer att avslöja hemligheter som sätter mänsklighetens
                        existens på prov och samtidigt ifrågasätter vår plats i universum.
                        </span>
                </div>
            </div>
        </div>
    </body>
</div>
  );
}
}

export default MoviePage;

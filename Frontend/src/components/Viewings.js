import React, { Component } from "react";


class Viewings extends Component {
  constructor(props) {
    super(props);
    this.state = { result: null, loaded: false ,tickets: 2, accessToken: this.props.signInToken , viewingID: 0, seat: 90, url: "https://image.tmdb.org/t/p/w185_and_h278_bestv2/"};
  }

  componentDidMount() {
    this.getMovies();
  }

  getMovies = async () => {
    const response = await fetch("http://localhost:59464/api/Viewings")
      .then(response => response.json())
      .then(data => this.setState({ result: data, loaded: true }));
  };
  //Ska lägga till, så man inte kan boka mer platser, än vad det finns
  handleBooking(movieId, amountOfTickets, token, ticketsLeft, itemsForMovie, tickets){
    if(ticketsLeft > amountOfTickets)
    { this.setState({viewingID: movieId})
      fetch("http://localhost:59464/MakeBooking", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "Basic " + token.accessToken
      },
      body: JSON.stringify({
        movieId: movieId,
        tickets: amountOfTickets,
        token: token
      })
    })
      .then(response => response.json())
      .then(data => {
        if (data == null) {
        } else {
          this.props.movieItem(itemsForMovie)
          this.props.ticket(tickets)
          this.props.page("confirmation")
        }
      });
    }
    else{
      alert("You have booked to many tickets")
    }
  }
  //Försöker fixa en funktion som uppdaterar antalet platser
  /*seatsLeft(Seats, ID){
    //alert(ID)
    var stolar=[]
    fetch("http://localhost:59464/GetSeats", {
    method: "POST", 
    headers: { 
      Accept: "application/json", 
      "Content-Type": "application/json; charset=UTF-8" 
    }, 
    body: JSON.stringify({ 
      seats: Seats, 
      viewingID: ID
    }) })
    .then(Response => Response.json()) 
    .then(data => { 
      if(data < 0){ 
        
      }else{ 
        //alert(data)
        this.setState({seat: data})
        stolar.push(data)
      } 
    }) 
    return stolar
}; */
  render() {
    return (
      <div >
        
        <div class="viewings">Movies</div>
        <br/>
        {this.state.loaded ? (
          this.state.result !== null ? (
            <div className="movieGid">
              {this.state.result !== undefined && this.state.result !== null
                ? this.state.result.map(item => (
                    <div className="viewings"> 
                       {/* <img src= {this.state.url + item.Poster} alt="poster"/>*/}
                        <br/>
                        {item.MovieName}
                        <br/>
                        Salong: {item.Id}
                        <br/>
                        Tid: {item.ViewingDate}
                        <br/>
                        Längd:{item.Length}m
                        <br/>
                        Platser: {item.TotalSeats}
                        <br/>
                      <div>
                        <input className="btn" type="button" value="Boka" onClick={() => this.handleBooking(item.Id, this.state.tickets, this.state.accessToken, item.TotalSeats, item, this.state.tickets)}/>
                      </div>
                      <br/>
                      Antal biljeter
                      <input type="number" name="tickets"  value={this.state.tickets} onChange={e => this.setState({ tickets: e.target.value })}/><br/><br/>
                    </div>
                  ))
                : null}
            </div>
          ) : null
        ) : (
          <div className="viewings">Loading...</div>
        )}
      </div>
    );
  }
}
export default Viewings
import React, { Component } from "react";

class Viewings extends Component {
  constructor(props) {
    super(props);
    this.state = { result: null, loaded: false ,tickets: 2, accessToken: this.props.signInToken , viewingID: 0};
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
  handleBooking(movieId, amountOfTickets, token, /*ticketsLeft*/){
    /*if(ticketsLeft > amountOfTickets)
    {*/ this.state.viewingID = this.setState(movieId)
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
          console.log(data);
          alert(this.state.tickets + " bokat till" + movieId)
        }
      });
    /*}
    else{
      alert("You have booked to many tickets")
    }*/
  }
  //Försöker fixa en funktion som uppdaterar antalet platser
  seatsLeft(Seats, ID){
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
        alert('Finns inte tillräkligt många platser')
      }else{ 
        alert('Dina biljetter är bokade')
      } 
    }) 
}; 
  render() {
    return (
      <div>
        <div>Movies</div>
        {this.state.loaded ? (
          this.state.result !== null ? (
            <div>
              {this.state.result !== undefined && this.state.result !== null
                ? this.state.result.map(item => (
                    <div>
                      {item.Id}. {item.ViewingDate} - {item.MovieName} (
                      {item.Length}m) [Seats: {item.TotalSeats}] 
                      <div>
                        <input className="btn" type="button" value="Boka" onClick={() => this.handleBooking(item.Id, this.state.tickets, this.state.accessToken/*, this.seatsLeft(item.TotalSeats)*/ )} />
                      </div>
                    </div>
                  ))
                : null}
                Antal biljeter
                <input type="number" name="tickets"  value={this.state.tickets} onChange={e => this.setState({ tickets: e.target.value })}/><br/><br/> 
            </div>
          ) : null
        ) : (
          <div>Loading...</div>
        )}
      </div>
    );
  }
}
export default Viewings
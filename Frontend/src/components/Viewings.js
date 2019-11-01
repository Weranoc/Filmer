import React, { Component } from "react";

export default class MovieList extends Component {
  constructor(props) {
    super(props);
    this.state = { result: null, loaded: false };
  }

  componentDidMount() {
    this.getMovies();
  }

  getMovies = async () => {
    const response = await fetch("http://localhost:59464/api/Viewings")
      .then(response => response.json())
      .then(data => this.setState({ result: data, loaded: true }));
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
                    </div>
                  ))
                : null}
            </div>
          ) : null
        ) : (
          <div>Loading...</div>
        )}
      </div>
    );
  }
}

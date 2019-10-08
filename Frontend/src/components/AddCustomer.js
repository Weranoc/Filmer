import React from "react";
import "./../App.css";

class AddCustomer extends React.Component {
  constructor(props) {
    super(props);
    this.state = { mail: ""};
  }

  handleClick = () => {
    fetch("http://localhost:60248/api/Customers", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        mail: this.state.mail
      })
    }).then(() => this.props.onAddedCustomer());
  };
  
  render() {
    return (
      <div className="border">
        <p>
          Mail:{" "}
          <input
            type="text"
            value={this.state.mail}
            onChange={e => this.setState({ mail: e.target.value })}
          />
        </p>
        <input
          type="button"
          onClick={() => this.handleClick()}
          value="Add Customer"
        />
      </div>
    );
  }
}

export default AddCustomer;
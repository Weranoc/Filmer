import React from "react";
import "./../App.css";

class AddMember extends React.Component {
  constructor(props) {
    super(props);
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    this.state = { email: "" , password: "", firstName: "", lastName: "", phoneNumber: "", joinDate: today, admin: "member"};
  }

  handleClick = () => {
    fetch("http://localhost:59464/api/Members", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: JSON.stringify({
        email: this.state.email,
        password: this.state.password,
        firstName: this.state.firstName,
        lastName: this.state.lastName,
        phoneNumber: this.state.phoneNumber,
        joinDate: this.state.joinDate,
        admin: this.state.admin
      })
    }).then(() => this.props.onAddedMember());
  };

  render() {
    return (
      <div className="border">
        <p>
          Email:{" "}
          <input
            type="text"
            value={this.state.email}
            onChange={e => this.setState({ email: e.target.value })}
          />
        </p>
        <p>
          Password:{" "}
          <input
            type="text"
            value={this.state.password}
            onChange={e => this.setState({ password: e.target.value })}
          />
        </p>
        <p>
          FirstName:{" "}
          <input
            type="text"
            value={this.state.firstName}
            onChange={e => this.setState({ firstName: e.target.value })}
          />
        </p>
        <p>
          LastName:{" "}
          <input
            type="text"
            value={this.state.lastName}
            onChange={e => this.setState({ lastName: e.target.value })}
          />
        </p>
        <p>
          PhoneNumber:{" "}
          <input
            type="text"
            value={this.state.phoneNumber}
            onChange={e => this.setState({ phoneNumber: e.target.value })}
          />
        </p>
        <input
          type="button"
          onClick={() => this.handleClick()}
          value="Add Member"
        />
      </div>
    );
  }
}

export default AddMember;

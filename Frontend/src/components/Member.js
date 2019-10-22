import React from "react";
import "./../App.css";

class Member extends React.Component {
  render() {
    return (
      <div className="border">
        <p>
          {this.props.data.Mail}
        </p>
          <p>
            {this.props.data.FirstName}
            {" "}
            {this.props.data.LastName}
            {" "}
            {this.props.data.JoinDate}
            {" "}
            {this.props.data.Admin}
          </p>
      </div>
    );
  }
}

export default Member;

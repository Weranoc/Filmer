import React from "react";
import Member from "./Member";
import AddMember from "./AddMember";

class Members extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: null };
  }

  componentDidMount() {
    this.getMembers();
  }

  getMembers = async () => {
    await fetch("http://localhost:59464/api/Members")
      .then(response => response.json())
      .then(data => this.setState({ result: data }));
  };

  render() {
    return (
      <>
        {this.state.result !== null ? (
          <div>
            {this.state.result !== undefined
              ? this.state.result.map(item => (
                  <Member key={item.id} data={item} />
                ))
              : null}
          </div>
        ) : null}
        <AddMember onAddedMember={() => this.getMembers()} />
      </>
    );
  }
}

export default Members;

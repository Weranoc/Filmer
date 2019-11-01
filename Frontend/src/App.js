import React from 'react';
import './App.css';
//import { BrowserRouter, Switch, Route, Redirect} from 'react-router-dom'
import Index from './components/index';
import LoginPage from './components/login';
import RegistrationPage from './components/registration';
//import { getSession } from './components/Cookie';
import ProfilePage from './components/singedIn';
//import MoviesPage from './components/New folder/'

class App extends React.Component {
  constructor() {
    super();
    this.pageHandler = this.pageHandler.bind(this);
    this.state = {
      chosenPage: "home",
      loggedIn: false,
      accessToken: {}
    };
  }

  handleAccessToken(token) {
    this.setState({ loggedIn: true, accessToken: token });
  }
  pageHandler(page){
    this.setState({chosenPage: page})
  }
  handleLogOut(token){
    this.setState({ loggedIn:false, accessToken: token})
  }

  render() {
    return(
    /*<BrowserRouter>
      <div className="App">
        <Switch>
          <Route path='/index' component={Index}/>
          <Route path='/login' render={() => (<div>{!this.state.loggedIn ? (
          <LoginPage loggedIn={token => this.handleAccessToken(token)} />
        ) : (
          <></>
        )}</div>)}/>
          <Route path='/registration' component={RegistrationPage}/>
          <Route path='/profile' component={profilePage}/>
          <Route path='/' render={() => (
            getSession() ? (
              <App to='/'/>
            ) : (
              <Redirect to='/index'/>
            )
          )}/>
        </Switch>
      </div>
    
    </BrowserRouter>*/

    <div>
      {this.state.chosenPage === "home" ?(
        <Index chosenPage={page =>this.pageHandler(page)} loggedIn={token => this.handleLogOut(token)} logain={this.state.loggedIn}/>
        ) : (
          <div/>
      )}
        {!this.state.loggedIn ? (
          this.state.chosenPage === "login"? (
          <LoginPage loggedIn={token => this.handleAccessToken(token)} chosenPage={page =>this.pageHandler(page)}/>
          ) : (
            <div/>
          )
        ) : (
        <></>
        )}
        {this.state.loggedIn ? (
          this.state.chosenPage === "profile"? (
            <ProfilePage chosenPage={page =>this.pageHandler(page)} loggedIn={token => this.handleLogOut(token)} memberToken={this.state.accessToken}/>
        ) : (
            <div/>
          )
        ) : (
        <></>
        )}
         {!this.state.loggedIn ? (
           this.state.chosenPage === "registration" ? (
             <RegistrationPage chosenPage={page =>this.pageHandler(page)}/>
             ) : (
              <div/>
            )
          ) : (
          <></>
          )}
          {/*this.state.chosenPage === "movies" ? (
            <MoviesPage chosenPage={page =>this.pageHandler(page)} loggedIn={token => this.handleLogOut(token)}/>
        ) : (
            <div/>
          
        )*/}
      </div>

    );


  }
}


export default App;

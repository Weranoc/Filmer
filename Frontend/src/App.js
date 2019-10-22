import React from 'react';
import './App.css';
import { BrowserRouter, Switch, Route} from 'react-router-dom'
import index from './components/index';
import loginPage from './components/login';
import registrationPage from './components/registration';

class App extends React.Component {
  render() {
    return(
    <BrowserRouter>
      <div className="App">
        <Switch>
          <Route path='/index' component={index}/>
          <Route path='/login' component={loginPage}/>
          <Route path='/registration' component={registrationPage}/>

        </Switch>
      </div>
    
    </BrowserRouter>

    )


  }
}


export default App;

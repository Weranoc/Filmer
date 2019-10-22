import React, { Component } from 'react';
import { BrowserRouter, Switch, Route} from 'react-router-dom'
import "./App.css";
import Members from "./components/Members"

class App extends Component{
  render(){
    return(
      <BrowserRouter>
        <div className='App'>
          <Switch>
            <Route path='/members' component={Members} />
          </Switch>
        </div>
      </BrowserRouter>
    )
  }
}

export default App;
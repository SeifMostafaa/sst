import React from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

import Users from './Users';
import User from './User';
import UserForm from './UserForm';

import Spinner from './Spinner';
import ErrorMessage from './ErrorMessage';
class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      users: [],
      isLoading: true,
      errorMessage: null,
    };
    this.getUsers = this.getUsers.bind(this);
    this.createUser = this.createUser.bind(this);
    this.handleErrors = this.handleErrors.bind(this);
    this.clearErrors = this.clearErrors.bind(this);
  }
  componentDidMount() {
    this.getUsers();
  }
  getUsers() {
    axios
      .get('/api/v1/users')
      .then((response) => {
        this.clearErrors();
        this.setState({ isLoading: true });
        const users = response.data;
        this.setState({ users });
        this.setState({ isLoading: false });
      })
      .catch((error) => {
        this.setState({ isLoading: true });
        this.setState({
          errorMessage: {
            message: 'There was an error loading users...',
          },
        });
      });
  }
  createUser(user) {
    const users = [user, ...this.state.users];
    this.setState({ users });
  }
  handleErrors(errorMessage) {
    this.setState({ errorMessage });
  }
  clearErrors() {
    this.setState({
      errorMessage: null,
    });
  }
  render() {
    return (
      <>
        {this.state.errorMessage && (
          <ErrorMessage errorMessage={this.state.errorMessage} />
        )}
        {!this.state.isLoading && (
          <>
            <UserForm
              createUser={this.createUser}
              handleErrors={this.handleErrors}
              clearErrors={this.clearErrors}
            />
            <Users>
              {this.state.users.map((user) => (
                <User key={user.id} user={user} getUsers={this.getUsers} />
              ))}
            </Users>
          </>
        )}
        {this.state.isLoading && <Spinner />}
      </>
    );
  }
}

document.addEventListener('turbolinks:load', () => {
  const app = document.getElementById('home');
  app && ReactDOM.render(<Home />, app);
});

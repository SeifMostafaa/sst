import React from 'react';
import PropTypes from 'prop-types';

import axios from 'axios';
import setAxiosHeaders from './AxiosHeaders';
class User extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      status: this.props.user.status,
    };
    this.handleDestroy = this.handleDestroy.bind(this);
    this.path = `/api/v1/users/${this.props.user.id}`;
  }
  handleDestroy() {
    setAxiosHeaders();
    const confirmation = confirm('Are you sure?');
    if (confirmation) {
      axios
        .delete(this.path)
        .then((response) => {
          this.props.getUsers();
        })
        .catch((error) => {
          console.log(error);
        });
    }
  }
  render() {
    const { user } = this.props;
    return (
      <tr className={`${this.state.status == 'active' ? 'table-light' : ''}`}>
        <td>
          <p>{user.id}</p>
        </td>
        <td>
          <p>{user.email}</p>
        </td>
        <td>
          <p>{user.role}</p>
        </td>
        <td>
          <p>{user.status}</p>
        </td>
        <td className='text-right'>
          <button className='btn btn-outline'>Edit</button>
          <button
            onClick={this.handleDestroy}
            className='btn btn-outline-danger'
          >
            Delete
          </button>
        </td>
      </tr>
    );
  }
}

export default User;

User.propTypes = {
  user: PropTypes.object.isRequired,
  getUser: PropTypes.func.isRequired,
};

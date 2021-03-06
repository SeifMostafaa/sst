import React from 'react';
import PropTypes from 'prop-types';

import axios from 'axios';
import setAxiosHeaders from './AxiosHeaders';
class UserForm extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.fullNameArRef = React.createRef();
    this.fullNameEnRef = React.createRef();
    this.lastNameRef = React.createRef();
    this.roleRef = React.createRef();
    this.localeRef = React.createRef();
    this.phoneRef = React.createRef();
    this.dateOfBirthRef = React.createRef();
    this.genderRef = React.createRef();
    this.usernameRef = React.createRef();
    this.emailRef = React.createRef();
    this.passwordRef = React.createRef();
    this.passwordConfirmationRef = React.createRef();
  }

  handleSubmit(e) {
    console.log('here');
    e.preventDefault();
    setAxiosHeaders();
    axios
      .post('/api/v1/users', {
        user: {
          full_name_ar: this.fullNameArRef.current.value,
          full_name_en: this.fullNameEnRef.current.value,
          // last_name: this.lastNameRef.current.value,
          // role: this.roleRef.current.value,
          // locale: this.localeRef.current.value,
          // phone: this.phoneRef.current.value,
          // date_of_birth: this.dateOfBirthRef.current.value,
          // gender: this.genderRef.current.value,
          // username: this.usernameRef.current.value,
          // email: this.emailRef.current.value,
          // password: this.passwordRef.current.value,
          // password_confirmation: this.passwordConfirmationRef.current.value,
          status: 'active',
        },
      })
      .then((response) => {
        const user = response.data;
        this.props.createUser(user);
        this.props.clearErrors();
      })
      .catch((error) => {
        this.props.handleErrors(error);
      });
    e.target.reset();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit} className='my-3'>
        <div className='form-row'>
          <div className='form-group col-md-8'>
            <input
              type='text'
              name='full-name-ar'
              ref={this.fullNameArRef}
              required
              className='form-control'
              id='full-name-ar'
              placeholder='Full Name AR'
            />
            <input
              type='text'
              name='full-name-en'
              ref={this.fullNameEnRef}
              required
              className='form-control'
              id='full-name-en'
              placeholder='Full Name EN'
            />
          </div>
          <div className='form-group col-md-4'>
            <button className='btn btn-outline-success btn-block'>
              Add User
            </button>
          </div>
        </div>
      </form>
    );
  }
}

export default UserForm;

UserForm.propTypes = {
  createUser: PropTypes.func.isRequired,
  handleErrors: PropTypes.func.isRequired,
  clearErrors: PropTypes.func.isRequired,
};

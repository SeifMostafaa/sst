import React from 'react';

class Users extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <>
        <div className='table-responsive'>
          <table className='table'>
            <thead>
              <tr>
                <th scope='col'>ID</th>
                <th scope='col'>Email</th>
                <th scope='col'>Roles</th>
                <th scope='col'>Status</th>
                <th scope='col' className='text-right'>
                  Actions
                </th>
              </tr>
            </thead>
            <tbody>{this.props.children}</tbody>
          </table>
        </div>
      </>
    );
  }
}
export default Users;

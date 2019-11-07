import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session.js'
import SignUp from './signup.jsx';

const mapDispatchToProps = dispatch => {
  return {
    createNewUser: formUser => dispatch(createNewUser(formUser))
  }
}

export default connect(null, mapDispatchToProps)(SignUp);
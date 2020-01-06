const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const UserSchema = new Schema ({
  name: {
    type: String,
    required: true 
  },
  email: {
    type: String,
    required: true 
  },
  data: {
    type: Date,
    default: Date.now
  },
  password: {
    type: String,
    required: true,
    min: 8,
    max: 32
  }
});

module.exports = mongoose.model('users', UserSchema);
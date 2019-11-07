import { combineReducers } from 'redux';
import entitiesReducer from './entities';
import sessionReducer from './session.js';

export default combineReducers({
  entities: entitiesReducer,
  session: sessionReducer
});

import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './components/App';
import * as serviceWorker from './serviceWorker';
import ApolloClient from 'apollo-client';
import { InMemoryCache } from 'apollo-cache-inmemory';
import { createHttpLink } from 'apollo-link-http';
import { ApolloProvider } from 'react-apollo';
import { onError } from 'apollo-link-error';
import { ApolloLink } from 'apollo-link';
import { HashRouter } from "react-router-dom";
import { VERIFY_USER } from './graphql/mutations';

// ReactDOM.render(<App />, document.getElementById('root'));

const cache = new InMemoryCache({
  dataIdFromObject: object => object.id || null
});

const httpLink = createHttpLink({
  uri: 'http://localhost:5000/graphql'
});

const errorLink = onError(({ graphQLErrors }) => {
  if (graphQLErrors) graphQLErrors.map(({ message }) => console.log( message));
});

const client = new ApolloClient({
  link: ApolloLink.from([errorLink, httpLink]),
  cache,
  onError: ({ networkError, graphQLErrors }) => {
    console.log('graphQLErrors', graphQLErrors);
    console.log('networkError', networkError);
  }
});

const token = localStorage.getItem('auth-token');

cache.writeData({
  data: {
    isLoggedIn: Boolean(token)
  }
});

if (token) {
  client 
    .mutate({ mutation: VERIFY_USER, variables: { token } })
    .then(({ data }) => {
      cache.writeData({
        data: {
          isLoggedIn: data.verifyUser.loggedIn
        }
      });
    });
}

const Root = () => {
  return (
    <ApolloProvider client={client}>
      <HashRouter>
        <App />
      </HashRouter>
    </ApolloProvider>
  );
};

ReactDOM.render(<Root />, document.getElementById("root"));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();

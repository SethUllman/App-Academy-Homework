import { Query } from 'react-apollo';
import React from 'react';
import Queries from '../../graphql/queries';

const productIndex = () => {
  return (
    <Query query={Queries.FETCH_PRODUCTS}>
      {({ loading, error, data }) => {
        if (loading) return 'Loading...';
        if (error) return `Error! ${error.message}`;

        return (
          <ul>
            {data.products.map(product => (
              <li key={product._id}>{product.name}</li>
            ))}
          </ul>
        );
      }}
    </Query>
  );
}

export default productIndex;

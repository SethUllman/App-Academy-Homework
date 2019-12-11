import React, { Component } from "react";
import { Query } from "react-apollo";
import NameDetail from '../detail/NameDetail';
import TypeDetail from '../detail/TypeDetail';
import DescriptionDetail from '../detail/DescriptionDetail';
import AbodeDetail from '../detail/AbodeDetail';
import Queries from "../../graphql/queries";
const { FETCH_GOD } = Queries;

class GodDetail extends React.Component {
  constructor(props){
    super(props)
  }
  
  render(){
    const { loading, error, data } = this.props;
    console.log(data);
    return (
      <Query query={FETCH_GOD} variables={{ id: this.props.match.params.id }}>
        {({ loading, error, data }) => {
          if (loading) return <p>Loading...</p>;
          if (error) return <p>Error</p>;

          return <div className="detail">
            <NameDetail god={data.god} />
            <TypeDetail god={data.god} />
            <DescriptionDetail god={data.god} />
            <AbodeDetail god={data.god} />
          </div>;
        }}
      </Query>
      
    );
  }
}

export default GodDetail;

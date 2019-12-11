import React from 'react';
import { Query } from "react-apollo";
import Mutations from "../../graphql/mutations";
import { Mutation } from "react-apollo";
import { IconContext } from "react-icons";
import { FaPencilAlt } from "react-icons/fa";
import Queries from "../../graphql/queries";
const { FETCH_ABODES } = Queries;
const { UPDATE_GOD_ABODE } = Mutations;

class AbodeDetail extends React.Component{
  constructor(props){
    super(props)
    this.state = {
      editing: false,
      abode: this.props.god.abode || ""
    }
    this.handleEdit = this.handleEdit.bind(this);
  }

  handleEdit(e){
    e.preventDefault();
    this.setState({ editing: true });
  }

  update(field){
    return e => {
      // console.log(e.target);
      this.setState({ [field]: e.target.value })
    };
  }

  // changeAbode(abode){
  //   return this.setState({ abode: abode })
  // }

  render() {
    if(this.state.editing){
      // const godIdentification = this.props.god.id;
      return (
        <Mutation mutation={UPDATE_GOD_ABODE}>
          {(updateGodAbode, data) => (
            <div>
              <select onChange={e => updateGodAbode({
                variables: {
                  id: this.props.god.id,
                  abodeId: e.target.value
                }
              }).then(() => this.setState({ editing: false }))}>
                {<Query query={FETCH_ABODES}>
                    {({ loading, error, data }) => {
                      if (loading) return <option>Loading...</option>;
                      if(error) return <option>error</option>
                      return data.abodes.map(abode => {
                        return <option value={abode.id} key={abode.id}>{abode.name}</option>
                      })
                    }}
                  </Query>
                }
              </select>

            </div>
          )}
        </Mutation>
      )
    } else {
      return (
        <div>
          <div
            onClick={this.handleEdit}
            style={{ fontSize: "10px", cursor: "pointer", display: "inline", marginRight: "5px" }}
          >
            <IconContext.Provider value={{ className: "custom"}}>
              <FaPencilAlt />
            </IconContext.Provider>
          </div>
          <h2>{this.props.god.abode.name}</h2>
        </div>
      )
    }
  }
  
}

export default AbodeDetail;
import React, { Component } from "react";
import { Mutation } from "react-apollo";
import Mutations from "../../graphql/mutations";
const { NEW_ABODE } = Mutations;

class AbodeCreate extends Component {
  constructor(props){
    super(props);
    this.state = {
      name: "",
      coordinates: "",
      message: ""
    }
    this.update = this.update.bind(this);
  }

  update(field){
    return e => this.setState({ [field]: e.target.value });
  }

  updateCache(cache, { data: { newAbode } }){
    let abodes;
    try{
      abodes = cache.readQuery({ query: FETCH_ABODES });
    } catch (err){
      return;
    }
    if(abodes){
      let abodesArray = abodes.abodes;

      cache.writeQuery({
        query: FETCH_ABODES,
        data: { abodes: abodesArray.concat(newAbode)}
      });
    }
  }

  handleSubmit(e, newAbode){
    e.preventDefault();
    let name = this.state.name;
    let coordinates = this.state.coordinates;
    newAbode({
      variables:{
        name: name,
        coordinates: coordinates
      }
    })
    .then(data => {
      console.log(data);
      this.setState({
        message: `New Abode "${name}" created successfully`,
        name: "",
        coordinates: ""
      });
    })
  }

  render() {
    return(
      <Mutation
        mutation={NEW_ABODE}
        update={(cache, data) => this.updateCache(cache, data)}
      >
        {(newAbode, { data }) => (
          <div>
            <form onSubmit={e => this.handleSubmit(e, newAbode)}>
              <input
              type="text"
              value={this.state.name}
              placeholder="Name"
              onChange={this.update("name")}
              />

              <input
                type="text"
                value={this.state.coordinates}
                placeholder="Coordinates"
                onChange={this.update("coordinates")}
              />

              <button>Create Abode</button>
            </form>
          </div>
        )}
      </Mutation>
    )
  }
}

export default AbodeCreate;
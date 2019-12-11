import React from "react";
import { Mutation } from "react-apollo";
import { IconContext } from "react-icons";
import { FaPencilAlt } from "react-icons/fa";
import Mutations from "../../graphql/mutations";
const { UPDATE_GOD_DESCRIPTION } = Mutations;

class DescriptionDetail extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editing: false,
      description: this.props.god.description || ""
    };

    this.handleEdit = this.handleEdit.bind(this);
  }

  handleEdit(e) {
    e.preventDefault();
    this.setState({ editing: true });
  }

  fieldUpdate(field) {
    return e => this.setState({ [field]: e.target.value })
  }

  render() {
    if (this.state.editing) {
      return (
        <Mutation mutation={UPDATE_GOD_DESCRIPTION}>
          {(updateGodDescription, data) => (
            <div>
              <form
                onSubmit={e => {
                  e.preventDefault();
                  updateGodDescription({
                    variables: { id: this.props.god.id, description: this.state.description }
                  }).then(() => this.setState({ editing: false }));
                }}
              >
                <textarea
                  value={this.state.description}
                  onChange={this.fieldUpdate("description")}
                />
                <button type="submit">Update Description</button>
              </form>
            </div>
          )}
        </Mutation>
      )
    } else {
      return (
        <div>
          <div 
            onClick={this.handleEdit}
            style={{ fontSize: "10px", cursor: "pointer", display: "inline", marginLeft: "5px"}}
          >
            <IconContext.Provider value={{ className: "custom-icon"}}>
              <FaPencilAlt />
            </IconContext.Provider>
          </div>
          <h2>{this.state.description}</h2>
        </div>
      );
    }
  }
}

export default DescriptionDetail;
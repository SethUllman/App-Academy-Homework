const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLID } = graphql;
const mongoose = require("mongoose");
const God = mongoose.model("god");
const Emblem = mongoose.model("emblem");
const Abode = mongoose.model("abode");
const GodType = require("./god_type");
const EmblemType = require("./emblem_type");
const AbodeType = require("./abode_type");

const mutation = new GraphQLObjectType({
  name: "Mutation",
  fields: {
    newGod: {
      type: GodType,
      args: {
        name: { type: GraphQLString },
        type: { type: GraphQLString },
        description: { type: GraphQLString }
      },
      resolve(parentValue, { name, type, description }) {
        return new God({ name, type, description }).save();
      }
    },
    destroyGod: {
      type: GodType,
      args: {
        id: { type: GraphQLID }
      },
      resolve(parentValue, { id }) {
        return God.remove({ _id: id });
      }
    },
    updateGod: {
      type: GodType,
      args: {
        id: { type: GraphQLID },
        name: { type: GraphQLString },
        type: { type: GraphQLString },
        description: { type: GraphQLString }
      },
      resolve(parentValue, { id, name, type, description }) {
        const updateObj = {};
        updateObj.id = id;
        if (name) updateObj.name = name;
        if (type) updateObj.type =type;
        if (description) updateObj.description = description;

        return God.findOneAndUpdate({ _id: id }, { $set: updateObj }, { new: true }, (err, god) => {
          return god;
        });
      }
    },
    addGodRelative: {
      type: GodType,
      args: {
        godId: { type: GraphQLID },
        relativeId: { type: GraphQLID },
        relationship: { type: GraphQLString }
      },
      resolve(parentValue, { godId, relativeId, relationship }) {
        return God.addRelative(godId, relativeId, relationship);
      }
    },
    removeGodRelative: {
      type: GodType,
      args: {
        godId: { type: GraphQLID },
        relativeId: { type: GraphQLID },
        relationship: { type: GraphQLString }
      },
      resolve(parentValue, { godId, relativeId, relationship }) {
        return God.removeRelative( godId, relativeId, relationship )
      }
    },
    newEmblem: {
      type: EmblemType,
      args: {
        name: { type: GraphQLString }
      },
      resolve(parentValue, { name }) {
        return new Emblem({ name }).save();
      }
    },
    deleteEmblem: {
      type: EmblemType,
      args: {
        id: { type: GraphQLID }
      },
      resolve(parentValue, { id }) {
        return Emblem.remove({ _id: id });
      }
    },
    updateEmblem: {
      type: EmblemType,
      args: {
        id: { type: GraphQLID },
        name: { type: GraphQLString }
      },
      resolve(parentValue, { id, name }) {
        const updateObj = {};
        updateObj.id = id;
        updateObj.name = name;
        return Emblem.findOneAndUpdate({ _id: id}, { $set: updateObj }, { new: true }, (err, emblem) => {
          return emblem;
        });
      }
    },
    newAbode: {
      type: AbodeType,
      args: {
        name: { type: GraphQLString },
        coordinate: { type: GraphQLString }
      },
      resolve(parentValue, { name, coordinate }) {
        return new Abode({ name,  coordinate }).save();
      }
    },
    deleteAbode: {
      type: AbodeType,
      args: {
        id: { type: GraphQLID }
      },
      resolve(parentValue, { id }) {
        return Abode.remove({ _id: id });
      }
    },
    updateAbode: {
      type: AbodeType,
      args: {
        id: { type: GraphQLID },
        name: { type: GraphQLString },
        coordinate: { type: GraphQLString }
      },
      resolve(parentValue, { id, name, coordinate }) {
        const updateObj = {};
        updateObj.id = id;
        if (name) updateObj.name = name;
        if (coordinate) updateObj.coordinate = coordinate;
        return Abode.findOneAndUpdate( {_id: id}, {$set: updateObj }, {new: true}, (err, abode) => {
          return abode;
        }
      )}
    }
  }
});

module.exports = mutation;


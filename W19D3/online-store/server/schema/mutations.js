const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLID } = graphql;

const CategoryType = require("./types/category_type");
const ProductType = require("./types/product_type");
const UserType = require('./types/user_type');

const Category = mongoose.model("categories");
const Product = mongoose.model("products");
const User = mongoose.model('users');

const AuthService = require('../services/auth');

const mutations = new GraphQLObjectType({
  name: 'Mutation',
  fields: {
    newCategory: {
      type: CategoryType,
      args: {
        name: { type: GraphQLString }
      },
      resolve(_, { name }) {
        return new Category({ name }).save();
      }
    },
    deleteCategory: {
      type: CategoryType,
      args: { _id: { type: GraphQLID } },
      resolve(_, { _id }) {
        return Category.remove({ _id });
      }
    },
    newProduct: {
      type: ProductType,
      args: {
        name: { type: GraphQLString },
        description: { type: GraphQLString },
        weight: { type: GraphQLInt }
      },
      resolve(_, { name, description, weight }) {
        return new Product({ name, description, weight }).save();
      }
    },
    deleteProduct: {
      type: ProductType,
      args: { _id: { type: GraphQLID } },
      resolve(_, { _id }) {
        return Product.remove({ _id });
      }
    },
    updateProductCategory: {
      type: ProductType,
      args: { _id: { type: GraphQLID }, categoryId: { type: GraphQLID } },
      resolvve(_, { _id, categoryId }) {
        return Product.statics.updateProductCategory(_id, categoryId);
      }
    },
    register: {
      type: UserType,
      args: {
        name: { type: GraphQLString },
        email: { type: GraphQLString },
        password: { type: GraphQLString }
      },
      resolve(_, args) {
        return AuthService.register(args);
      }
    },
    logout: {
      type: UserType,
      args: {
        _id: { type: GraphQLID }
      },
      resolve(_, args) {
        return AuthService.logout(args);
      }
    },
    login: {
      type: UserType,
      args: {
        email: { type: GraphQLString },
        password: { type: GraphQLString }
      },
      resolve(_, args) {
        return AuthService.login(args);
      }
    },
    verifyUser: {
      type: UserType,
      args: {
        token: { type: GraphQLString }
      },
      resolve(_, args) {
        return AuthService.verifyUser(args);
      }
    }
  }
});

module.exports = mutations;
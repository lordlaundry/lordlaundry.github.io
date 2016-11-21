const path = require('path')
const Webpack = require('webpack')
const { uniq, concat } = require('lodash')
const ExtractTextPlugin = require('extract-text-webpack-plugin')

const isProduction = (process.env.NODE_ENV === 'production')

const pluginsList = [
  new ExtractTextPlugin('css/styles.css'),
  new Webpack.NoErrorsPlugin()
]

const prodPlugins = [
  new Webpack.optimize.DedupePlugin(),
  new Webpack.optimize.OccurrenceOrderPlugin(true),
  new Webpack.optimize.UglifyJsPlugin({
    compress: {
      warnings: false
    },
    output: {
      comments: false
    }
  })
]

module.exports = {
  noInfo: true,
  target: 'web',
  entry: './src/main.coffee',
  output: {
    path: '/',
    publicPath: '/',
    filename: 'scripts/main.js'
  },
  devtool: 'cheap-module-sourcemap',
  resolve: {
    extensions: ['', '.js', '.coffee', '.sass']
  },
  module: {
    loaders: [
      {
        test: /\.coffee$/,
        exclude: /node_modules/,
        loader: 'coffee-loader'
      },
      {
        test: /\.s.ss$/,
        loader: ExtractTextPlugin.extract(
          'style', 'css?sourceMap&importLoaders=1!sass?sourceMap'
        )
      },
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract('style', 'css?sourceMap')
      },
      {
        test: /\.(eot|otf|ttf|woff|woff2|svg)$/,
        loader: 'file'
      }
    ]
  },
  sassLoader: {
    includePaths: [
      path.resolve(require.resolve('bootstrap-sass'), '../../stylesheets')
    ]
  },
  plugins: uniq(isProduction ? concat(prodPlugins, pluginsList) : pluginsList)
}

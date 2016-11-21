const webpack = require('webpack')
const stripAnsi = require('strip-ansi')
const browserSync = require('browser-sync').create()
const webpackDevMiddleware = require('webpack-dev-middleware')

const webpackConfig = require('./webpack.config')
const bundler = webpack(webpackConfig)

/**
 * Reload all devices when bundle is complete
 * or send a fullscreen error message to the browser instead
 */
bundler.plugin('done', function (stats) {
  if (stats.hasErrors() || stats.hasWarnings()) {
    return browserSync.sockets.emit('fullscreen:message', {
      title: 'Webpack Error:',
      body: stripAnsi(stats.toString()),
      timeout: 10000
    })
  }
  browserSync.reload()
})

/**
 * Run Browsersync and use middleware for Hot Module Replacement
 */
browserSync.init({
  server: '.',
  open: false,
  logFileChanges: false,
  middleware: [
    webpackDevMiddleware(bundler, {
      publicPath: '/',
      stats: {colors: true}
    })
  ],
  plugins: ['bs-fullscreen-message'],
  files: [
    'scripts/*.js',
    'css/*.css',
    '*.html'
  ]
})

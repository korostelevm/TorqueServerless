const path = require('path')
// module.exports = {
//   css: { extract: false },
//   configureWebpack: {

//   },
// }
module.exports = {
  css: { extract: false },
  configureWebpack: config => {
    // if (process.env.NODE_ENV === 'production') {
    //   // mutate config for production...
    // } else {
     return {
      output: {
        filename: 'public/microfrontend.js',
      },
      devtool: 'inline-source-map',
      devServer: {
        contentBase: './dist',
        proxy: {
          '/api': {
            target: 'http://localhost:3000',
            // pathRewrite: {'/api' : ''}
          }
        }
      }
     }
    }
  }
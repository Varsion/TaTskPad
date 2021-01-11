const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

// homeland 的资源组织方式
// const extendConfig = {
//   devtool: false,
//   optimization: {
//     splitChunks: {
//       cacheGroups: {
//         vendors: {
//           test: /node_modules|lib\/assets|vendor/,
//           name: 'vendors',
//           enforce: true,
//           chunks: 'all',
//         },
//       },
//     },
//   },
// };
//environment.config.merge(extendConfig);

module.exports = environment
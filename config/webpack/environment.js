const { environment } = require("@rails/webpacker");

// Make $ available on the window object
// for SJR views and jQuery plugins
// that may expect `$` to be globally available.
environment.loaders.append("expose", {
  test: require.resolve("jquery"),
  use: [
    {
      loader: "expose-loader",
      options: "jQuery",
    },
    {
      loader: "expose-loader",
      options: "$",
    },
  ],
});

module.exports = environment;

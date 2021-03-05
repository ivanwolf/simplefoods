// tailwind.config.js
module.exports = {
  purge: [
    "./config/initializers/simple_form.rb",
    "./app/views/**/*.html.erb",
    "./app/javascript/**/*.js",
    "./app/helpers/application_helper.rb",
  ],
}
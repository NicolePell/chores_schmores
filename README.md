# ChoresSchmores
A web application to manage and reward chore completion.

##### Project structure:
```
--> config
--> lib
--> priv
--> test
--> web
--> mix.exs
--> package.json
--> webpack.config.js
```

##### Tech stack:
* Phoenix
* ReactJS

##### To start your the app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

##### Libraries used

  * comeonin for password hashing: [comeonin](https://github.com/elixircnx/comeonin).
  * webpack for module bundling: [webpack](https://webpack.github.io/).
  * bourbon and bourbon-neat: Sass mixin library.
  * history: Manage history with Javascript.
  * react and react-dom.
  * redux and react-redux: Handle state.
  * react-router: Routing library.
  * redux-simple router: Keep route changes in state.

##### Learn more about Phoenix

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

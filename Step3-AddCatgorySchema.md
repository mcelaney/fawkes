## Add a feature
Now we know how to add a route, let's add a new feature. We're going to add categories to tag what level the talk is.

### Add a model

Let's use Phoenix to generate a model called Category.


```
mix phx.gen.schema Talks.Category categories slug:string:unique name:string
```

Running this command will create two files, a migration file (`priv/repo/migrations/20180803152910_create_categories.exs`) and a model file (`lib/speaker/talk/category.ex`). The migration file uses the timestamp to know which file to migrate first. https://hexdocs.pm/ecto/Ecto.Schema.html



Our project uses Ecto to talk to the database.

#TODO add more info on ecto

Now run this command to create the table in the database:

```
mix ecto.migrate
```

### Add a controller

Create a new file called `lib/speaker/talks/talks.ex`. Add the following code to the file:

```
defmodule Speaker.Talks do
  alias Speaker.Repo
  alias Speaker.Talks.Category

  def all_category do
    Repo.all(Category)
  end

end
```

This will call the repository to get all the category.

Now let's add a controller to handle the request. Create a new file called `lib/speaker_web/controllers/category_controller.ex`. Add the following code to the file:

```
defmodule SpeakerWeb.CategoryController do
  use SpeakerWeb, :controller
  alias Speaker.Talks

  def index(conn, _params) do
    categories = Talks.all_category()
    render(conn, "index.html", categories: categories)
  end

end

```

Let's add a presenter by creating a file called `lib/speaker_web/views/category_view.ex`. Add the following code to the view:

```
defmodule SpeakerWeb.CategoryView do
  use SpeakerWeb, :view

end
```

Create a new folder called `category` in `lib/speaker_web/templates`. Add a new file called `lib/speaker_web/templates/index.html.eex`. Add the following code to display the category.

```
<h2>Categories</h2>

<table class="table">
  <thead>
    <tr>
      <th>Name</th>
      <th>Slug</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
  <%= for category <- @categories do %>
      <tr>
        <td><%= category.name %></td>
        <td><%= category.slug %></td>
      </tr>
  <% end %>
  </tbody>
</table>
```

Open up `lib/speaker_web/router.ex`. On line 21, before the `end` keyword, add `get "/categories", CategoryController, :index`.

Now go to http://localhost:4000/categories

Yay, we have a page for the category. Since we don't have any category, our page is empty. Let's add a page to create a category.

### Adding a category

First let's create a form to add a category. Create a new file called `lib/speaker_web/templates/category/new.html.eex`. Add the following code to the file:

```
<h2>New Category</h2>
<%= form_for @changeset, category_path(@conn, :create), fn f -> %>
  <%= if @changeset.action do %>
    <div class="alert alert-danger">
      <p>Oops, something went wrong! Please check the errors below.</p>
    </div>
  <% end %>

  <div class="form-group">
    <%= label f, :name, class: "control-label" %>
    <%= text_input f, :name, class: "form-control" %>
    <%= error_tag f, :name %>
  </div>

  <div class="form-group">
    <%= label f, :slug, class: "control-label" %>
    <%= text_input f, :slug, class: "form-control" %>
    <%= error_tag f, :slug %>
  </div>

  <div class="form-group">
    <%= submit "Submit", class: "btn btn-primary" %>
  </div>
<% end %>
```

In `lib/speaker_web/router.ex`, add a new line on line 21, before the category index. Add this code `get "/categories/new", CategoryController, :new`.

Open `lib/speaker_web/controllers/category_controller.ex`. Add a new function to show a form for a new category:

```
def new(conn, _params) do
  render(conn, "new.html", changeset: Talks.category_changeset())
end
```

Now open `lib/speaker/talks/talks.ex`. Add this method to get a new changeset.

```
def category_changeset(changeset \\ %Category{}) do
  Category.changeset(changeset, %{})
end
```

Ok, now go to http://localhost:4000/categories/new. Congratulations, we have a form to add a category.

### Create new category

Now that we have the form, let's save it to the database. In your router (`lib/speaker_web/router.ex`), add a new path called post after the get new category. `post "/categories/create", CategoryController, :create`.

In your controller add this function to call talk to save it in the database.

```
def create(conn, %{"category" => params}) do
  case Talks.create_category(params) do
    {:ok, _category} ->
      conn
      |> put_flash(:info, "Category created successfully.")
      |> redirect(to: category_path(conn, :index))
    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
  end
end
```

Open `lib/speaker/talks/talks.ex`. Add this function to create a new category.

```
def create_category(attrs \\ %{}) do
  %Category{}
  |> Category.changeset(attrs)
  |> Repo.insert()
end
```

Go to http://localhost:4000/categories/new, add a new category and hit submit. Congrats. It is saving in the database.

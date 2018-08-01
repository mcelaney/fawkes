## Add a page
When a request is sent, Phoenix will look at the router file to figure out which controller handles the request. You can add a new endpoint by adding `[HTTP verb] [path], [controller], [function]`. Let's add an about page to our app.
  1. Open `lib/speaker_web/router.ex`
  2. On line 18, add the line below:

    ```
      get "/about", PageController, :about
    ```

  3. Open `lib/speaker_web/controllers/page_controller.ex`
  4. Add the function to handle the request after line 6:

    ```
      def about(conn, _params) do
        render conn, "about.html"
      end
    ```

  5. Create a new file `lib/speaker_web/templates/page/about.html.eex`
  6. Add the following content to the file:

  ```
    TODO add about page content

  ```

  7. Go to [http://localhost:4000/about](http://localhost:4000/about)

## Congratulations, you have a page!!!

<img src="http://wac.450f.edgecastcdn.net/80450F/thefw.com/files/2012/10/dancinggif.gif">

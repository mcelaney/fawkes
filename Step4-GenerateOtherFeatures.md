## Phoenix HTML Generator

Because adding CRUD application is so common and tedious, Phoenix comes with a command to generate all that code for us, and more. Let's generate a speaker.

```
mix phx.gen.html Schedules Speaker speakers slug:string:unique image:string first:string last:string company:string github:string twitter:string description:text
```

Notice at the end of the command, it told us to add the new route `resources "/speakers", SpeakerController` to our router `lib/speaker_web/router.ex`. This will handle all of our CRUD operations. Let's add that below the category.

Let's run the migration to create our speaker table `mix ecto.migrate`.

Alright, now let's check to see if it is working http://localhost:4000/speakers.

Woo, that was hard work.

Let's add a few more.

```
mix phx.gen.html Schedules Slot schedule_slots start_date:utc_datetime
```

```
mix phx.gen.html Schedules Location locations name:string
```

```
mix phx.gen.html Talks Audience audiences slug:string:unique name:string
```

```
mix phx.gen.html Talks Talk talks slug:string:unique title:string slot_id:references:schedule_slots speaker_id:references:speakers category_id:references:categories audience_id:references:audiences location_id:references:locations description:text
```

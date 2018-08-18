## Narrative

```
mix phx.new fawkes
cd fawkes/
mix ecto.create
git init
git add .
git commit -m "First Commit"
mix phx.server
```


mix phx.gen.schema Schedule.Slot schedule_slots slug:string:unique date:string time:string

mix phx.gen.schema Schedule.Speaker speakers slug:string:unique image:string first:string last:string company:string github:string twitter:string description:text

mix phx.gen.schema Schedule.Location locations slug:string:unique name:string

mix phx.gen.schema Schedule.Category categories slug:string:unique name:string

mix phx.gen.schema Schedule.Audience audiences slug:string:unique name:string

mix phx.gen.schema Schedule.Talk talks slug:string:unique title:string slot_id:references:schedule_slots speaker_id:references:speakers category_id:references:categories audience_id:references:audiences location_id:references:locations description:text

mix phx.gen.schema Schedule.Event events slug:string:unique name:string slot_id:references:schedule_slots


Fawkes.Schedule.Slot |> Fawkes.Repo.all |> Enum.each(fn(slot) -> Fawkes.Repo.delete(slot) end)



{
  "Version": "2012–10–17",
  "Id": "Policy1380877762691",
  "Statement": [
    {
      "Sid": "Stmt1380877761162",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::fawkesapp/*"
    }
  ]
}

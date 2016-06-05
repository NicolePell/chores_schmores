ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ChoresSchmores.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ChoresSchmores.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ChoresSchmores.Repo)


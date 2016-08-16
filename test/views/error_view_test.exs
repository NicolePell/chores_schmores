defmodule ChoresSchmores.ErrorViewTest do
  use ChoresSchmores.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(ChoresSchmores.ErrorView, "404.html", []) ==
           "Doh! Nothing to see here!"
  end

  test "render 500.html" do
    assert render_to_string(ChoresSchmores.ErrorView, "500.html", []) ==
           "Ugghh! We did something wrong :("
  end

  test "render any other" do
    assert render_to_string(ChoresSchmores.ErrorView, "505.html", []) ==
           "Ugghh! We did something wrong :("
  end
end

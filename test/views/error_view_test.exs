defmodule Peepchat.ErrorViewTest do
  use Peepchat.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 401.json" do
    assert render(Peepchat.ErrorView, "401.json", []) ==
           %{"errors" => [%{code: 401, title: "Unauthorized"}], "jsonapi" => %{"version" => "1.0"}}
  end

  test "renders 403.json" do
    assert render(Peepchat.ErrorView, "403.json", []) ==
           %{"errors" => [%{code: 403, title: "Forbidden"}], "jsonapi" => %{"version" => "1.0"}}
  end

  test "renders 404.json" do
    assert render(Peepchat.ErrorView, "404.json", []) ==
           %{"errors" => [%{code: 404, title: "Not Found"}], "jsonapi" => %{"version" => "1.0"}}
  end

  test "render 500.json" do
    assert render(Peepchat.ErrorView, "500.json", []) ==
           %{"errors" => [%{code: 500, title: "Internal Server Error"}], "jsonapi" => %{"version" => "1.0"}}
  end

  test "render any other" do
    assert render(Peepchat.ErrorView, "505.json", []) ==
           %{"errors" => [%{code: 500, title: "Internal Server Error"}], "jsonapi" => %{"version" => "1.0"}}
  end
end

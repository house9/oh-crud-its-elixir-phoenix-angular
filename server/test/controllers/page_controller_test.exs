defmodule OhCrud.PageControllerTest do
  use OhCrud.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Welcome to Phoenix!"
  end
end

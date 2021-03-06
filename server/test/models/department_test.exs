defmodule OhCrud.DepartmentTest do
  use OhCrud.ModelCase

  alias OhCrud.Department

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Department.changeset(%Department{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Department.changeset(%Department{}, @invalid_attrs)
    refute changeset.valid?
  end
end

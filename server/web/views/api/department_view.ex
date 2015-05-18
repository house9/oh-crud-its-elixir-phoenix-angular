defmodule OhCrud.Api.DepartmentView do
  use OhCrud.Web, :view

  def render("index.json", %{departments: departments}) do
    %{data: render_many(departments, OhCrud.Api.DepartmentView, "department.json")}
  end

  def render("show.json", %{department: department}) do
    %{data: render_one(department, OhCrud.Api.DepartmentView, "department.json")}
  end

  def render("department.json", %{department: department}) do
    %{id: department.id, name: department.name}
  end
end

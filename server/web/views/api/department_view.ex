defmodule OhCrud.Api.DepartmentView do
  use OhCrud.Web, :view

  def render("index.json", %{departments: departments}) do
    departments
  end

  def render("show.json", %{department: department}) do
    department
  end

  def render("department.json", %{department: department}) do
    %{id: department.id, name: department.name}
  end
end

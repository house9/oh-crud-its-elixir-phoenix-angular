defmodule OhCrud.Api.ProjectView do
  use OhCrud.Web, :view

  def render("index.json", %{projects: projects}) do
    projects
  end

  def render("show.json", %{project: project}) do
    project
  end
end

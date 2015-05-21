defmodule OhCrud.Api.ProjectController do
  use OhCrud.Web, :controller

  alias OhCrud.Project

  plug :scrub_params, "project" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    projects = Repo.all(Project)
    render conn, projects: projects
  end

  def create(conn, %{"project" => project_params}) do
    changeset = Project.changeset(%Project{}, project_params)

    if changeset.valid? do
      project = Repo.insert(changeset)

      conn
      |> render("show.json", project: project)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(OhCrud.ChangesetView, "error.json")
    end
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get(Project, id)
    render conn, project: project
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Repo.get(Project, id)
    changeset = Project.changeset(project, project_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_status(:no_content)
      |> text ""
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(OhCrud.ChangesetView, "error.json", changeset: changeset) # TODO:
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Repo.get(Project, id)
    Repo.delete(project)

    conn
    |> put_status(:no_content)
    |> text ""
  end
end

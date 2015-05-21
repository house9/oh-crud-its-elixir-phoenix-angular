defmodule OhCrud.Api.DepartmentController do
  use OhCrud.Web, :controller

  alias OhCrud.Department

  plug :scrub_params, "department" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    departments = Repo.all(Department)
    render(conn, "index.json", departments: departments)
  end

  def create(conn, %{"department" => department_params}) do
    changeset = Department.changeset(%Department{}, department_params)

    if changeset.valid? do
      department = Repo.insert(changeset)
      render(conn, "show.json", department: department)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(OhCrud.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    department = Repo.get(Department, id)
    render conn, "show.json", department: department
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = Repo.get(Department, id)
    changeset = Department.changeset(department, department_params)

    if changeset.valid? do
      department = Repo.update(changeset)
      render(conn, "show.json", department: department)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(OhCrud.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = Repo.get(Department, id)

    department = Repo.delete(department)
    render(conn, "show.json", department: department)
  end
end

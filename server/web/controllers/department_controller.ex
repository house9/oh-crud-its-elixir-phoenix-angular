defmodule OhCrud.DepartmentController do
  use OhCrud.Web, :controller

  alias OhCrud.Department

  plug :scrub_params, "department" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    departments = Repo.all(Department)
    render(conn, "index.html", departments: departments)
  end

  def new(conn, _params) do
    changeset = Department.changeset(%Department{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"department" => department_params}) do
    changeset = Department.changeset(%Department{}, department_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Department created successfully.")
      |> redirect(to: department_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    department = Repo.get(Department, id)
    render(conn, "show.html", department: department)
  end

  def edit(conn, %{"id" => id}) do
    department = Repo.get(Department, id)
    changeset = Department.changeset(department)
    render(conn, "edit.html", department: department, changeset: changeset)
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = Repo.get(Department, id)
    changeset = Department.changeset(department, department_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Department updated successfully.")
      |> redirect(to: department_path(conn, :index))
    else
      render(conn, "edit.html", department: department, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = Repo.get(Department, id)
    Repo.delete(department)

    conn
    |> put_flash(:info, "Department deleted successfully.")
    |> redirect(to: department_path(conn, :index))
  end
end

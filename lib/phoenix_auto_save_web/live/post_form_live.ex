defmodule PhoenixAutoSaveWeb.PostFormLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias PhoenixAutoSave.Posts
  alias PhoenixAutoSave.Posts.Post

  def render(assigns) do
    Phoenix.View.render(PhoenixAutoSaveWeb.PostView, "form.html", assigns)
  end

  def mount(_params, session, socket) do
    schedule_save()
    {
      :ok,
      socket
      |> assign(:changeset, session["changeset"])
      |> assign(:post, session["post"])
      |> assign(:action, session["action"])
    }
  end

  def handle_event("change", %{"post" => post_params}, socket) do
    {
      :noreply,
      socket
      |> assign(:changeset, Posts.change_post(socket.assigns.post, post_params))
    }
  end

  def handle_info(:store, socket) do
    {:ok, post} = Posts.update_post(socket.assigns.changeset)
    schedule_save()
    {
      :noreply,
      socket
      |> assign(:changeset, Posts.change_post(post))
      |> assign(:post, post)
    }
  end

  def terminate(_reason, socket) do
    {:ok, %Post{}} = Posts.update_post(socket.assigns.changeset)
    :ok
  end

  defp schedule_save() do
    Process.send_after(self(), :store, 10 * 1_000)
  end

end

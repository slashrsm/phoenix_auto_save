defmodule PhoenixAutoSaveWeb.PostFormLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias PhoenixAutoSave.Posts

  def render(assigns) do
    Phoenix.View.render(PhoenixAutoSaveWeb.PostView, "form.html", assigns)
  end

  def mount(_params, session, socket) do
    {
      :ok,
      socket
      |> assign(:changeset, session["changeset"])
      |> assign(:post, session["post"])
      |> assign(:action, session["action"])
    }
  end

  def handle_event("change", %{"post" => post_params}, socket) do
    {:ok, post} = Posts.update_post(socket.assigns.post, post_params)
    {
      :noreply,
      socket
      |> assign(:changeset, Posts.change_post(post))
      |> assign(:post, post)
    }
  end

end

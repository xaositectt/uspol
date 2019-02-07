defmodule Uspol.TestHelpers do
  alias Uspol.{Multimedia, Repo, User}

  # helper function to create fake users
  def user_fixture(attrs \\ %{}) do
    params =
      attrs
      |> Enum.into(%{
        first_name: "Leila",
        last_name: "Lowfire",
        email: "leila#{System.unique_integer([:positive])}@lowfire.com",
        token: "2u9dfh7979hfd",
        provider: "google"
      })

    {:ok, user} =
      User.changeset(%User{}, params)
      |> Repo.insert()

    user
  end

  def youtube_video_fixture(%Uspol.User{} = user, attrs \\ %{}) do
    video_params =
      attrs
      |> Enum.into(%{
        duration: "PT2M2S",
        thumbnail: "https://i.ytimg.com/vi/1rlSjdnAKY4/hqdefault.jpg",
        title: "Super Troopers (2/5) Movie CLIP - The Cat Game (2001) HD",
        video_id: "1rlSjdnAKY4",
        view_count: 658_281
      })

    {:ok, video} = Multimedia.create_video(user, video_params)

    video
  end
end

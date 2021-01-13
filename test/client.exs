defmodule ExGit.ClientTest do
  use ExUnit.Case

  import Tesla.Mock

  describe "get_repos_by_username/1" do
    test "when the user has repos, return the repos" do
      username = "Polidoro-root"

      response = [
        %{"id" => 1, "name" => "my repo 1"},
        %{"id" => 1, "name" => "my repo 1"}
      ]

      expected_response = {:ok, response}

      mock(fn %{method: :get, url: "https://api.github.com/users/Polidoro-root/repos"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert ExGit.Client.get_repos_by_username(username) == expected_response
    end
  end
end

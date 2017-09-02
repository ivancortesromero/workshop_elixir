defmodule Workshop.ChatTest do
  use Workshop.DataCase

  alias Workshop.Chat

  describe "logs" do
    alias Workshop.Chat.Log

    @valid_attrs %{message: "some message", user: "some user"}
    @update_attrs %{message: "some updated message", user: "some updated user"}
    @invalid_attrs %{message: nil, user: nil}

    def log_fixture(attrs \\ %{}) do
      {:ok, log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chat.create_log()

      log
    end

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Chat.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Chat.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      assert {:ok, %Log{} = log} = Chat.create_log(@valid_attrs)
      assert log.message == "some message"
      assert log.user == "some user"
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      assert {:ok, log} = Chat.update_log(log, @update_attrs)
      assert %Log{} = log
      assert log.message == "some updated message"
      assert log.user == "some updated user"
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_log(log, @invalid_attrs)
      assert log == Chat.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Chat.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Chat.change_log(log)
    end
  end
end

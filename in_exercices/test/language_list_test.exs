defmodule LanguageListTest do
  use ExUnit.Case

  test "check if new returns an empty list" do
   assert LanguageList.new() == []
  end

  test "add a language to a list" do
   language = "Elixir"
   list = [language]
   assert LanguageList.new() |> LanguageList.add(language) == list
  end

  test "add several languages to a list" do
    list = LanguageList.new() |> LanguageList.add("Clojure") |> LanguageList.add("Haskell") |> LanguageList.add("Erlang") |> LanguageList.add("F#") |> LanguageList.add("Elixir")

    assert list == ["Elixir", "F#", "Erlang", "Haskell", "Clojure"]
  end

  test "remove languages" do
    list = LanguageList.new() |> LanguageList.add("Elixir") |> LanguageList.remove()
    list2 = LanguageList.new() |> LanguageList.add("F#") |> LanguageList.add("Elixir") |> LanguageList.remove()
    assert list == []
    assert list2 == ["F#"]
  end

  test "always return the first language" do
    first = LanguageList.new() |> LanguageList.add("Elixir") |> LanguageList.add("Prolog") |> LanguageList.add("F#") |> LanguageList.first()
    assert first == "F#"
  end

  test "the count of a multiple-item list is equal to its length" do
    count = LanguageList.new() |> LanguageList.add("Elixir") |> LanguageList.count()
    assert count == 1
  end

  test "determine if the list includes a functional language" do
    assert LanguageList.functional_list?(["Clojure", "Haskell", "Erlang", "F#", "Elixir"])
    refute LanguageList.functional_list?(["Java", "C", "JavaScript"])
  end

end

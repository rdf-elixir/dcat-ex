defmodule DCATTest do
  use DCAT.Test.Case
  doctest DCAT

  {properties, classes} = Enum.split_with(DCAT.NS.DCAT.__terms__(), &RDF.Utils.downcase?/1)
  @classes classes
  @properties properties

  describe "RDF.Vocabulary.Namespace compatibility" do
    Enum.each(@classes, fn class ->
      test "DCAT.#{class} can be resolved to a RDF.IRI" do
        assert DCAT
               |> Module.concat(unquote(class))
               |> RDF.iri() ==
                 DCAT.NS.DCAT
                 |> Module.concat(unquote(class))
                 |> RDF.iri()
      end
    end)

    Enum.each(@properties, fn property ->
      test "DCAT.#{property}/0" do
        assert apply(DCAT, unquote(property), []) ==
                 apply(DCAT.NS.DCAT, unquote(property), [])
      end

      test "DCAT.#{property}/2" do
        assert apply(DCAT, unquote(property), [EX.S, EX.O]) ==
                 apply(DCAT.NS.DCAT, unquote(property), [EX.S, EX.O])
      end

      test "DCAT.#{property}/1" do
        o = RDF.iri(EX.O)
        desc = apply(DCAT.NS.DCAT, unquote(property), [EX.S, o])
        assert apply(DCAT, unquote(property), [desc]) == [o]
      end
    end)

    test "__file__/0" do
      assert DCAT.__file__() == DCAT.NS.DCAT.__file__()
    end
  end
end

defmodule DCAT.RDFS.Class do
  @moduledoc """
  A Grax schema struct for `rdfs:Class`s.

  The schema is left empty and serves just as a placeholder.
  It should be replaced in the future with a proper schema
  from a dedicated RDFS package.
  Until then the information must be fetched manually from the
  additional statements.
  """

  use Grax.Schema

  alias RDF.NS.RDFS

  schema RDFS.Class do
  end
end

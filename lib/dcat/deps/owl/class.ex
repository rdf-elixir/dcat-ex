defmodule DCAT.OWL.Class do
  @moduledoc """
  A Grax schema struct for `owl:Class`s.

  The schema is left empty and serves just as a placeholder.
  It should be replaced in the future with a proper schema
  from a dedicated OWL package.
  Until then the information must be fetched manually from the
  additional statements.
  """

  use Grax.Schema

  alias RDF.NS.OWL

  schema OWL.Class < DCAT.RDFS.Class do
  end
end

defmodule DCAT do
  @moduledoc """
  Implementation of the W3C DCAT 3 vocabulary.

  The following features are provided:

  - The `DCAT` module acts as the `RDF.Vocabulary.Namespace` for the DCAT vocabulary.
  - Grax structures for all DCAT classes and their properties.

  See https://www.w3.org/TR/vocab-dcat-3/.
  """

  import RDF.Namespace

  act_as_namespace DCAT.NS.DCAT
end

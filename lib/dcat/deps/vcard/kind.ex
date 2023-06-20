defmodule DCAT.VCard.Kind do
  @moduledoc """
  A Grax schema struct for `vcard:Kind`s.

  The schema is left empty and serves just as a placeholder.
  It should be replaced in the future with a proper schema
  from a dedicated vCard package.
  Until then the information must be fetched manually from the
  additional statements.

  See <http://www.w3.org/TR/vcard-rdf/#Kind>.
  """

  use Grax.Schema

  alias DCAT.NS.VCard

  schema VCard.Kind do
  end
end

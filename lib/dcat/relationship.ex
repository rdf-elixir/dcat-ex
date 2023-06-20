defmodule DCAT.Relationship do
  @moduledoc """
  A Grax schema struct for `dcat:Relationship`s.

  > An association class for attaching additional information to a relationship
  > between DCAT Resources.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Relationship>.
  """

  use Grax.Schema

  alias DCAT.NS.DCTerms

  schema DCAT.Relationship < PROV.EntityInfluence do
    # The resource related to the source resource.
    link relation: DCTerms.relation(), type: DCAT.Resource

    # The function of an entity or agent with respect to another entity or resource.
    link had_role: DCAT.hadRole(), type: DCAT.Role
  end
end

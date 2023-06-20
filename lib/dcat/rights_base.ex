defmodule DCAT.RightsBase do
  @moduledoc """
  Shared properties for licenses and rights.

  See <https://www.w3.org/TR/vocab-dcat-3/#license-rights>
  """

  use Grax.Schema

  alias DCAT.NS.{DCTerms, ODRL}

  schema do
    # A legal document under which the resource is made available.
    property licenses: DCTerms.license(), type: list_of(:iri)

    # A statement that concerns all rights not addressed with dcterms:license
    # or dcterms:accessRights, such as copyright statements.
    link rights: DCTerms.rights(), type: DCAT.DCTerms.RightsStatement

    # Information about who can access the resource or an indication of its security status.
    link access_rights: DCTerms.accessRights(), type: DCAT.DCTerms.RightsStatement

    # An ODRL conformant policy expressing the rights associated with the resource.
    link has_policy: ODRL.hasPolicy(), type: list_of(DCAT.ODRL.Policy)
  end
end

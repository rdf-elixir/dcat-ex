defmodule DCAT.CatalogRecord do
  @moduledoc """
  A Grax schema struct for `dcat:CatalogRecord`s.

  > A record in a catalog, describing the registration of a single `DCAT.Resource`.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Catalog_Record>.
  """

  use Grax.Schema

  alias DCAT.NS.DCTerms

  schema DCAT.CatalogRecord do
    property title: DCTerms.title(), type: :string
    property description: DCTerms.description(), type: :string

    link primary_topic: FOAF.primaryTopic(), type: DCAT.Resource

    property listing_date: DCTerms.issued(), type: :date
    property update_date: DCTerms.modified(), type: :date

    property conforms_to: DCTerms.conformsTo(), type: list_of(:iri)
  end
end

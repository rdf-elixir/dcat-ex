defmodule DCAT.Catalog do
  @moduledoc """
  A Grax schema struct for `dcat:Catalog`s.

  > A curated collection of metadata about resources.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Catalog>.
  """

  use Grax.Schema

  schema DCAT.Catalog < DCAT.Dataset do
    link homepages: FOAF.homepage(), type: list_of(FOAF.Document)

    link theme_taxonomies: DCAT.themeTaxonomy(),
         type: list_of([SKOS.ConceptScheme, {nil, DCAT.RDFS.Resource}])

    link resources: DCAT.resource(), type: list_of(DCAT.Resource)
    link datasets: DCAT.dataset(), type: list_of(DCAT.Dataset)
    link catalogs: DCAT.catalog(), type: list_of(DCAT.Catalog)
    link services: DCAT.service(), type: list_of(DCAT.DataService)
    link records: DCAT.record(), type: list_of(DCAT.CatalogRecord)
  end
end

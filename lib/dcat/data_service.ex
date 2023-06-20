defmodule DCAT.DataService do
  @moduledoc """
  A Grax schema struct for the `dcat:DataService` class.

  > A collection of operations that provides access to one or more datasets
  > or data processing functions.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Data_Service>.
  """

  use Grax.Schema

  schema DCAT.DataService < DCAT.Resource do
    property endpoint_url: DCAT.endpointURL(), type: :iri
    property endpoint_description: DCAT.endpointDescription(), type: :iri

    link serves_dataset: DCAT.servesDataset(), type: list_of(DCAT.Dataset)
  end
end

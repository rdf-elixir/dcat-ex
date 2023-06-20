defmodule DCAT.DatasetSeries do
  @moduledoc """
  A Grax schema struct for `dcat:DatasetSeries`s.

  > A collection of datasets that are published separately, but share some
  > characteristics that group them.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset_Series>.
  """

  use Grax.Schema

  schema DCAT.DatasetSeries < DCAT.Dataset do
  end
end

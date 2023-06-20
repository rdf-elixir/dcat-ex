defmodule DCAT.Dataset do
  @moduledoc """
  A Grax schema struct for `dcat:Dataset`s.

  > A collection of data, published or curated by a single agent, and
  > available for access or download in one or more representations.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset>.
  """

  use Grax.Schema

  alias DCAT.NS.DCTerms

  schema DCAT.Dataset < DCAT.Resource do
    # An available distribution of the dataset.
    link distributions: DCAT.distribution(), type: list_of(DCAT.Distribution)

    # An activity that generated, or provides the business context for, the creation of the dataset.
    link was_generated_by: PROV.wasGeneratedBy(), type: list_of(PROV.Activity)

    # A dataset series of which the dataset is part.
    link in_series: DCAT.inSeries(), type: list_of(DCAT.DatasetSeries)

    ###########################################################################################
    # Temporal

    # The frequency at which a dataset is published.
    link frequency: DCTerms.accrualPeriodicity(), type: DCAT.DCTerms.Frequency

    # The temporal period that the dataset covers.
    link temporal: DCTerms.temporal(), type: DCAT.DCTerms.PeriodOfTime, depth: +1

    ###########################################################################################
    # Spacial

    # The geographical area covered by the dataset.
    property spatial: DCTerms.spatial(), type: list_of(:iri)

    # Minimum spatial separation resolvable in a dataset, measured in meters.
    property spacial_resolution: DCAT.spatialResolutionInMeters(), type: :decimal
  end
end

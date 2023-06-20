defmodule DCAT.Distribution do
  @moduledoc """
  A Grax schema struct for `dcat:Distribution`s.

  > A specific representation of a dataset. A dataset might be available in
  > multiple serializations that may differ in various ways, including natural
  > language, media-type or format, schematic organization, temporal and
  > spatial resolution, level of detail or profiles (which might specify any
  > or all of the above).

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Distribution>.
  """

  use Grax.Schema

  alias DCAT.NS.{DCTerms, SPDX}

  schema DCAT.Distribution < DCAT.RightsBase do
    property title: DCTerms.title(), type: :string
    property description: DCTerms.description(), type: :string

    # Date of formal issuance (e.g., publication) of the distribution.
    property release_date: DCTerms.issued(), type: :date_time

    # Most recent date on which the distribution was changed, updated or modified.
    property update_date: DCTerms.modified(), type: :date_time

    # The minimum spatial separation resolvable in a dataset distribution, measured in meters.
    property spacial_resolution: DCAT.spatialResolutionInMeters(), type: :decimal

    property byte_size: DCAT.byteSize(), type: :any

    # The checksum property provides a mechanism that can be used to verify that
    # the contents of a file or package have not changed
    link checksum: SPDX.checksum(), type: DCAT.SPDX.Checksum

    ###########################################################################################
    # Access

    # The URL of the downloadable file in a given format. E.g., CSV file or
    # RDF file. The format is indicated by the distribution's dcterms:format
    # and/or dcat:mediaType
    property download_urls: DCAT.downloadURL(), type: list_of(:iri)

    # A URL of the resource that gives access to a distribution of the dataset.
    # E.g., landing page, feed, SPARQL endpoint.
    property access_urls: DCAT.accessURL(), type: list_of(:iri)

    # A data service that gives access to the distribution of the dataset.
    link access_services: DCAT.accessService(), type: list_of(DCAT.DataService)

    ###########################################################################################
    # Formats

    # The file format of the distribution.
    property format: DCTerms.format(), type: :iri

    # The media type of the distribution as defined by IANA.
    property media_type: DCAT.mediaType(), type: :iri

    # The compression format of the distribution in which the data is contained
    # in a compressed form
    property compression_format: DCAT.compressFormat(), type: :iri

    # The package format of the distribution in which one or more data files are
    # grouped together
    property package_format: DCAT.packageFormat(), type: :iri

    # An established standard to which the described resource conforms.
    property conforms_to: DCTerms.conformsTo(), type: list_of(:iri)
  end
end

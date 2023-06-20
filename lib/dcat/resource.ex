defmodule DCAT.Resource do
  @moduledoc """
  A Grax schema struct for `dcat:Resource`s.

  > Resource published or curated by a single agent.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Resource>.
  """

  use Grax.Schema

  alias DCAT.NS.{ADMS, DCTerms}

  schema DCAT.Resource < DCAT.RightsBase do
    property identifier: DCTerms.identifier(), type: :string
    property title: DCTerms.title(), type: :string
    property description: DCTerms.description(), type: :string

    # A keyword or tag describing the resource.
    property keywords: DCAT.keyword(), type: list_of(:string)

    # The nature or genre of the resource.
    link types: DCTerms.type(), type: list_of(DCAT.RDFS.Class)

    # A main category of the resource.
    link themes: DCAT.theme(),
         type: list_of([SKOS.Concept, DCAT.RDFS.Class, DCAT.OWL.Class, nil: DCAT.RDFS.Resource])

    # A language of the resource. This refers to the natural language used for textual
    # metadata (i.e., titles, descriptions, etc.) of a cataloged resource (i.e., dataset
    # or service) or the textual values of a dataset distribution
    property languages: DCTerms.language(), type: list_of(:iri)

    # An established standard to which the described resource conforms.
    property conforms_to: DCTerms.conformsTo(), type: list_of(:iri)

    ###########################################################################################
    # Attribution & Contacts

    # Relevant contact information for the cataloged resource.
    link contact_points: DCAT.contactPoint(), type: list_of(DCAT.VCard.Kind)

    # The entity responsible for producing the resource.
    link creators: DCTerms.creator(), type: list_of(FOAF.Agent)

    # The entity responsible for making the resource available.
    link publishers: DCTerms.publisher(), type: list_of(FOAF.Agent)

    # Link to an Agent having some form of responsibility for the resource.
    link qualified_attribution: PROV.qualifiedAttribution(), type: list_of(PROV.Attribution)

    ###########################################################################################
    # Relations

    # A Web page that can be navigated to in a Web browser to gain access to
    # the catalog, a dataset, its distributions and/or additional information.
    link landing_pages: DCAT.landingPage(), type: list_of(FOAF.Document)

    # A related resource, such as a publication, that references, cites, or otherwise points to the cataloged resource.
    property is_referenced_by: DCTerms.isReferencedBy(), type: list_of(:iri)

    # A related resource that is included either physically or logically in the described resource.
    property has_part: DCTerms.hasPart(), type: list_of(:iri)

    # A resource with an unspecified relationship to the cataloged resource.
    property relation: DCTerms.relation(), type: list_of(:iri)

    # Link to a description of a relationship with another resource
    link qualified_relation: DCAT.qualifiedRelation(), type: DCAT.Relationship

    ###########################################################################################
    # Versioning

    # Date of formal issuance (e.g., publication) of the resource.
    property release_date: DCTerms.issued(), type: :date

    # Most recent date on which the resource was changed, updated or modified.
    property update_date: DCTerms.modified(), type: :date

    # The status of the resource in the context of a particular workflow process.
    link status: ADMS.status(), type: SKOS.Concept

    # The version indicator (name or identifier) of a resource.
    property version: DCAT.version(), type: :string

    # A description of changes between this version and the previous version of the resource.
    property version_notes: ADMS.versionNotes(), type: :string

    # This resource has a more specific, versioned resource with equivalent content.
    property current_version: DCAT.hasCurrentVersion(), type: :iri

    # The previous version of a resource in a lineage.
    property previous_version: DCAT.previousVersion(), type: :iri

    # This resource has a more specific, versioned resource.
    property has_version: DCAT.hasVersion(), type: :iri

    # A related resource that is supplanted, displaced, or superseded by the described resource.
    property replaces: DCTerms.replaces(), type: :iri

    ###########################################################################################
    # License and rights statements - https://www.w3.org/TR/vocab-dcat-3/#license-rights

    # see DCAT.RightsBase
  end
end

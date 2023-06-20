defmodule DCAT.NS do
  @moduledoc """
  `RDF.Vocabulary.Namespace`s for the used vocabularies.
  """

  use RDF.Vocabulary.Namespace

  @vocabdoc """
  The Data Catalog (DCAT) vocabulary - Version 3.

  See <https://www.w3.org/TR/vocab-dcat-3/>
  """
  defvocab DCAT,
    base_iri: "http://www.w3.org/ns/dcat#",
    file: "dcat3.ttl",
    case_violations: :fail

  @vocabdoc """
  The Asset Description Metadata Schema.

  See <http://www.w3.org/TR/vocab-adms/>
  """
  defvocab ADMS,
    base_iri: "http://www.w3.org/ns/adms#",
    file: "adms.ttl",
    case_violations: :fail

  @vocabdoc """
  The Dublin Core Metadata Terms vocabulary.

  See <http://purl.org/dc/terms/>
  """
  defvocab DCTerms,
    base_iri: "http://purl.org/dc/terms/",
    file: "dcterms.nt",
    alias: [
      ISO639_2: "ISO639-2",
      ISO639_3: "ISO639-3"
    ],
    case_violations: :fail

  @vocabdoc """
  The vCard Ontology.

  See <https://www.w3.org/TR/vcard-rdf/>
  """
  defvocab VCard,
    base_iri: "http://www.w3.org/2006/vcard/ns#",
    file: "vcard.ttl",
    alias: [
      additional_name: "additional-name",
      country_name: "country-name",
      extended_address: "extended-address",
      family_name: "family-name",
      given_name: "given-name",
      honorific_suffix: "honorific-suffix",
      honorific_prefix: "honorific-prefix",
      organization_name: "organization-name",
      organization_unit: "organization-unit",
      postal_code: "postal-code",
      post_office_box: "post-office-box",
      street_address: "street-address",
      sort_string: "sort-string",
      # fn collides with Elixirs fn
      fn_: "fn"
    ],
    case_violations: :fail

  @vocabdoc """
  The SPDX vocabulary.

  See <http://spdx.org/rdf/terms>
  """
  defvocab SPDX,
    base_iri: "http://spdx.org/rdf/terms#",
    file: "spdx.ttl",
    case_violations: :ignore

  @vocabdoc """
  The ODRL Vocabulary.

  See <https://www.w3.org/TR/odrl-vocab/>
  """
  defvocab ODRL,
    base_iri: "http://www.w3.org/ns/odrl/2/",
    file: "odrl.ttl",
    alias: [
      or_: "or",
      and_: "and",
      assetRelations: "#assetRelations",
      assetRelationsCommon: "#assetRelationsCommon",
      permissions: "#permissions",
      actionsCommon: "#actionsCommon",
      partyRoles: "#partyRoles",
      constraintRelationalOperators: "#constraintRelationalOperators",
      partyConcepts: "#partyConcepts",
      logicalConstraints: "#logicalConstraints",
      conflictConcepts: "#conflictConcepts",
      constraintRightOpCommon: "#constraintRightOpCommon",
      policySubClassesCommon: "#policySubClassesCommon",
      constraints: "#constraints",
      assetParty: "#assetParty",
      partyRolesCommon: "#partyRolesCommon",
      ruleConcepts: "#ruleConcepts",
      deprecatedTerms: "#deprecatedTerms",
      constraintLeftOperandCommon: "#constraintLeftOperandCommon",
      actionConcepts: "#actionConcepts",
      policyConcepts: "#policyConcepts",
      assetConcepts: "#assetConcepts",
      duties: "#duties",
      constraintLogicalOperands: "#constraintLogicalOperands",
      actions: "#actions",
      prohibitions: "#prohibitions",
      policySubClasses: "#policySubClasses"
    ],
    case_violations: :ignore
end

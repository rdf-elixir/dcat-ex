defmodule DCAT.DXWGExamplesTest do
  use DCAT.Test.Case

  test "basic-example" do
    assert "basic-example.ttl"
           |> TestData.dxwg_example()
           |> RDF.read_file!()
           |> DCAT.Catalog.load(~I<https://dcat.example.org/catalog>) ==
             {
               :ok,
               %DCAT.Catalog{
                 __additional_statements__: %{
                   ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                     ~I<http://www.w3.org/ns/dcat#Catalog> => nil
                   },
                   ~I<http://www.w3.org/2000/01/rdf-schema#label> => %{
                     ~L"Imaginary Catalog"en => nil
                   }
                 },
                 __id__: ~I<https://dcat.example.org/catalog>,
                 title: "Imaginary Catalog",
                 homepages: [%FOAF.Document{__id__: ~I<http://dcat.example.org/catalog>}],
                 languages: [~I<http://id.loc.gov/vocabulary/iso639-1/en>],
                 publishers: [
                   %FOAF.Organization{
                     __additional_statements__: %{
                       ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                         ~I<http://xmlns.com/foaf/0.1/Organization> => nil
                       },
                       ~I<http://www.w3.org/2000/01/rdf-schema#label> => %{
                         ~L"Transparency Office"en => nil
                       }
                     },
                     __id__: ~I<https://dcat.example.org/transparency-office>
                   }
                 ],
                 datasets: [
                   %DCAT.Dataset{
                     __additional_statements__: %{
                       ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                         ~I<http://www.w3.org/ns/dcat#Dataset> => nil
                       },
                       ~I<http://www.w3.org/ns/dcat#temporalResolution> => %{
                         RDF.Literal.new("P1D",
                           datatype: "http://www.w3.org/2001/XMLSchema#duration"
                         ) => nil
                       }
                     },
                     __id__: ~I<https://dcat.example.org/dataset-001>,
                     frequency: ~I<http://purl.org/linked-data/sdmx/2009/code#freq-W>,
                     creators: [~I<https://dcat.example.org/finance-employee-001>],
                     release_date: ~D[2011-12-05],
                     languages: [~I<http://id.loc.gov/vocabulary/iso639-1/en>],
                     update_date: ~D[2011-12-15],
                     publishers: [~I<https://dcat.example.org/finance-ministry>],
                     spatial: [~I<http://sws.geonames.org/6695072/>],
                     temporal: %DCAT.DCTerms.PeriodOfTime{
                       __id__: ~B<b0>,
                       end_date: ~D[2011-09-30],
                       start_date: ~D[2011-07-01]
                     },
                     title: "Imaginary dataset",
                     contact_points: [~I<http://dcat.example.org/transparency-office/contact>],
                     distributions: [~I<https://dcat.example.org/dataset-001-csv>],
                     keywords: ["accountability", "payments", "transparency"],
                     spacial_resolution: Decimal.new("30.0")
                   },
                   %DCAT.Dataset{__id__: ~I<https://dcat.example.org/dataset-002>},
                   %DCAT.Dataset{__id__: ~I<https://dcat.example.org/dataset-003>}
                 ]
               }
             }

    assert "basic-example.ttl"
           |> TestData.dxwg_example()
           |> RDF.read_file!()
           |> DCAT.Dataset.load(~I<https://dcat.example.org/dataset-001>) ==
             {:ok,
              %DCAT.Dataset{
                __additional_statements__: %{
                  ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                    ~I<http://www.w3.org/ns/dcat#Dataset> => nil
                  },
                  ~I<http://www.w3.org/ns/dcat#temporalResolution> => %{
                    RDF.Literal.new("P1D",
                      datatype: "http://www.w3.org/2001/XMLSchema#duration"
                    ) => nil
                  }
                },
                __id__: ~I<https://dcat.example.org/dataset-001>,
                frequency: %DCAT.DCTerms.Frequency{
                  __id__: ~I<http://purl.org/linked-data/sdmx/2009/code#freq-W>
                },
                creators: [
                  %FOAF.Agent{
                    __id__: ~I<https://dcat.example.org/finance-employee-001>
                  }
                ],
                release_date: ~D[2011-12-05],
                languages: [~I<http://id.loc.gov/vocabulary/iso639-1/en>],
                update_date: ~D[2011-12-15],
                publishers: [
                  %FOAF.Agent{
                    __id__: ~I<https://dcat.example.org/finance-ministry>
                  }
                ],
                spatial: [~I<http://sws.geonames.org/6695072/>],
                temporal: %DCAT.DCTerms.PeriodOfTime{
                  __id__: ~B<b0>,
                  end_date: ~D[2011-09-30],
                  start_date: ~D[2011-07-01]
                },
                title: "Imaginary dataset",
                contact_points: [
                  %DCAT.VCard.Kind{
                    __id__: ~I<http://dcat.example.org/transparency-office/contact>
                  }
                ],
                distributions: [
                  %DCAT.Distribution{
                    __id__: ~I<https://dcat.example.org/dataset-001-csv>,
                    title: "CSV distribution of imaginary dataset 001",
                    byte_size: Decimal.new("5120.0"),
                    download_urls: [~I<http://dcat.example.org/files/001.csv>],
                    media_type: ~I<https://www.iana.org/assignments/media-types/text/csv>
                  }
                ],
                keywords: ["accountability", "payments", "transparency"],
                spacial_resolution: Decimal.new("30.0")
              }}
  end

  test "catalog-record" do
    assert "catalog-record.ttl"
           |> TestData.dxwg_example()
           |> RDF.read_file!()
           |> DCAT.Catalog.load(~I<https://dcat.example.org/catalog>) ==
             {
               :ok,
               %DCAT.Catalog{
                 __id__: ~I<https://dcat.example.org/catalog>,
                 records: [
                   %DCAT.CatalogRecord{
                     __id__: ~I<https://dcat.example.org/record-001>,
                     listing_date: ~D[2011-12-11],
                     primary_topic: ~I<https://dcat.example.org/dataset-001>
                   }
                 ]
               }
             }
  end

  test "classifying-thematically" do
    classifying_thematically_graph =
      "classifying-thematically.ttl"
      |> TestData.dxwg_example()
      |> RDF.read_file!()

    assert DCAT.Catalog.load(classifying_thematically_graph, ~I<https://dcat.example.org/catalog>) ==
             {
               :ok,
               %DCAT.Catalog{
                 __id__: ~I<https://dcat.example.org/catalog>,
                 theme_taxonomies: [
                   %SKOS.ConceptScheme{
                     __id__: ~I<https://dcat.example.org/themes>,
                     pref_label: "A set of domains to classify documents"
                   }
                 ]
               }
             }

    assert DCAT.Dataset.load(
             classifying_thematically_graph,
             ~I<https://dcat.example.org/dataset-001>
           ) ==
             {
               :ok,
               %DCAT.Dataset{
                 __id__: ~I<https://dcat.example.org/dataset-001>,
                 themes: [
                   %SKOS.Concept{
                     __id__: ~I<https://dcat.example.org/accountability>,
                     pref_label: "Accountability",
                     in_schemes: [~I<https://dcat.example.org/themes>]
                   }
                 ]
               }
             }
  end

  test "classifying-types" do
    classifying_types_graph =
      "classifying-types.ttl"
      |> TestData.dxwg_example()
      |> RDF.read_file!()

    assert DCAT.Dataset.load(
             classifying_types_graph,
             ~I<https://dcat.example.org/dataset-001-1>
           ) ==
             {
               :ok,
               %DCAT.Dataset{
                 __id__: ~I<https://dcat.example.org/dataset-001-1>,
                 types: [
                   %DCAT.RDFS.Class{
                     __id__: ~I<http://purl.org/dc/dcmitype/Dataset>
                   }
                 ]
               }
             }

    assert DCAT.Dataset.load(
             classifying_types_graph,
             ~I<https://dcat.example.org/dataset-001-2>
           ) ==
             {
               :ok,
               %DCAT.Dataset{
                 __id__: ~I<https://dcat.example.org/dataset-001-2>,
                 types: [
                   %DCAT.RDFS.Class{
                     __id__: ~I<http://id.loc.gov/vocabulary/marcgt/dtb>
                   }
                 ]
               }
             }

    assert DCAT.Dataset.load(
             classifying_types_graph,
             ~I<https://dcat.example.org/dataset-001-3>
           ) ==
             {
               :ok,
               %DCAT.Dataset{
                 __id__: ~I<https://dcat.example.org/dataset-001-3>,
                 types: [
                   %DCAT.RDFS.Class{__id__: ~I<http://id.loc.gov/vocabulary/marcgt/dtb>},
                   %DCAT.RDFS.Class{__id__: ~I<http://purl.org/dc/dcmitype/Dataset>},
                   %DCAT.RDFS.Class{
                     __id__: ~I<http://registry.it.csiro.au/def/datacite/resourceType/Dataset>
                   },
                   %DCAT.RDFS.Class{
                     __id__: ~I<http://registry.it.csiro.au/def/re3data/contentType/database>
                   }
                 ]
               }
             }
  end

  test "compress-and-package" do
    assert "compress-and-package.ttl"
           |> TestData.dxwg_example()
           |> RDF.read_file!()
           |> DCAT.Distribution.load(~I<https://data.gov.cz/zdroj/datová-sada/247025684/22>) ==
             {
               :ok,
               %DCAT.Distribution{
                 __id__: ~I<https://data.gov.cz/zdroj/datová-sada/247025684/22>,
                 compression_format:
                   ~I<http://www.iana.org/assignments/media-types/application/gzip>,
                 conforms_to: [~I<https://mvcr1.opendata.cz/czechpoint/2007.json>],
                 download_urls: [
                   ~I<https://mvcr1.opendata.cz/czechpoint/2007.csv.gz>,
                   ~I<https://mvcr1.opendata.cz/czechpoint/data.tar>,
                   ~I<https://mvcr1.opendata.cz/czechpoint/data.tar.gz>
                 ],
                 format: ~I<http://publications.europa.eu/resource/authority/file-type/CSV>,
                 licenses: [~I<https://data.gov.cz/podmínky-užití/volný-přístup/>],
                 media_type: ~I<http://www.iana.org/assignments/media-types/text/csv>,
                 package_format:
                   ~I<http://publications.europa.eu/resource/authority/file-type/TAR>
               }
             }
  end

  test "dataset-002" do
    assert "dataset-002.ttl"
           |> TestData.dxwg_example()
           |> RDF.read_file!()
           |> DCAT.Dataset.load(~I<http://dcat.example.org/dataset-002>) ==
             {
               :ok,
               %DCAT.Dataset{
                 __id__: ~I<http://dcat.example.org/dataset-002>,
                 distributions: [
                   %DCAT.Distribution{
                     __id__: ~I<http://dcat.example.org/dataset-002-csv>,
                     access_urls: [~I<http://example.org/dataset-002.html>],
                     media_type: ~I<https://www.iana.org/assignments/media-types/text/csv>
                   }
                 ],
                 landing_pages: [%FOAF.Document{__id__: ~I<http://example.org/dataset-002.html>}]
               }
             }
  end

  test "dataset-003" do
    assert "dataset-003.ttl"
           |> TestData.dxwg_example()
           |> RDF.read_file!()
           |> DCAT.Dataset.load(~I<http://dcat.example.org/dataset-003>) ==
             {
               :ok,
               %DCAT.Dataset{
                 __id__: ~I<http://dcat.example.org/dataset-003>,
                 distributions: [
                   %DCAT.Distribution{
                     __id__: ~I<http://dcat.example.org/dataset-003-csv>,
                     download_urls: [~I<http://example.org/dataset-003.csv>],
                     media_type: ~I<https://www.iana.org/assignments/media-types/text/csv>
                   }
                 ],
                 landing_pages: [%FOAF.Document{__id__: ~I<http://example.org/dataset-003.html>}]
               }
             }
  end

  test "dataset-004" do
    assert "dataset-004.ttl"
           |> TestData.dxwg_example()
           |> RDF.read_file!()
           |> DCAT.Dataset.load(~I<http://dcat.example.org/dataset-004#dataset-004>, depth: 2) ==
             {
               :ok,
               %DCAT.Dataset{
                 __id__: ~I<http://dcat.example.org/dataset-004#dataset-004>,
                 distributions: [
                   %DCAT.Distribution{
                     __id__: ~I<http://dcat.example.org/dataset-004#dataset-004-csv>,
                     access_urls: [~I<http://dcat.example.org/api/table-005>],
                     access_services: [
                       %DCAT.DataService{
                         __id__: ~I<http://dcat.example.org/dataset-004#table-service-005>,
                         conforms_to: [~I<http://dcat.example.org/apidef/table/v2.2>],
                         endpoint_description:
                           ~I<http://dcat.example.org/api/table-005/capability>,
                         endpoint_url: ~I<http://dcat.example.org/api/table-005>,
                         serves_dataset: [~I<http://dcat.example.org/dataset-004#dataset-004>],
                         types: [
                           ~I<https://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceType/download>
                         ]
                       }
                     ],
                     media_type: ~I<https://www.iana.org/assignments/media-types/text/csv>
                   },
                   %DCAT.Distribution{
                     __id__: ~I<http://dcat.example.org/dataset-004#dataset-004-png>,
                     access_urls: [~I<http://dcat.example.org/api/figure-006>],
                     access_services: [
                       %DCAT.DataService{
                         __id__: ~I<http://dcat.example.org/dataset-004#figure-service-006>,
                         conforms_to: [~I<http://dcat.example.org/apidef/figure/v1.0>],
                         endpoint_description: ~I<http://dcat.example.org/api/figure-006/params>,
                         endpoint_url: ~I<http://dcat.example.org/api/figure-006>,
                         serves_dataset: [~I<http://dcat.example.org/dataset-004#dataset-004>],
                         types: [
                           ~I<https://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceType/view>
                         ]
                       }
                     ],
                     media_type: ~I<https://www.iana.org/assignments/media-types/image/png>
                   }
                 ]
               }
             }
  end

  test "eea-csw" do
    eea_csw_graph =
      "eea-csw.ttl"
      |> TestData.dxwg_example()
      |> RDF.read_file!()

    data_service = %DCAT.DataService{
      __additional_statements__: %{
        ~I<http://purl.org/dc/elements/1.1/subject> => %{
          ~L"infoCatalogueService"en => nil
        },
        ~I<http://purl.org/dc/terms/spatial> => %{~B<b0> => nil},
        ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
          ~I<http://www.w3.org/ns/dcat#DataService> => nil
        }
      },
      __id__: ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint>,
      endpoint_description:
        ~I<https://sdi.eea.europa.eu/catalogue/srv/eng/csw?service=CSW&request=GetCapabilities>,
      licenses: [~I<https://creativecommons.org/licenses/by/2.5/dk/>],
      description:
        "The EEA public catalogue of spatial datasets references the spatial datasets used by the European Environment Agency as well as the spatial datasets produced by or for the EEA. In the latter case, when datasets are publicly available, a link to the location from where they can be downloaded is included in the dataset's metadata. The catalogue has been initially populated with the most important spatial datasets already available on the data&maps section of the EEA website and is currently updated with any newly published spatial dataset.",
      title: "European Environment Agency's public catalogue of spatial datasets.",
      release_date: ~D[2012-01-01],
      conforms_to: [~I<http://www.opengis.net/def/serviceType/ogc/csw>],
      endpoint_url: ~I<http://sdi.eea.europa.eu/catalogue/srv/eng/csw>,
      types: [
        ~I<http://inspire.ec.europa.eu/metadata-codelist/ResourceType/service>,
        ~I<http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceType/discovery>
      ],
      identifier: "eea-sdi-public-catalogue",
      access_rights: ~I<http://publications.europa.eu/resource/authority/access-right/PUBLIC>,
      contact_points: [~I<http://dcat.example.org/eea-csw/EEA>]
    }

    assert DCAT.Catalog.load(eea_csw_graph, ~I<http://dcat.example.org/eea-csw/CatalogA>) ==
             {
               :ok,
               %DCAT.Catalog{
                 __id__: ~I<http://dcat.example.org/eea-csw/CatalogA>,
                 records: [
                   %DCAT.CatalogRecord{
                     __additional_statements__: %{
                       ~I<http://purl.org/dc/terms/identifier> => %{
                         ~L"4be5cb08-e082-426a-9c57-8a53d7cd3f65" => nil
                       },
                       ~I<http://purl.org/dc/terms/language> => %{
                         ~I<http://publications.europa.eu/resource/authority/language/ENG> => nil
                       },
                       ~I<http://purl.org/dc/terms/source> => %{
                         ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint-SourceRecord> => nil
                       },
                       ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                         ~I<http://www.w3.org/ns/dcat#CatalogRecord> => nil
                       },
                       ~I<http://www.w3.org/ns/dcat#contactPoint> => %{
                         ~I<http://dcat.example.org/eea-csw/EEA> => nil
                       }
                     },
                     __id__: ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint-Record>,
                     conforms_to: [~I<http://data.europa.eu/930>],
                     primary_topic: ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint>,
                     update_date: ~D[2012-05-21]
                   }
                 ],
                 services: [data_service]
               }
             }

    assert DCAT.DataService.load(
             eea_csw_graph,
             ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint>
           ) ==
             {
               :ok,
               %DCAT.DataService{
                 __additional_statements__: %{
                   ~I<http://purl.org/dc/elements/1.1/subject> => %{
                     ~L"infoCatalogueService"en => nil
                   },
                   ~I<http://purl.org/dc/terms/spatial> => %{~B<b0> => nil},
                   ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                     ~I<http://www.w3.org/ns/dcat#DataService> => nil
                   }
                 },
                 __id__: ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint>,
                 endpoint_description:
                   ~I<https://sdi.eea.europa.eu/catalogue/srv/eng/csw?service=CSW&request=GetCapabilities>,
                 licenses: [~I<https://creativecommons.org/licenses/by/2.5/dk/>],
                 description:
                   "The EEA public catalogue of spatial datasets references the spatial datasets used by the European Environment Agency as well as the spatial datasets produced by or for the EEA. In the latter case, when datasets are publicly available, a link to the location from where they can be downloaded is included in the dataset's metadata. The catalogue has been initially populated with the most important spatial datasets already available on the data&maps section of the EEA website and is currently updated with any newly published spatial dataset.",
                 title: "European Environment Agency's public catalogue of spatial datasets.",
                 release_date: ~D[2012-01-01],
                 conforms_to: [~I<http://www.opengis.net/def/serviceType/ogc/csw>],
                 endpoint_url: ~I<http://sdi.eea.europa.eu/catalogue/srv/eng/csw>,
                 types: [
                   %DCAT.RDFS.Class{
                     __id__:
                       ~I<http://inspire.ec.europa.eu/metadata-codelist/ResourceType/service>
                   },
                   %DCAT.RDFS.Class{
                     __id__:
                       ~I<http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceType/discovery>
                   }
                 ],
                 identifier: "eea-sdi-public-catalogue",
                 access_rights: %DCAT.DCTerms.RightsStatement{
                   __id__:
                     ~I<http://publications.europa.eu/resource/authority/access-right/PUBLIC>
                 },
                 contact_points: [
                   %DCAT.VCard.Kind{
                     __additional_statements__: %{
                       ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                         ~I<http://www.w3.org/2006/vcard/ns#Kind> => nil,
                         ~I<http://www.w3.org/2006/vcard/ns#Organization> => nil
                       },
                       ~I<http://www.w3.org/2006/vcard/ns#hasEmail> => %{
                         ~I<mailto:info@eea.europa.eu> => nil
                       },
                       ~I<http://www.w3.org/2006/vcard/ns#hasURL> => %{
                         ~I<http://www.eea.europa.eu> => nil
                       },
                       ~I<http://www.w3.org/2006/vcard/ns#organization-name> => %{
                         ~L"European Environment Agency"en => nil
                       }
                     },
                     __id__: ~I<http://dcat.example.org/eea-csw/EEA>
                   }
                 ]
               }
             }

    assert DCAT.CatalogRecord.load(
             eea_csw_graph,
             ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint-Record>
           ) ==
             {
               :ok,
               %DCAT.CatalogRecord{
                 __additional_statements__: %{
                   ~I<http://purl.org/dc/terms/identifier> => %{
                     ~L"4be5cb08-e082-426a-9c57-8a53d7cd3f65" => nil
                   },
                   ~I<http://purl.org/dc/terms/language> => %{
                     ~I<http://publications.europa.eu/resource/authority/language/ENG> => nil
                   },
                   ~I<http://purl.org/dc/terms/source> => %{
                     ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint-SourceRecord> => nil
                   },
                   ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                     ~I<http://www.w3.org/ns/dcat#CatalogRecord> => nil
                   },
                   ~I<http://www.w3.org/ns/dcat#contactPoint> => %{
                     ~I<http://dcat.example.org/eea-csw/EEA> => nil
                   }
                 },
                 __id__: ~I<http://dcat.example.org/eea-csw/EEA-CSW-Endpoint-Record>,
                 conforms_to: [~I<http://data.europa.eu/930>],
                 primary_topic: data_service,
                 update_date: ~D[2012-05-21]
               }
             }
  end

  test "service1" do
    service1_graph =
      "service1.ttl"
      |> TestData.dxwg_example()
      |> RDF.read_file!()

    assert DCAT.Catalog.load(service1_graph, ~I<http://dcat.example.org/MyCatalog>) ==
             {
               :ok,
               %DCAT.Catalog{
                 __id__: ~I<http://dcat.example.org/MyCatalog>,
                 records: [
                   %DCAT.CatalogRecord{
                     __additional_statements__: %{
                       ~I<http://purl.org/dc/terms/identifier> => %{
                         ~L"4be5cb08-e082-426a-9c57-8a53d7cd3f65" => nil
                       },
                       ~I<http://purl.org/dc/terms/language> => %{
                         ~I<http://publications.europa.eu/resource/authority/language/ENG> => nil
                       },
                       ~I<http://purl.org/dc/terms/source> => %{
                         ~I<http://dcat.example.org/EEA-CSW-Endpoint-SourceRecord> => nil
                       },
                       ~I<http://www.w3.org/ns/dcat#contactPoint> => %{
                         ~I<http://dcat.example.org/EEA> => nil
                       },
                       ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                         ~I<http://www.w3.org/ns/dcat#CatalogRecord> => nil
                       }
                     },
                     __id__: ~I<http://dcat.example.org/EEA-CSW-Endpoint-Record>,
                     conforms_to: [~I<http://data.europa.eu/930>],
                     primary_topic: ~I<http://dcat.example.org/EEA-CSW-Endpoint>,
                     update_date: ~D[2012-05-21]
                   }
                 ],
                 services: [
                   %DCAT.DataService{__id__: ~I<http://sdi.eea.europa.eu/catalogue/srv/eng/csw>}
                 ]
               }
             }

    assert DCAT.DataService.load(
             service1_graph,
             ~I<http://dcat.example.org/EEA-CSW-Endpoint>
           ) ==
             {
               :ok,
               %DCAT.DataService{
                 __additional_statements__: %{
                   ~I<http://purl.org/dc/elements/1.1/subject> => %{
                     ~L"infoCatalogueService"en => nil
                   },
                   ~I<http://purl.org/dc/terms/spatial> => %{~B<b0> => nil},
                   ~I<http://www.w3.org/ns/dcat#endPointLocation> => %{
                     ~I<http://sdi.eea.europa.eu/catalogue/> => nil
                   },
                   ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                     ~I<http://www.w3.org/ns/dcat#DataService> => nil
                   }
                 },
                 __id__: ~I<http://dcat.example.org/EEA-CSW-Endpoint>,
                 licenses: [~I<https://creativecommons.org/licenses/by/2.5/dk/>],
                 description:
                   "The EEA public catalogue of spatial datasets references the spatial datasets used by the European Environment Agency as well as the spatial datasets produced by or for the EEA. In the latter case, when datasets are publicly available, a link to the location from where they can be downloaded is included in the dataset's metadata. The catalogue has been initially populated with the most important spatial datasets already available on the data&maps section of the EEA website and is currently updated with any newly published spatial dataset.",
                 title: "European Environment Agency's public catalogue of spatial datasets.",
                 release_date: ~D[2012-01-01],
                 conforms_to: [~I<http://www.opengis.net/def/serviceType/ogc/csw>],
                 types: [
                   %DCAT.RDFS.Class{
                     __id__:
                       ~I<http://inspire.ec.europa.eu/metadata-codelist/ResourceType/service>
                   },
                   %DCAT.RDFS.Class{
                     __id__:
                       ~I<http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceType/discovery>
                   }
                 ],
                 identifier: "eea-sdi-public-catalogue",
                 access_rights: %DCAT.DCTerms.RightsStatement{
                   __id__:
                     ~I<http://publications.europa.eu/resource/authority/access-right/PUBLIC>
                 },
                 contact_points: [
                   %DCAT.VCard.Kind{
                     __additional_statements__: %{
                       ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                         ~I<http://www.w3.org/2006/vcard/ns#Kind> => nil,
                         ~I<http://xmlns.com/foaf/0.1/Organization> => nil
                       },
                       ~I<http://www.w3.org/2006/vcard/ns#hasEmail> => %{
                         ~I<mailto:info@eea.europa.eu> => nil
                       },
                       ~I<http://www.w3.org/2006/vcard/ns#hasURL> => %{
                         ~I<http://www.eea.europa.eu> => nil
                       },
                       ~I<http://www.w3.org/2006/vcard/ns#organization-name> => %{
                         ~L"European Environment Agency"en => nil
                       }
                     },
                     __id__: ~I<http://dcat.example.org/EEA>
                   }
                 ]
               }
             }

    assert DCAT.CatalogRecord.load(
             service1_graph,
             ~I<http://dcat.example.org/EEA-CSW-Endpoint-Record>
           ) ==
             {
               :ok,
               %DCAT.CatalogRecord{
                 __additional_statements__: %{
                   ~I<http://purl.org/dc/terms/identifier> => %{
                     ~L"4be5cb08-e082-426a-9c57-8a53d7cd3f65" => nil
                   },
                   ~I<http://purl.org/dc/terms/language> => %{
                     ~I<http://publications.europa.eu/resource/authority/language/ENG> => nil
                   },
                   ~I<http://purl.org/dc/terms/source> => %{
                     ~I<http://dcat.example.org/EEA-CSW-Endpoint-SourceRecord> => nil
                   },
                   ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                     ~I<http://www.w3.org/ns/dcat#CatalogRecord> => nil
                   },
                   ~I<http://www.w3.org/ns/dcat#contactPoint> => %{
                     ~I<http://dcat.example.org/EEA> => nil
                   }
                 },
                 __id__: ~I<http://dcat.example.org/EEA-CSW-Endpoint-Record>,
                 conforms_to: [~I<http://data.europa.eu/930>],
                 primary_topic: %DCAT.DataService{
                   __additional_statements__: %{
                     ~I<http://purl.org/dc/elements/1.1/subject> => %{
                       ~L"infoCatalogueService"en => nil
                     },
                     ~I<http://purl.org/dc/terms/spatial> => %{~B<b0> => nil},
                     ~I<http://www.w3.org/ns/dcat#endPointLocation> => %{
                       ~I<http://sdi.eea.europa.eu/catalogue/> => nil
                     },
                     ~I<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> => %{
                       ~I<http://www.w3.org/ns/dcat#DataService> => nil
                     }
                   },
                   __id__: ~I<http://dcat.example.org/EEA-CSW-Endpoint>,
                   licenses: [~I<https://creativecommons.org/licenses/by/2.5/dk/>],
                   description:
                     "The EEA public catalogue of spatial datasets references the spatial datasets used by the European Environment Agency as well as the spatial datasets produced by or for the EEA. In the latter case, when datasets are publicly available, a link to the location from where they can be downloaded is included in the dataset's metadata. The catalogue has been initially populated with the most important spatial datasets already available on the data&maps section of the EEA website and is currently updated with any newly published spatial dataset.",
                   title: "European Environment Agency's public catalogue of spatial datasets.",
                   release_date: ~D[2012-01-01],
                   conforms_to: [~I<http://www.opengis.net/def/serviceType/ogc/csw>],
                   types: [
                     ~I<http://inspire.ec.europa.eu/metadata-codelist/ResourceType/service>,
                     ~I<http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceType/discovery>
                   ],
                   identifier: "eea-sdi-public-catalogue",
                   access_rights:
                     ~I<http://publications.europa.eu/resource/authority/access-right/PUBLIC>,
                   contact_points: [~I<http://dcat.example.org/EEA>]
                 },
                 update_date: ~D[2012-05-21]
               }
             }
  end
end

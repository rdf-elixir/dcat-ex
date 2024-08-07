[![Hex.pm](https://img.shields.io/hexpm/v/dcat.svg?style=flat-square)](https://hex.pm/packages/dcat)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/dcat/)
[![License](https://img.shields.io/hexpm/l/dcat.svg)](https://github.com/rdf-elixir/dcat-ex/blob/main/LICENSE.md)

[![ExUnit Tests](https://github.com/rdf-elixir/dcat-ex/actions/workflows/elixir-build-and-test.yml/badge.svg)](https://github.com/rdf-elixir/dcat-ex/actions/workflows/elixir-build-and-test.yml)
[![Dialyzer](https://github.com/rdf-elixir/dcat-ex/actions/workflows/elixir-dialyzer.yml/badge.svg)](https://github.com/rdf-elixir/dcat-ex/actions/workflows/elixir-dialyzer.yml)
[![Quality Checks](https://github.com/rdf-elixir/dcat-ex/actions/workflows/elixir-quality-checks.yml/badge.svg)](https://github.com/rdf-elixir/dcat-ex/actions/workflows/elixir-quality-checks.yml)


# DCAT.ex

An implementation of the [W3C Data Catalog Vocabulary (DCAT) - Version 3](https://www.w3.org/TR/vocab-dcat-3/) vocabulary for Elixir as Grax schemas.

The API documentation can be found [here](https://hexdocs.pm/dcat/).
For more information about the RDF on Elixir projects, go to <https://rdf-elixir.dev>.


## Features

- The `DCAT` module acts as the `RDF.Vocabulary.Namespace` for the DCAT vocabulary
- Grax structures for all DCAT classes and their properties, for easy
  creation and manipulation of data catalogs, datasets, and data services
- Seamless integration with all RDF on Elixir projects


## Installation

Add `dcat` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:dcat, "~> 0.1"}
  ]
end
```

## Usage

```elixir
DCAT.Dataset.build!(EX.my_dataset(),
  title: "My Dataset",
  description: "This is a sample dataset",
  release_date: Date.utc_today(),
  publishers: [EX.my_org()],
  keywords: ["sample", "dataset", "example"],
  themes: [EX.sample_theme()]
) 
|> Grax.to_rdf!(prefixes: [dcat: DCAT, ex: EX, xsd: RDF.NS.XSD, dct: DCAT.NS.DCTerms]) 
|> RDF.Turtle.write_string!()
```

produces:

```turtle
@prefix dcat: <http://www.w3.org/ns/dcat#> .
@prefix dct: <http://purl.org/dc/terms/> .
@prefix ex: <http://example.com/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

ex:my_dataset
    a dcat:Dataset ;
    dct:title "My Dataset" ;
    dct:description "This is a sample dataset" ;
    dct:issued "2024-08-06"^^xsd:date ;
    dct:publisher ex:my_org ;
    dcat:keyword "dataset", "example", "sample" ;
    dcat:theme ex:sample_theme .
```


## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for details.


## Consulting

If you need help with your Elixir and Linked Data projects, just contact [NinjaConcept](https://www.ninjaconcept.com/) via <contact@ninjaconcept.com>.


## License and Copyright

(c) 2024 Marcel Otto. MIT Licensed, see [LICENSE](LICENSE.md) for details.

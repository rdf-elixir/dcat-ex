defmodule DCAT.DCTerms.Location do
  use Grax.Schema

  alias DCAT.NS.DCTerms

  schema DCTerms.Location do
    # The geographic bounding box of a spatial thing.
    property bbox: DCAT.bbox(), type: :any
    property centroid: DCAT.centroid(), type: :any
  end
end

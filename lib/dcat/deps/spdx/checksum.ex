defmodule DCAT.SPDX.Checksum do
  @moduledoc """
  A Grax schema struct for `spdx:checksum`s.

  See <https://spdx.org/rdf/terms/#d4e2091>.
  """

  use Grax.Schema

  alias DCAT.NS.SPDX

  schema SPDX.checksum() do
    property algorithm: SPDX.algorithm(), type: :iri
    property value: SPDX.checksumValue(), type: :string
  end
end

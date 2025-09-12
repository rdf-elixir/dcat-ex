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

  @doc """
  Compare two checksums for equality.

  Returns `true` if both checksums have the same algorithm and value, `false` otherwise.

  Checksum values are compared case-insensitively.

  Note: This function does not consider the identity of the given checksums.

  ## Examples

      iex> checksum1 = DCAT.SPDX.Checksum.build!(RDF.bnode(1), algorithm: DCAT.NS.SPDX.checksumAlgorithm_sha1(), value: "da39a3ee5e6b4b0d3255bfef95601890afd80709")
      iex> checksum2 = DCAT.SPDX.Checksum.build!(RDF.bnode(2), algorithm: DCAT.NS.SPDX.checksumAlgorithm_sha1(), value: "DA39A3EE5E6B4B0D3255BFEF95601890AFD80709")
      iex> DCAT.SPDX.Checksum.equal?(checksum1, checksum2)
      true
  """
  def equal?(
        %__MODULE__{algorithm: algorithm} = checksum1,
        %__MODULE__{algorithm: algorithm} = checksum2
      ) do
    values_equal?(checksum1.value, checksum2.value)
  end

  def equal?(%__MODULE__{}, %__MODULE__{}), do: false

  defp values_equal?(value1, value2) when is_binary(value1) and is_binary(value2) do
    String.downcase(value1) == String.downcase(value2)
  end

  defp values_equal?(value1, value2), do: value1 == value2
end

defmodule DCAT.SPDX.ChecksumTest do
  use DCAT.Test.Case

  doctest DCAT.SPDX.Checksum

  alias DCAT.SPDX.Checksum
  alias DCAT.NS.SPDX

  @value1 "da39a3ee5e6b4b0d3255bfef95601890afd80709"
  @value2 "356a192b7913b04c54574d18c28d46e6395428ab"

  describe "equal?/2" do
    test "returns true when both algorithm and value are equal, independent of the identity of the checksums" do
      checksum1 =
        Checksum.build!(~I<http://example.org/checksum1>,
          algorithm: SPDX.checksumAlgorithm_sha1(),
          value: @value1
        )

      checksum2 =
        Checksum.build!(~I<http://example.org/checksum2>,
          algorithm: SPDX.checksumAlgorithm_sha1(),
          value: @value1
        )

      assert Checksum.equal?(checksum1, checksum2) == true
    end

    test "returns false when algorithms differ" do
      checksum1 = %Checksum{algorithm: SPDX.checksumAlgorithm_sha1(), value: @value1}
      checksum2 = %Checksum{algorithm: SPDX.checksumAlgorithm_sha256(), value: @value1}

      assert Checksum.equal?(checksum1, checksum2) == false
    end

    test "returns false when values differ" do
      checksum1 = %Checksum{algorithm: SPDX.checksumAlgorithm_sha1(), value: @value1}
      checksum2 = %Checksum{algorithm: SPDX.checksumAlgorithm_sha1(), value: @value2}

      assert Checksum.equal?(checksum1, checksum2) == false
    end

    test "handles nil values in algorithm" do
      checksum = %Checksum{algorithm: nil, value: @value1}

      assert Checksum.equal?(checksum, checksum) == true
    end

    test "handles nil values in value" do
      checksum = %Checksum{algorithm: SPDX.checksumAlgorithm_sha1(), value: nil}

      assert Checksum.equal?(checksum, checksum) == true
    end

    test "compares checksum values case-insensitively" do
      checksum1 = %Checksum{algorithm: SPDX.checksumAlgorithm_sha1(), value: @value1}

      checksum2 = %Checksum{
        algorithm: SPDX.checksumAlgorithm_sha1(),
        value: String.upcase(@value1)
      }

      assert Checksum.equal?(checksum1, checksum2) == true
    end
  end
end

defmodule DCAT.Role do
  @moduledoc """
  A Grax schema struct for `dcat:Role`s.

  > A role is the function of a resource or agent with respect to another
  > resource, in the context of resource attribution or resource relationships.

  See <https://www.w3.org/TR/vocab-dcat-3/#Class:Role>.
  """

  use Grax.Schema

  schema DCAT.Role < SKOS.Concept do
  end
end

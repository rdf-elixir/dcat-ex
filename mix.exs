defmodule DCAT.MixProject do
  use Mix.Project

  def project do
    [
      app: :dcat,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      rdf_ex_dep(:rdf, "~> 1.2"),
      rdf_ex_dep(:grax, "~> 0.4"),
      rdf_ex_dep(:skos, "~> 0.1"),
      rdf_ex_dep(:foaf, "~> 0.1"),
      rdf_ex_dep(:prov, "~> 0.1")
    ]
  end

  defp rdf_ex_dep(dep, version) do
    case System.get_env("RDF_EX_PACKAGES_SRC") do
      "LOCAL" -> {dep, path: "../#{dep}"}
      _ -> {dep, version}
    end
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end

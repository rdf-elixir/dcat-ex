defmodule DCAT.DCTerms.PeriodOfTime do
  use Grax.Schema

  alias DCAT.NS.DCTerms

  schema DCTerms.PeriodOfTime do
    property start_date: DCAT.startDate(), type: :date
    property end_date: DCAT.endDate(), type: :date
  end
end

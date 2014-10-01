class PepsidocData

  attr_accessor :id, :severity, :likelihood, :advisory_id, :company,
  		:product, :affected_versions, :synopsis, :description,
  		:exploit, :solution, :attachment, :references, :issue_date

  def initialize(id)
    @id = id
  end
end
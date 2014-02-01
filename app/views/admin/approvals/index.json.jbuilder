json.array!(@approvals) do |approval|
  json.extract! approval, :id, :title, :description
  json.url approval_url(approval, format: :json)
end

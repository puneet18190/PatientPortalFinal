json.extract! report, :id, :name, :attachment, :created_at, :updated_at
json.url report_url(report, format: :json)
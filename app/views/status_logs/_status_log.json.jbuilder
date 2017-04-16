json.extract! status_log, :id, :status, :plane_id, :created_at, :updated_at
json.url status_log_url(status_log, format: :json)

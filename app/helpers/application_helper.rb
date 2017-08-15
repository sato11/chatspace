module ApplicationHelper
  def fetch_digested_file_name(original)
    REV_MANIFEST[original]
  end
end

rev_manifest_path = Rails.root.join('public', 'assets', 'rev-manifest.json')

if File.exists?(rev_manifest_path)
  REV_MANIFEST = JSON.parse(File.read(rev_manifest_path))
else
  raise 'manifest file is missing.'
end

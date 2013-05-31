module ActionView
  module Helpers
    module AssetTagHelper
      # Use the RAILS_ASSET_ID environment variable or the source's
      # modification time as its cache-busting asset id.
      def rails_asset_id(source)
        if asset_id = ENV["RAILS_ASSET_ID"]
          asset_id
          # the next line changed from
          # else
          # to
        elsif source.index(/(\.js|\.css)$/).nil?
          path = File.join(ASSETS_DIR, source)

          if File.exist?(path)
            File.mtime(path).to_i.to_s
          else
            ''
          end
        end
      end
    end
  end
end

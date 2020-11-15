require 'google/api_client'

class GaApi

    KEY_FILE = "#{Rails.root}/certificate/xxxxxxxxxxx.p12"
    ACCOUNT_EMAIL = "xxxxxxxxxxx@developer.gserviceaccount.com"
    KEY_SECRET = "xxxxxxxxxxx"
    VIEW_ID = "xxxxxxxxxxx"
    VERSION = "v3"
    CACHED_API_FILE = "#{Rails.root}/certificate/analytics-#{VERSION}.cache"

    def initialize
        @client = Google::APIClient.new(
            application_name: 'careyou'
        )
    end

    # Cache api file to avoide round-trip
    def api
        analytics = nil
        if File.exists? CACHED_API_FILE
            File.open(CACHED_API_FILE) do |file|
                analytics = Marshal.load(file)
            end
        else
            analytics = @client.discovered_api('analytics', VERSION)
            File.open(CACHED_API_FILE, 'w') do |file|
                Marshal.dump(analytics, file)
            end
        end
        analytics
    end

    def signing_key
        return if @signing_key
        @signing_key = Google::APIClient::KeyUtils.load_from_pkcs12(KEY_FILE, KEY_SECRET)
    end

    def authorize!
        @client.authorization = Signet::OAuth2::Client.new(
                  token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
                  audience: 'https://accounts.google.com/o/oauth2/token',
                  scope: 'https://www.googleapis.com/auth/analytics.readonly',
                  issuer: ACCOUNT_EMAIL,
                  signing_key: signing_key
        )
        @client.authorization.fetch_access_token!
    end

    def get_data(options = {})
    @client.execute(
      api_method: api.data.ga.get,
      parameters: {
        "ids" => "ga:#{VIEW_ID}",
        "start-date" => options[:start_date].to_s,
        "end-date" => options[:end_date].to_s,
        "metrics" => options[:metrics],
        "dimensions" => "ga:year,ga:month,ga:day",
        "sort" => "ga:year,ga:month,ga:day"
      }
    )
    end

end

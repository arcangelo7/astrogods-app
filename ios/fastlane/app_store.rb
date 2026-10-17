require "json"

APP_IDENTIFIER = "it.astrogods.AstroGods"
TEAM_ID = "YZUYBUSD2H"
REPO_ROOT = File.expand_path("../..", __dir__)
ANDROID_METADATA = File.join(REPO_ROOT, "android/fastlane/metadata/android")
WINDOWS_LISTINGS = JSON.parse(File.read(File.join(REPO_ROOT, "windows/metadata.json"), encoding: "UTF-8"))["Listings"]
VERSION, BUILD_NUMBER = File.read(File.join(REPO_ROOT, "pubspec.yaml"), encoding: "UTF-8")
                            .match(/^version: (\d+\.\d+\.\d+)\+(\d+)$/).captures
LOCALES = [
  { apple: "en-US", android: "en-US", windows: "en-us" },
  { apple: "it", android: "it-IT", windows: "it" }
]

def per_locale
  LOCALES.to_h { |locale| [locale[:apple], yield(locale)] }
end

def android_text(file)
  per_locale { |locale| File.read(File.join(ANDROID_METADATA, locale[:android], file), encoding: "UTF-8").strip }
end

def app_store_listing
  {
    metadata_path: File.join(__dir__, "metadata"),
    description: android_text("full_description.txt"),
    promotional_text: android_text("short_description.txt"),
    keywords: per_locale { |locale| WINDOWS_LISTINGS[locale[:windows]]["BaseListing"]["Keywords"].join(",") },
    copyright: WINDOWS_LISTINGS["en-us"]["BaseListing"]["CopyrightAndTrademarkInfo"]
  }
end

def released_on_app_store?(platform)
  Spaceship::ConnectAPI.token = Spaceship::ConnectAPI::Token.from_json_file(ENV.fetch("APP_STORE_CONNECT_API_KEY_PATH"))
  !Spaceship::ConnectAPI::App.find(APP_IDENTIFIER).get_live_app_store_version(platform: platform).nil?
end

# App Store rejects release notes on the first version of an app.
def app_store_release(platform)
  options = {
    **app_store_listing,
    app_version: VERSION,
    overwrite_screenshots: true,
    submit_for_review: true,
    automatic_release: true,
    submission_information: {
      export_compliance_uses_encryption: false,
      add_id_info_uses_idfa: false,
      content_rights_contains_third_party_content: false
    }
  }
  options[:release_notes] = android_text("changelogs/#{BUILD_NUMBER}.txt") if released_on_app_store?(platform)
  options
end

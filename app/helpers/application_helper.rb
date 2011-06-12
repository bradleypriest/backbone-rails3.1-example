module ApplicationHelper

  def include_javascripts(*packages)
    packages.map{|pack|
      should_package? ? Jammit.asset_url(pack, :js) : Jammit.packager.individual_urls(pack.to_sym, :js)
      }.flatten.map{|pack|
        javascript_include_tag pack
      }.join("\n").html_safe
  end
end

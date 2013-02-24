class Subdomain
  def self.matches?(request)
    #log = Logger.new(File.expand_path("#{Rails.root}/log/subdomain.log", __FILE__))
    #log.info("#{Time.now}: request.subdomain 1 = #{request.subdomain(1)}")
    request.subdomain(2).present? && request.subdomain(2) != "www" && request.subdomain(2) != ""
  end
end

class RootDomain
  @subdomains = ["www"]
  def self.matches?(request)
    @subdomains.include?(request.subdomain(2)) || request.subdomain(2).blank?
  end
end
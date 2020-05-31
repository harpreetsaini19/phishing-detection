class PhishTankChecker

  def check_url(url:)
    {result: Httpconnector::PhishTank.is_phish_url?(url: url)}
  end

end

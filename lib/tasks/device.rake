require "services/rake_logger"

namespace :device do
  desc "Register device to portal"
  task register: :environment do

    rake_log = Services::RakeLogger.rails_log
    # rake_log = Rails.logger

    rake_log.info Rails.env
    
    url = Settings.rake.portal.api_domain + Settings.rake.portal.device.register.path

    rake_log.info url

    params = {
      mac_address: '0023F8311041',
      serial_number: 'TEMPSERIALNUM0000',
      model_name: 'NAS540',
      firmware_version: '540_datecode_20150615_myZyXELCloud-Agent_1.0.0',
      signature: Settings.rake.portal.device.register.TEMPSERIALNUM0000.signature,
      algo: '1',
      certificate_serial: '1002',
      module: '[{"name":"DDNS", "ver":"1" }, {"name":"pairing", "ver":"button"}, {"name":"upnp", "ver":"2" }, {"name":"indicator", "ver":"1" }, {"name":"package", "ver":"1" }]'
    }
      
    data = RestClient.post( url, params )
    data = JSON.parse(data)
    rake_log.info data
  end

  desc "Unpair device in portal"
  task unpair: :environment do
  end

end

def project(name)
  run "cd ~/Developer/#{name}"
end

def mate
  run 'mate .'
end

def rails
  run 'killapps'
  %w{iChat iCal Twitter Linkinus Mail iTunes Safari}.each { |app| run "open -a #{app}" }
  mate
  run 'guard'
end
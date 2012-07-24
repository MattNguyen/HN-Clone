Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "08UJRZexf2nygriiiyMbsg", "a8rJCLbv0eQDhQLC3v4cw3DClsSnZ629g8mvxVje6s" 
  provider :facebook, "475978662413570", "d83939c56e07da72e35806b9b4a446bb"
end
class JsonWebToken
 class << self
   def encode(payload, exp = Time.now.to_i + 120)
     payload[:exp] = exp
     JWT.encode(payload, "NdRgUkXp2s5v8y/B?E(G+KbPeShVmYq3")
   end

   def decode(token)
     puts "--------------------------"
     body = JWT.decode(token, "NdRgUkXp2s5v8y/B?E(G+KbPeShVmYq3")[0]
     puts "--------------------------"
     puts body
   rescue
     nil
   end
 end
end

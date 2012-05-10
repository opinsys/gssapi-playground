require "bundler/setup"
require "sinatra"
require "base64"
require "gssapi"

host = "weblogin.opinsys.fi"
service  = "HTTP"
keytab = "/home/opinsys/weblogin.keytab"

$DEBUG = true # GSSAPI Debug

get '/' do
  puts "REQUEST"

  if not env["HTTP_AUTHORIZATION"].nil?
    puts "AUTH! parsing auth header"
    auth_data = Base64.strict_decode64 env["HTTP_AUTHORIZATION"].split()[1]

    puts "creating gssapi simple"
    srv = GSSAPI::Simple.new(host, service, keytab)

#    puts src.init_context ai

    puts "acquiring credentials"
    puts srv.acquire_credentials

    puts "accepting contex"
    # https://github.com/zenchild/gssapi/blob/master/lib/gssapi/simple.rb#L131
    otok = srv.accept_context auth_data
    puts "otok = #{otok.inspect}"
    if otok == true
      puts "context ok: #{ otok.class }"
      "ok: #{ srv.display_name }"
      headers "WWW-Authenticate" => "Negotiate #{Base64.strict_encode64(otok)}"
      status 200
    else
      puts "continue: #{Base64.strict_encode64(otok)}"
      headers "WWW-Authenticate" => "Negotiate #{Base64.strict_encode64(otok)}"
      status 401
      "GSS_S_CONTINUE_NEEDED"
    end
  else
    puts "NO AUTH!"
    headers "WWW-Authenticate" => "Negotiate"
    status 401
    "no auth :("
  end
end

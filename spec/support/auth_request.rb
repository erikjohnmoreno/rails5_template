[:get, :patch, :put, :post, :delete].each do |method|

  define_method "auth_#{method}" do |path, *args|
    # unless args[2].present?
    #   @user = User.find_or_initialize_by(email: 'sample@email.com')
    #   @user.full_name = 'foo bar'
    #   @user.password = 'password'
    #   @user.position_id = 1
    #   @user.approval_method_id = 1
    #   @user.phone_number = 88888888
    #   @user.save
    # else
    #   @user = args[2]
    # end
    #
    # params = args[0]
    # headers = args[1] || {}
    #
    # request_details = {browser: 'chrome',device: 'desktop',device_id: '0'}
    # auth_token = @user.set_access_token request_details
    #
    # headers.merge!(
    #     AccessToken: auth_token.token
    #   )

    send(method, path, params: params, headers: headers)
  end

end

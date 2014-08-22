define [
  'models/user'
], (User) ->

  describe 'User', ->
    beforeEach ->
      @user = new User
        'email': 'Username'
        'password': 'Password'

    it 'email should eq to "Username"', ->
      expect(@user.get('email')).toBe 'Username'

    it 'password should eq to "Password"', ->
      expect(@user.get('password')).toBe 'Password'

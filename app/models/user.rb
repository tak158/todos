# -*- coding: utf-8 -*-
require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :todos
  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      self.password = Digest::SHA1.hexdigest(self.password)
    else
      self.password = self.password_was
    end
  end

  def registered?
    # ここを考えて下さい。email/passwordで認証できれば
    # true を認証できなければ falseを戻します。
    # さらに、認証できた場合はインスタンスのidに認証された
    # ユーザーのidが入るようにします
    # emailの確認
    if e = User.where(email: self.email).first
      if e['password'] == Digest::SHA1.hexdigest(self.password)
        self.id = e['id']
      else
        return false
      end
    else
      return false
    end
  end
end


# そもそも呼び出しは？
# @user.registered?

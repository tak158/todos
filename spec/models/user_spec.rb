# -*- coding: utf-8 -*-
require "spec_helper" 

describe User do
  fixtures :users #fixtures 対象のフィクスチャを読み込むo

  describe "保存時に" do
    it "パスワードが与えられた場合は暗号化して格納する" do
      # ここを考えて下さい
      u = User.new(email: "you@drecom.com", password: "you")
      expect(u.encrypt_password).to be_false
    end

    it "パスワードが空文字列の場合はpasswordカラムは変更されない" do
      # ここを考えて下さい
      u = User.new(email: "you@drecom.com", password: "")
      expect(u.encrypt_password).to be_true
    end
  end

  describe "registered?メソッド" do
    it "正しくないemailに対してはfalseを戻す" do
      u = User.new(email: "yama-da@rails.com", password: "test1")
      expect(u.registered?).to be_false
    end

    it "正しくないpasswordに対してはfalseを戻す" do
      u = User.new(email: "yamada@rails.com", password: "test3")
      expect(u.registered?).to be_false
    end

    it "正しいemail/passwordに対してはtrueを戻す" do
      u = User.new(email: "yamada@rails.com", password: "test1")
      expect(u.registered?).to be_true
    end

    it "正しいemail/passwordで認証した時は認証者のidがセットされる" do
      u = User.new(email: "yamada@rails.com", password: "test1")
      u.registered?
      expect(u.id).to eq(users(:yamada).id)
    end
  end
end

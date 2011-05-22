class User < ActiveRecord::Base
  has_one :profile
  has_one :forum_comment
  has_one :lounge
  has_one :guild_rank
  has_one :user_skill

  # 仮想属性
  attr_accessor :password
  attr_accessor :password_confirmation
  attr_accessor :edit_password
  attr_accessor :edit_password_confirmation

  # バリデーション
  validates_presence_of :login_id, :message => 'が入力されていません。'  # 存在検証
  validates_presence_of :password, :message => 'が入力されていません。'  # 存在検証
  validates_uniqueness_of :login_id, :message => 'は既に登録されています。'  # 一意検証
  validates_confirmation_of :password, :message => 'が一致しません。'  # 再入力検証

  #----------#
  # validate #
  #----------#
  # データ検証
  def validate
    errors.add_to_base( "パスワードを設定して下さい。" ) if self.hashed_password.blank?
  end

  #-------------------#
  # password=( pass ) #
  #-------------------#
  # 書き込み用メソッド
  def password=( pass )
    @password = pass

    # ソルト生成
    self.salt = create_new_salt

    # 暗号化パスワード生成
    self.hashed_password = User.encrypted_password( self.password, self.salt )
  end

  #--------------#
  # authenticate #
  #--------------#
  # ユーザ認証メソッド(ログイン)
  def authenticate
    # ユーザ検索
    current_user = User.find_by_args( :login_id => self.login_id )

    unless current_user.blank?
      # ハッシュ化パスワード生成
      expected_password = User.encrypted_password( self.password, current_user.salt )

      # ハッシュ化パスワードとハッシュパスワードが一致しなければ
      unless expected_password == current_user.hashed_password
        # nilを返す
        return nil
      else
        # ユーザを返す
        current_user
      end
    end
  end

  #-----------------#
  # password_check? #
  #-----------------#
  # パスワードチェック
  def password_check?( check_password )
    # ハッシュ化パスワード生成
    expected_password = User.encrypted_password( check_password, self.salt )

    # ハッシュ化パスワードとハッシュパスワードが一致しなければ
    unless expected_password == self.hashed_password
      return false
    else
      return true
    end
  end

  private
  #-----------------#
  # create_new_salt #
  #-----------------#
  # ソルト生成
  def create_new_salt
    # オブジェクトIDと乱数よりソルトを生成
    self.object_id.to_s + rand.to_s
  end

  #-------------------------#
  # self.encrypted_password #
  #-------------------------#
  # ハッシュ化パスワード生成
  def self.encrypted_password( password, salt )
    # ハッシュ化パスワード生成元文字列を格納
    string_to_hash = password + "wibble" + salt # 'wibble'を付けて推測されにくくする

    # ハッシュ化パスワードを生成
    Digest::SHA1.hexdigest( string_to_hash )
  end
  
  #-------------------#
  # self.get_nickname #
  #-------------------#
  # ニックネーム取得
  def self.get_nickname( user_id )
    user = self.find( :first, :select => "login_id, nickname", :conditions => { :id => user_id } )
    unless user.blank?
      unless user.nickname.blank?
        return user.nickname
      else
        return user.login_id
      end
    else
      return ""
    end
  end
  
  #-----------------------#
  # self.get_twitter_page #
  #-----------------------#
  # Twitterページ取得
  def self.get_twitter_page( user_id )
    user = self.find_by_args( :id => user_id )

    unless user.blank?
      unless user.twitter_id.blank?
        return "<a href='https://twitter.com/#!/#{user.twitter_id}' target='_blank'>#{self.get_nickname( user.id )}</a>"
      else
        return self.get_nickname( user.id )
      end
    else
      return ""
    end
  end
  
  #--------------------#
  # self.level_master? #
  #--------------------#
  # マスターレベル判定
  def self.level_master?( user_id )
    user = self.find_by_args( :id => user_id )
    
    unless user.blank?
      if user.level == "master"
        return true
      else
        return false
      end
    else
      return false
    end
  end

  #-------------------#
  # self.find_by_args #
  #-------------------#
  # 動的ファインダ代替用メソッド
  def self.find_by_args( args )
    self.first( :conditions => args )
  end

  #-------------------------------#
  # self.find_by_args_and_include #
  #-------------------------------#
  def self.find_by_args_and_include( args, for_include )
    self.first( :conditions => args, :include => for_include )
  end

end
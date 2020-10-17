# モデルクラス名.create(:カラム名1 => 値1, :カラム名2 => 値2, ...)

User.create(:name => "日本太郎", :email => "tarou@example.com", :password => "password", :admin_flg => true) # 管理者
User.create(:name => "日本花子", :email => "hanako@example.com", :password => "password", :admin_flg => false)
User.create(:name => "群馬一郎", :email => "1rou@example.com", :password => "password", :admin_flg => false)
User.create(:name => "群馬由紀", :email => "yuki@example.com", :password => "password", :admin_flg => false)
User.create(:name => "東京大輔", :email => "daisuke@example.com", :password => "password", :admin_flg => false)
User.create(:name => "東京香奈", :email => "kana@example.com", :password => "password", :admin_flg => false)


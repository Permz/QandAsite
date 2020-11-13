# モデルクラス名.create(:カラム名1 => 値1, :カラム名2 => 値2, ...)

User.create(:name => "admin", :email => "admin@example.com", :password => "password", :admin_flg => true) # 管理者
User.create(:name => "日本花子", :email => "hanako@example.com", :password => "password", :admin_flg => false)
User.create(:name => "群馬一郎", :email => "1rou@example.com", :password => "password", :admin_flg => false)
User.create(:name => "群馬由紀", :email => "yuki@example.com", :password => "password", :admin_flg => false)
User.create(:name => "東京大輔", :email => "daisuke@example.com", :password => "password", :admin_flg => false)
User.create(:name => "東京香奈", :email => "kana@example.com", :password => "password", :admin_flg => false)

Category.create(:name => "特養")
Category.create(:name => "老健")
Category.create(:name => "訪問介護")
Category.create(:name => "デイ")
Category.create(:name => "サ高住")
Category.create(:name => "在宅介護")

News.create(:title => "【祝】CareYou開設！", :content => "CareYouが無事に開設されました！これからよろしくお願いいたします。", :user_id => "1")
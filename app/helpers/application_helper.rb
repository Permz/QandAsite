module ApplicationHelper
  def default_meta_tags
      {
        title: "介護情報共有サイト",
        description: "介護の目的は、高齢者の尊厳の保持と、有する能力に応じて自立した日常生活を支援することにあります。目の前の利用者は何ができて何に支援が必要なのか、自分で何ができるようになりたいのか、その望みの達成のために何をすべきか、という自立支援のための視点が大切です。",
        keywords: "介護,共有,Q&A",
        # favicon icon: image_url("favicon.ico")
        noindex: ! Rails.env.production?, # production環境以外はnoindex  
        charset: "UTF-8",
        # OGPの設定
        og: {
          title: "介護情報共有サイト",
          type: "website",
          url: request.original_url,
          # favicon image: image_url("OGPで設定する画像"),
          site_name: "CareYou",
          description: "介護情報共有サイト",
          locale: "ja_JP"
        } 
      }
  end
end

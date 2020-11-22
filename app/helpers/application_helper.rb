module ApplicationHelper
  def default_meta_tags
    {
      title: 'CareYou',
      description: '介護の目的は、高齢者の尊厳の保持と、有する能力に応じて自立した日常生活を支援することにあります。このサイトでは、介護に携わる方のために有意義な情報を発信しています。',
      keywords: '介護,共有,Q&A',
      icon: image_url('/favicon.ico'),
      noindex: !Rails.env.production?, # production環境以外はnoindex
      charset: 'UTF-8',
      # OGPの設定
      og: {
        title: '介護情報共有サイト',
        type: 'website',
        url: request.original_url,
        image: image_url('CareYou.png'),
        site_name: 'CareYou',
        description: '介護の目的は、高齢者の尊厳の保持と、有する能力に応じて自立した日常生活を支援することにあります。このサイトでは、介護に携わる方のために有意義な情報を発信しています。',
        locale: 'ja_JP'
      }
    }
  end
end

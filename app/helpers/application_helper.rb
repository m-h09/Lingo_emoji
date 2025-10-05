module ApplicationHelper
  def default_meta_tags
    {
      site: 'EMOJI関西弁変換',
      title: 'EMOJI関西弁変換',
      reverse: true,
      charset: 'utf-8',
      description: 'テキストを関西弁に変換し、絵文字を追加します。',
      canonical: request.original_url,
      separatir: '|',
      og: {
        site_name: 'EMOJI関西弁変換',
        title: 'EMOJI関西弁変換',
        description: 'テキストを関西弁に変換し、絵文字を追加します。',
        type: 'website',
        url: request.original_url,
        image: image_url('/ogp/EMOJI.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@https://x.com/rnteq_64_07',
        image: image_url('/ogp/EMOJI.png')
      }
    }
  end
end

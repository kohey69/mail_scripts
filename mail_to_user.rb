def get_chomp_from(template)
  template.scan(/\[(.*?)\]/).flatten
end

def create_mail(mail_template)
  if mail_template.nil?
    # テンプレートは[]の中に記載する
    print 'メールのテンプレートを入力してください: '
    mail_template = readlines.join
  end

  # 入力したテンプレートから[]で囲まれた文字列を抽出する
  matched_texts = get_chomp_from(mail_template)

  new_mail_body = mail_template

  matched_texts.each do |text|
    # 入力を求める
    print "#{text}を入力してください: "
    new_text = gets.chomp
    new_mail_body = new_mail_body.gsub("[#{text}]", new_text)
  end

  print new_mail_body
  print '以上の文章でよろしいですか？'
  if gets.chomp == 'y'
    create_mail(mail_template)
  end
end

create_mail(nil)

class ContactMailer < ActionMailer::Base

  def confirmation(contact, sent_at = Time.now)
    subject    'Kontakt über beleben.de'
    recipients contact.email
    from       'noreply@beleben.de'
    sent_on    sent_at
    
    body       :contact => contact
  end

  def message(contact, sent_at = Time.now)
    subject    'Kontakt über beleben.de'
    recipients "webmaster@#{SITE_URL}"
    from       contact.email
    sent_on    sent_at
                                 
    body       :contact => contact
  end

  def notify(post, sent_at = Time.now)
    subject    'Neuer Eintrag auf beleben.de'
    recipients "webmaster@#{SITE_URL}"
    from       post.email
    sent_on    sent_at

    body       :post => post
  end

end

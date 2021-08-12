module SEOHelper
  def page_title(title)
    content_for :page_title do
      "#{title} | #{current_store.name}"
    end
  end
  
  def meta_description(meta_description)
    content_for :meta_description do
      meta_description
    end
  end
end
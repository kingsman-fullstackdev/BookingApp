module TagFilter

  def link_to_tag(label, tag)
    "<a title=\"Show tag #{tag}\" href=\"#{shop_url}/collections/#{@context['handle']}/#{tag}\">#{label}</a>"
  end

  def highlight_active_tag(tag, css_class='active')
    if @context['current_tags'].include?(tag)
      "<span class=\"#{css_class}\">#{tag}</span>"
    else
      tag
    end
  end

  def link_to_add_tag(label, tag)
    tags = (@context['current_tags'] + [tag]).uniq
    show_tag(label, tag, tags)
  end

  def link_to_remove_tag(label, tag)
    tags = (@context['current_tags'] - [tag]).uniq
    show_tag(label, tag, tags)
  end

private
  def shop_url
    "#{ShopifyAPI::Shop.cached.url}/admin"
  end

  def show_tag(label, tag, tags)
    "<a title=\"Show tag #{tag}\" href=\"#{shop_url}/collections/#{@context['handle']}/#{tags.join("+")}\">#{label}</a>"
  end
end

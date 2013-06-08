module ApplicationHelper
  def sidebar_link(url, link)
    url == link ? "class=active" : ''
  end
end

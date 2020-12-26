module ApplicationHelper

# 视图标题方法 
  def full_title page_title=''
    base = "TaTsk Pad"
    if page_title.empty?
      base
    else
      page_title + "|" + base
    end
  end

end

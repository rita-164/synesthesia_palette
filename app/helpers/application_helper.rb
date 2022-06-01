module ApplicationHelper
    def page_title(page_title = '', admin = false)
        base_title = if admin
                       '共感覚パレット(管理画面)'
                     else
                       '共感覚パレット'
                     end
    
        page_title.empty? ? base_title : page_title + ' | ' + base_title
    end
end

module ApplicationHelper
  def title(*parts) 
    unless parts.empty?
      content_for :title do      
      (parts << "W3Geo.com").join(" - ")
      end
    end
  end
end

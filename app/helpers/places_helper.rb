module PlacesHelper
  def picture_for(place, size = :thumb)
    if !place.pictures.empty?
      p = place.pictures[0]
#      place.pictures.each do |p|
#        debugger
        thumbnail = p.public_filename(size)
        link_to(image_tag(thumbnail, :width => 160, :height => 120), p.public_filename, {:rel => "lightbox"})
#      end
    else
      image_tag("None.gif", :width => 160, :height => 120)
    end
  end
end

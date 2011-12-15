module ProjectsHelper
  def big_screenshot_for(project)
    if project.screenshot?
      image_tag project.screenshot.big.url
    end
  end
  def thumb_screenshot_for(project)
    if project.screenshot?
      image_tag project.screenshot.thumb.url
    end
  end
end

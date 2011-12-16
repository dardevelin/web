module ProjectsHelper
  def big_screenshot_for(project)
    if project.screenshot?
      link_to project.screenshot.url do
        image_tag project.screenshot.big.url
      end
    end
  end
  def thumb_screenshot_for(project)
    if project.screenshot?
      link_to project.screenshot.url do
        image_tag project.screenshot.thumb.url
      end
    end
  end
end

module ProjectsHelper
  def big_screenshot_for(project)
    if project.screenshot?
      link_to project.screenshot.url, title: project.quote, class: 'big' do
        image_tag project.screenshot.big.url
      end
    end
  end
  def thumb_screenshot_for(project)
    if project.screenshot?
      link_to project_url(project), title: project.quote do
        image_tag project.screenshot.thumb.url
      end
    end
  end
  def project_url(project)
    "#{projects_url(project.category)}##{project.to_param}"
  end
end

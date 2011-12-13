ActiveAdmin.register Post do
  index do
    column :title
    column :author
    column :created_at
    column :published do |post|
      if post.published?
        status_tag 'YES', :green
      else
        status_tag  'NO', :red
      end
    end
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :tagline
      f.input :body
    end
    f.inputs "Metadata" do
      f.input :picture
      f.input :author
      f.input :published
    end
    f.buttons
  end

  controller do
    def new
      @post = Post.new
      @post.author = current_user
      new!
    end
  end

end

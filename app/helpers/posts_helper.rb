module PostsHelper
    def tags_select
        Tag.pluck(:name)
    end

end

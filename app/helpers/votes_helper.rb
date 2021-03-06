module VotesHelper
  def vote_like_link(post)
    unless current_user
      return link_to_function('Like', "alert('You should log in before vote!')", :class => 'like-icon')
    end
    vote = post.vote current_user
    if vote
      if vote.like?
        link_to 'Like', '#', :class => 'like-icon active'
      else
        button_to 'Like', post_vote_path(post, vote), :method => :delete, :class => 'like-icon'
      end
    else
      button_to 'Like', post_votes_path(@post, :like => true), :class => 'like-icon'
    end
  end
  
  def vote_unlike_link(post)
    unless current_user
      return link_to_function('Unlike', "alert('You should log in before vote!')", :class => 'unlike-icon')
    end
    vote = post.vote current_user
    if vote
      if vote.like?
        button_to 'Unlike', post_vote_path(post, vote), :method => :delete, :class => 'unlike-icon'
      else
        link_to 'Unlike', '#', :class => 'unlike-icon active'
      end
    else
      button_to 'Unlike', post_votes_path(@post, :like => false), :class => 'unlike-icon'
    end
  end
end

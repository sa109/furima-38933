class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_form "comment_channels"
  end

  def unsubscribed
    
  end
end

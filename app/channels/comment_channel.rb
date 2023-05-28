class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_form "comment_channel"
  end

  def unsubscribed
    
  end
end

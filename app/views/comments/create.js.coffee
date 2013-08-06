($ '#commentslist').append("<%= j render(partial: 'comments/comment', locals: { comment: @comment }) %>")
($ '#comment<%=@comment.id%>').scrollTo();
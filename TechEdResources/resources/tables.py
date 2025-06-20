import django_tables2 as tables
from django.urls import reverse
from django.utils.html import format_html
from .models import Article

class ArticleTable(tables.Table):
    actions = tables.Column(empty_values=(), orderable=False)
    
    class Meta:
        model = Article
        template_name = "django_tables2/bootstrap4.html"
        fields = ("title", "subject", "article_type", "created_at")
        attrs = {"class": "table table-striped table-bordered"}
    
    def render_actions(self, value, record):
        if self.request.user.role in ['TUTOR', 'ADMIN']:
            edit_url = reverse('resources:edit_article', kwargs={'pk': record.id})
            return format_html(
                '<a href="{}" class="btn btn-sm btn-warning">Edit</a>',
                edit_url
            )
        return ""
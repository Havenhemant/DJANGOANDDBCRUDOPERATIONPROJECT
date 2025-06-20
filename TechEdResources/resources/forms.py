from django import forms
from .models import Article, Keyword


class ArticleForm(forms.ModelForm):
    keyword_input = forms.CharField(
        required=False,
        label='Keywords',
        help_text='Comma-separated list of keywords'
    )
    
    class Meta:
        model = Article
        fields = ['title', 'subject', 'article_type', 'content', 
                 'year', 'medium', 'dimensions', 'location',
                 'born', 'died', 'nationality', 'known_for',
                 'designed_by', 'developer']
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance.pk:
            
            self.fields['keyword_input'].initial = ', '.join(self.instance.get_keywords())
    
    def save(self, commit=True):
        article = super().save(commit=False)
        if commit:
            article.save()
       
            keywords = [k.strip() for k in self.cleaned_data['keyword_input'].split(',') if k.strip()]
            article.set_keywords(keywords)
        return article
from django.shortcuts import render

from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from django_tables2 import RequestConfig
from .models import *
from .tables import ArticleTable
from .filters import ArticleFilter
from .forms import ArticleForm

def student_required(user):
    return user.role in ['STUDENT', 'TUTOR', 'ADMIN']

def tutor_required(user):
    return user.role in ['TUTOR', 'ADMIN']

def admin_required(user):
    return user.role == 'ADMIN'

@login_required
def browse_articles(request):
    articles = Article.objects.all()
    
    
    subject_id = request.GET.get('subject')
    if subject_id:
        articles = articles.filter(subject__id=subject_id)
    
    keyword = request.GET.get('keyword')
    if keyword:
        articles = articles.filter(title__icontains=keyword)
    
    table = ArticleTable(articles)
    table.request = request  
    RequestConfig(request).configure(table)
    
    return render(request, 'resources/browse.html', {
        'table': table,
        'subjects': Subject.objects.all(),
    })
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from django_tables2 import RequestConfig
from .models import *
from .tables import ArticleTable
from .filters import ArticleFilter
from .forms import ArticleForm
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import Article
from .forms import ArticleForm



@login_required
@user_passes_test(lambda u: u.role in ['TUTOR', 'ADMIN'])
def add_article(request):
    if request.method == 'POST':
        form = ArticleForm(request.POST)
        if form.is_valid():
            article = form.save(commit=False)
            article.author = request.user
            article.save()
            form.save_m2m()  
            return redirect('resources:browse_articles')
    else:
        form = ArticleForm()
    
    return render(request, 'resources/add_article.html', {'form': form})

@login_required
@user_passes_test(lambda u: u.role in ['TUTOR', 'ADMIN'])
def edit_article(request, pk):
    article = get_object_or_404(Article, pk=pk)
    if request.method == 'POST':
        form = ArticleForm(request.POST, instance=article)
        if form.is_valid():
            form.save()
            return redirect('resources:browse_articles')
    else:
        form = ArticleForm(instance=article)
    
    return render(request, 'resources/edit_article.html', {
        'form': form,
        'article': article
    })

@login_required
@user_passes_test(lambda u: u.role == 'ADMIN')
def delete_article(request, pk):
    article = get_object_or_404(Article, pk=pk)
    
    if request.method == 'POST':
        article.delete()
        return redirect('resources:browse_articles')
    
    return render(request, 'resources/confirm_delete.html', {'article': article})
from django.urls import path
from . import views

app_name = 'resources'

urlpatterns = [
    path('', views.browse_articles, name='browse_articles'),
    path('add/', views.add_article, name='add_article'),
    path('edit/<int:pk>/', views.edit_article, name='edit_article'),
    path('delete/<int:pk>/', views.delete_article, name='delete_article'),
]
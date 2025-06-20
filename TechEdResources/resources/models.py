from django.db import models
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import MinLengthValidator

class CustomUser(AbstractUser):
    ROLES = (
        ('STUDENT', 'Student'),
        ('TUTOR', 'Tutor'),
        ('ADMIN', 'Administrator'),
    )
    role = models.CharField(max_length=7, choices=ROLES, default='STUDENT')
    bio = models.TextField(null=True, blank=True)
    
    def __str__(self):
        return f"{self.username} ({self.get_role_display()})"

class Subject(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    
    def __str__(self):
        return self.name

class Article(models.Model):
    ARTICLE_TYPES = (
        ('BIOGRAPHY', 'Biography'),
        ('CONCEPT', 'Concept'),
        ('EVENT', 'Event'),
        ('OBJECT', 'Object'),
    )
    
    title = models.CharField(max_length=200)
    content = models.TextField()
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    article_type = models.CharField(max_length=9, choices=ARTICLE_TYPES)
    author = models.ForeignKey(CustomUser, on_delete=models.SET_NULL, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    
    year = models.CharField(max_length=50, blank=True, null=True)
    medium = models.CharField(max_length=100, blank=True, null=True)
    dimensions = models.CharField(max_length=100, blank=True, null=True)
    location = models.CharField(max_length=200, blank=True, null=True)
    

    born = models.CharField(max_length=50, blank=True, null=True)
    died = models.CharField(max_length=50, blank=True, null=True)
    nationality = models.CharField(max_length=100, blank=True, null=True)
    known_for = models.CharField(max_length=200, blank=True, null=True)
    def get_keywords(self):
        """Returns a list of keyword strings for this article"""
        return [ak.keyword.keyword for ak in self.articlekeyword_set.all()]
    
    def set_keywords(self, keyword_strings):
        """Sets keywords from a list of strings"""
       
        self.articlekeyword_set.all().delete()
        
       
        for kw in keyword_strings:
            keyword, _ = Keyword.objects.get_or_create(keyword=kw.strip())
            ArticleKeyword.objects.create(article=self, keyword=keyword)
   
    designed_by = models.CharField(max_length=100, blank=True, null=True)
    developer = models.CharField(max_length=100, blank=True, null=True)
    
    def __str__(self):
        return self.title

class Keyword(models.Model):
    keyword = models.CharField(max_length=50, unique=True)
    
    def __str__(self):
        return self.keyword

class ArticleKeyword(models.Model):
    article = models.ForeignKey(Article, on_delete=models.CASCADE)
    keyword = models.ForeignKey(Keyword, on_delete=models.CASCADE)
    
    class Meta:
        unique_together = ('article', 'keyword')
    
    def __str__(self):
        return f"{self.article.title} - {self.keyword.keyword}"
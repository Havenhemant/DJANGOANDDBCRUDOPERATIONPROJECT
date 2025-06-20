from django.contrib import admin
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import *


class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name', 'role', 'is_staff')
    fieldsets = UserAdmin.fieldsets + (
        ('Additional Info', {'fields': ('role', 'bio')}),
    )

class ArticleKeywordInline(admin.TabularInline):
    model = ArticleKeyword
    extra = 1

class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'subject', 'article_type', 'author', 'created_at')
    list_filter = ('subject', 'article_type')
    search_fields = ('title', 'content')
    inlines = [ArticleKeywordInline]  

admin.site.register(CustomUser, CustomUserAdmin)
admin.site.register(Subject)
admin.site.register(Article, ArticleAdmin)
admin.site.register(Keyword)



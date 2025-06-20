import pandas as pd
from django.core.management.base import BaseCommand
from resources.models import *

class Command(BaseCommand):
    help = 'Imports sample data from Excel file'
    
    def handle(self, *args, **options):
     
        df = pd.read_excel('IT6037_Project_SampleData-1.xlsx', engine='openpyxl')
        
        
        subjects = {}
        for category in df['Category'].unique():
            subject, created = Subject.objects.get_or_create(
                name=category,
                defaults={'description': f"Resources about {category}"}
            )
            subjects[category] = subject
        
     
        admin_user, created = CustomUser.objects.get_or_create(
            username='admin',
            defaults={
                'email': 'admin@teched.edu',
                'role': 'ADMIN',
                'is_staff': True,
                'is_superuser': True
            }
        )
        if created:
            admin_user.set_password('admin123')
            admin_user.save()
        
        
        for _, row in df.iterrows():
            if pd.isna(row['Name']):
                continue
                
            article_data = {
                'title': row['Name'],
                'content': row['About'] if pd.notna(row['About']) else '',
                'subject': subjects[row['Category']],
                'author': admin_user,
            }
            
           
            if row['Type'] == 'Biography':
                article_data['article_type'] = 'BIOGRAPHY'
                article_data.update({
                    'born': row['Born'] if pd.notna(row['Born']) else '',
                    'died': row['Died'] if pd.notna(row['Died']) else '',
                    'nationality': row['Nationality'] if pd.notna(row['Nationality']) else '',
                    'known_for': row['Known For'] if pd.notna(row['Known For']) else '',
                })
            elif row['Type'] in ['Painting', 'Programming Language']:
                article_data['article_type'] = 'OBJECT'
                article_data.update({
                    'year': row['Year'] if pd.notna(row['Year']) else '',
                    'medium': row['Medium'] if pd.notna(row['Medium']) else '',
                    'dimensions': row['Dimensions'] if pd.notna(row['Dimensions']) else '',
                    'location': row['Location'] if pd.notna(row['Location']) else '',
                    'designed_by': row['Designed By'] if 'Designed By' in row and pd.notna(row['Designed By']) else '',
                    'developer': row['Developer'] if 'Developer' in row and pd.notna(row['Developer']) else '',
                })
            elif row['Type'] in ['Theorem', 'Algorithm']:
                article_data['article_type'] = 'CONCEPT'
            
            article, created = Article.objects.get_or_create(
                title=row['Name'],
                defaults=article_data
            )
            
           
            if pd.notna(row.get('Known For', '')):
                for kw in str(row['Known For']).split(','):
                    kw = kw.strip()
                    if kw:
                        keyword, _ = Keyword.objects.get_or_create(keyword=kw)
                        ArticleKeyword.objects.get_or_create(article=article, keyword=keyword)
            
            self.stdout.write(self.style.SUCCESS(f"Processed: {row['Name']}"))
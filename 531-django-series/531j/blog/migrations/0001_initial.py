# Generated by Django 3.1.1 on 2020-09-12 23:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('a', models.CharField(max_length=30)),
                ('body', models.TextField(max_length=5100)),
                ('title', models.CharField(max_length=130)),
                ('last_updated', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]

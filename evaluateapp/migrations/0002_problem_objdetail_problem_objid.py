# Generated by Django 4.1.3 on 2022-11-11 02:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('evaluateapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='problem',
            name='objdetail',
            field=models.CharField(default='', max_length=255),
        ),
        migrations.AddField(
            model_name='problem',
            name='objid',
            field=models.CharField(default='', max_length=10),
        ),
    ]
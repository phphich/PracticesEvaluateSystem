# Generated by Django 4.1.3 on 2022-11-11 08:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('evaluateapp', '0003_alter_problem_objid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='problem',
            name='objid',
            field=models.CharField(default='', max_length=10),
        ),
    ]

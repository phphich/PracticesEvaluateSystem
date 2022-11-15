"""PracticesEvaluateSystem URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from evaluateapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('subjectList', views.subjectList, name='subjectList'),
    path('subjectNew', views.subjectNew, name='subjectNew'),
    path('<subid>/subjectUpdate', views.subjectUpdate, name='subjectUpdate'),
    path('<subid>/subjectDelete', views.subjectDelete, name='subjectDelete'),
    path('studentList', views.studentList, name='studentList'),
    path('studentNew', views.studentNew, name='studentNew'),
    path('<stdid>/studentUpdate', views.studentUpdate, name='studentUpdate'),
    path('<stdid>/studentDelete', views.studentDelete, name='studentDelete'),
    path('problemList', views.problemList, name='problemList'),
    path('problemNew', views.problemNew, name='problemNew'),
    path('<id>/problemUpdate', views.problemUpdate, name='problemUpdate'),
    path('<id>/problemDelete', views.problemDelete, name='problemDelete'),

    path('practicesSelect', views.practiceSelect, name='practicesSelect'),
    path('practicesEvaluate', views.practicesEvaluate, name='practiceEvaluate'),
    path('checkResult', views.checkResult, name='checkResult'),
    path('userLogin', views.userLogin, name='userLogin'),
    path('userLogout', views.userLogout, name='userLogout'),
    path('fullView', views.fullView, name='fullView'),
    path('normalView', views.normalView, name='normalView'),
    path('clearSession', views.clearSession, name='clearSession')
]

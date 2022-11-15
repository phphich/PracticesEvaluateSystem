from django import forms
from .models import *

class SectionForm(forms.ModelForm):
    class Meta:
        LEVEL_CHOICES = (
            ("1", "1"),
            ("2", "2"),
            ("3", "3"),
            ("4", "4"),
        )
        GROUP_CHOICES = (
            ("N1", "N1"),
            ("N2", "N2"),
            ("R1", "R1"),
            ("R2", "R2"),
        )
        model = Section
        fields = ('level', 'group')
        widgets = {
            'level': forms.Select(choices=LEVEL_CHOICES, attrs={'class': 'form-control'}),
            'group': forms.Select(choices=GROUP_CHOICES, attrs={'class': 'form-control'}),
        }
        labels = {
            'level': 'ชั้นปีที่',
            'group': 'กลุ่มเรียน'
        }

class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ('stdid', 'name', 'section')
        widgets = {
            'stdid': forms.TextInput(attrs={'class': 'form-control', 'size': 55, 'maxlength': 13}),
            'name': forms.TextInput(attrs={'class': 'form-control',  'size':55, 'maxlength':50}),
            'section': forms.Select(attrs={'class':'form-control'})
        }
        labels = {
            'stdid': 'รหัสนักศึกษา',
            'name': 'ชื่อ - สกุล',
            'section': 'กลุ่มเรียน'
        }
    def updateForm(self):
        self.fields['stdid'].widget.attrs['readonly'] = True
        self.fields['stdid'].label = 'รหัสนักศึกษา [ไม่อนุญาตให้แก้ไขได้]'
    def deleteForm(self):
        self.fields['stdid'].widget.attrs['readonly'] = True
        self.fields['name'].widget.attrs['readonly'] = True
        self.fields['section'].widget.attrs['readonly'] = True

class SubjectForm(forms.ModelForm):
    class Meta:
        model = Subject
        fields = ('subid', 'name', 'credit')
        widgets = {
            'subid': forms.TextInput(attrs={'class': 'form-control',  'size':15, 'maxlength':13}),
            'name': forms.TextInput(attrs={'class': 'form-control', 'size':55, 'maxlength':50}),
            'credit': forms.NumberInput(attrs={'class': 'form-control', 'min':1}),
        }
        labels = {
            'subid': 'รหัสวิชา',
            'name': 'ชื่อวิชา',
            'credit': 'หน่วยกิต',
        }

    def updateForm(self):
        self.fields['subid'].widget.attrs['readonly'] = True
        self.fields['subid'].label = 'รหัสวิชา [ไม่อนุญาตให้แก้ไขได้]'
    def deleteForm(self):
        self.fields['subid'].widget.attrs['readonly'] = True
        self.fields['name'].widget.attrs['readonly'] = True
        self.fields['credit'].widget.attrs['readonly'] = True

class ProblemForm(forms.ModelForm):
    class Meta:
        model = Problem
        fields = ('subject', 'objid', 'objdetail', 'question', 'fullscore')
        widgets = {
            'subject': forms.Select(attrs={'class': 'form-control'}),
            'objid': forms.TextInput(attrs={'class':'form-control'}),
            'objdetail': forms.TextInput(attrs={'class':'form-control'}),
            'question': forms.Textarea(attrs={'class': 'form-control',  'cols':55, 'rows':10}),
            'fullscore':forms.NumberInput(attrs={'class': 'form-control',   'min': 0}),
        }

        labels = {
            'objid': 'จุดประสงค์การสอนที่ ',
            'objdetail':'ผลการเรียนรู้ที่คาดหวัง ',
            'subject': 'รายวิชา',
            'question': 'โจทย์/ปัญหา ',
            'fullscore': 'คะแนนเต็ม',
        }
    def updateForm(self):
        self.fields['objid'].widget.attrs['readonly'] = True
        self.fields['objid'].label = 'จุดประสงค์ที่ [ไม่อนุญาตให้แก้ไขได้]'
    def deleteForm(self):
        self.fields['objid'].widget.attrs['readonly'] = True
        self.fields['objdetail'].widget.attrs['readonly'] = True
        self.fields['question'].widget.attrs['readonly'] = True
        self.fields['fullscore'].widget.attrs['readonly'] = True


class ScoreForm(forms.ModelForm):
    class Meta:
        RESULT_CHOICES = (
            ("1", "ทำได้ถูกต้อง"),
            ("2", "ทำได้ไม่สมบูรณ์"),
            ("3", "ทำไม่ได้"),
        )
        model = Score
        fields = ('student', 'problem', 'result', 'score')
        widgets = {
            'subject': forms.Select(attrs={'class': 'form-control'}),
            'student': forms.Select(attrs={'class': 'form-control'}),
            'result': forms.RadioSelect(choices=RESULT_CHOICES,attrs={'class': 'form-control'}),
            'score':forms.HiddenInput(),
        }
        labels = {
            'question': 'คำสั่ง/ปัญหา',
            'student': 'นักศึกษา',
            'result': 'ผลลัพธ์',
            'score': 'คะแนนที่ได้'
        }

class UserAuthenForm(forms.Form):
    userName = forms.CharField(max_length=50, label="User Name", required=True, widget=forms.TextInput(attrs={'size': '25'}))
    userPass = forms.CharField(max_length=50, label="Password", required=True, widget=forms.PasswordInput(attrs={'size': '25'}))

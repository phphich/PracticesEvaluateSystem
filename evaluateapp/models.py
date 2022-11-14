from django.db import models
from django.db.models import F, Sum, Count

# Create your models here.
class Section(models.Model):
    level = models.CharField(max_length=15, default="")
    group = models.CharField(max_length=10, default="")
    def __str__(self):
        return self.level + self.group

class Student(models.Model):
    stdid = models.CharField(max_length=14, primary_key=True, default="")
    name = models.CharField(max_length=50, default="")
    section = models.ForeignKey(Section, on_delete=models.CASCADE)
    def __str__(self):
        return self.stdid + " : " + self.name + " (" + self.section.level + self.section.group + ") "
    def getCountScore(self):
        students = Student.objects.annotate(count_of_student=Count('score'))
    def getCountTest(self):
        count = Score.objects.filter(student=self).aggregate(count=Count('id'))
        return count['count']

class Subject(models.Model):
    subid = models.CharField(max_length=14, primary_key=True, default="")
    name = models.CharField(max_length=125, default="")
    credit = models.IntegerField(default=3)
    def __str__(self):
        return self.subid + " : " + self.name + " (" + str(self.credit) + " credit)"
    def getCountProblem(self):
        count = Problem.objects.filter(subject=self).aggregate(count=Count('id'))
        return count['count']

class Problem(models.Model):
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    objid = models.CharField(max_length=10, default="")
    objdetail = models.CharField(max_length=255, default="")
    question = models.TextField(default="")
    fullscore = models.FloatField(default=1.00)
    def __str__(self):
        return "[" + self.subject.subid + "] " + self.objid + " : " + self.question + " ("+ str(self.fullscore) + " score)"
    def getCountScore(self):
        count = Score.objects.filter(problem=self).aggregate(count=Count('id'))
        return count['count']

class Score(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='scores')
    problem = models.ForeignKey(Problem, on_delete=models.CASCADE, related_name='scorep')
    result = models.IntegerField(default=1)
    score = models.FloatField(default=0.00)
    def __str__(self):
        return self.student.name + " " + self.problem.subject.name + "  "  + \
               self.problem.question + "  " + str(self.result) + " ("+ str(self.score)  + ")"
    def calScore(self):
        if int(self.result) == 3:
            self.score = self.problem.fullscore
        elif int(self.result) == 2:
            self.score = self.problem.fullscore / 2
        else:
            self.score = 0.00


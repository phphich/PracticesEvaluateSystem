from django import template
from evaluateapp.models import *

register = template.Library()
@register.filter(name='getPracticeResult')
def getPracticeResult(stdid, pid):
    score = Score.objects.filter(student_id=stdid).filter(problem_id=pid).first()
    if score is None:
        return 0
    else:
        return score.result

@register.filter(name='getPracticeScore')
def getPracticeScore(stdid, pid):
    score = Score.objects.filter(student_id=stdid).filter(problem_id=pid).first()
    if score is None:
        return 0
    else:
        return score.score

@register.filter(name='getTotalScore')
def getTotalScore(problems):
    total = 0.00
    for problem in problems:
        total += problem.fullscore
    return total

@register.filter(name='getSumYourScore')
def getSumYourScore(scores):
    total = 0.00
    for score in scores:
        total += score.score
    return total

@register.filter(name='getSumYourScore1')
def getSumYourScore1(scores):
    total = 0.00
    for score in scores:
        if score.result == 1:
            total += score.score
    return total

@register.filter(name='getSumYourScore2')
def getSumYourScore2(scores):
    total = 0.00
    for score in scores:
        if score.result == 2:
            total += score.score
    return total

@register.filter(name='getSumYourScore3')
def getSumYourScore3(scores):
    total = 0.00
    for score in scores:
        if score.result == 3:
            total += score.score
    return total

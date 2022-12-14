from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from .models import *
from .forms import *
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

def home(request):
    request.session['viewMode'] = "normal"
    return render(request, 'home.html')

#-----------------Subject CRUD --------------------#
@login_required(login_url='userLogin')
def subjectList(request):
    subjects = Subject.objects.all()
    context = {'subjects': subjects}
    return render(request, 'subjectList.html', context)

@login_required(login_url='userLogin')
def subjectNew(request):
    if request.method == 'POST':
        form = SubjectForm(data=request.POST)
        if form.is_valid():
            form.save()
            return redirect('subjectList')
        else:
            context = {'form': form}
            return render(request, 'subjectNew.html', context)
    else:
        form = SubjectForm()
        context = {'form': form}
        return render(request, 'subjectNew.html', context)

@login_required(login_url='userLogin')
def subjectUpdate(request,subid):
    subject = get_object_or_404(Subject, subid=subid)
    form = SubjectForm(data=request.POST or None, instance=subject)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('subjectList')
        else:
            context = {'form': form}
            return render(request, 'subjectUpdate.html')
    else:
        form.updateForm()
        context = {'form': form}
        return render(request, 'subjectUpdate.html', context)

@login_required(login_url='userLogin')
def subjectDelete(request,subid):
    subject = get_object_or_404(Subject, subid=subid)
    form = SubjectForm(data=request.POST or None, instance=subject)
    if request.method == 'POST':
        subject.delete()
        return redirect('subjectList')
    else:
        form.deleteForm()
        context = {'form': form, 'subject': subject}
        return render(request, 'subjectDelete.html', context)
#-----------------Student CRUD --------------------#
@login_required(login_url='userLogin')
def studentList(request):
    if request.method == 'POST':
        sid = request.POST['sid']
    else:
        section = Section.objects.first()
        sid=section.id
    sectionSelected = get_object_or_404(Section, id=sid)
    sections = Section.objects.all()
    students = Student.objects.filter(section_id = sid)
    context = {'sections':sections,'sectionSelected':sectionSelected,  'students':students}
    return render(request, 'studentList.html', context)

@login_required(login_url='userLogin')
def studentNew(request):
    if request.method == 'POST':
        form = StudentForm(data=request.POST)
        if form.is_valid():
            form.save()
            return redirect('studentList')
        else:
            context = {'form': form}
            return render(request, 'studentNew.html', context)
    else:
        form = StudentForm()
        context = {'form': form}
        return render(request, 'studentNew.html', context)

@login_required(login_url='userLogin')
def studentUpdate(request, stdid):
    student = get_object_or_404(Student, stdid=stdid)
    form = StudentForm(data=request.POST or None, instance=student)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('studentList')
        else:
            context = {'form':form}
            return render(request, 'studentUpdate.html')
    else:
        form.updateForm()
        context = {'form':form}
        return render(request, 'studentUpdate.html', context)

@login_required(login_url='userLogin')
def studentDelete(request, stdid):
    student = get_object_or_404(Student, stdid=stdid)
    form = StudentForm(data=request.POST or None, instance=student)
    if request.method == 'POST':
        student.delete()
        return redirect('studentList')
    else:
        form.deleteForm()
        context = {'form':form, 'student':student}
        return render(request, 'studentDelete.html', context)

#-----------------Problem CRUD --------------------#
@login_required(login_url='userLogin')
def problemList(request):
    if request.method == 'POST':
        subid = request.POST['subid']
    else:
        subject = Subject.objects.first()
        subid=subject.subid
    print("subid: ", subid)
    subject = get_object_or_404(Subject, subid=subid)
    subjects = Subject.objects.all()
    problems = Problem.objects.filter(subject_id = subid).order_by('objid')
    context = {'subjects':subjects,'subjectSelected':subject,'problems':problems}
    return render(request, 'problemList.html', context)

@login_required(login_url='userLogin')
def problemNew(request):
    if request.method == 'POST':
        form = ProblemForm(data=request.POST)
        if form.is_valid():
            newForm = form.save(commit=False)
            subid = newForm.subject.subid
            objid = newForm.objid
            dup = Problem.objects.filter(subject_id = subid).filter(objid = objid).first()
            print("dup: ", dup)
            if dup is not None:
                messages.warning(request, "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????..")
                context = {'form': form}
                return render(request, 'problemNew.html', context)
            else:
                form.save()
                return redirect('problemList')
        else:
            context = {'form': form}
            return render(request, 'problemNew.html', context)
    else:
        form = ProblemForm()
        context = {'form': form}
        return render(request, 'problemNew.html', context)

@login_required(login_url='userLogin')
def problemUpdate(request, id):
    problem = get_object_or_404(Problem, id=id)
    form = ProblemForm(data=request.POST or None, instance=problem)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('problemList')
        else:
            context = {'form':form}
            return render(request, 'problemUpdate.html')
    else:
        form.updateForm()
        context = {'form':form}
        return render(request, 'problemUpdate.html', context)

@login_required(login_url='userLogin')
def problemDelete(request, id):
    problem = get_object_or_404(Problem, id=id)
    form = ProblemForm(data=request.POST or None, instance=problem)
    if request.method == 'POST':
        problem.delete()
        return redirect('problemList')
    else:
        form.deleteForm()
        context = {'form':form, 'problem':problem}
        return render(request, 'problemDelete.html', context)

@login_required(login_url='userLogin')
def practiceSelect(request):
    subjects = Subject.objects.all()
    sections = Section.objects.all()
    request.session['viewMode'] = "normal"
    if request.method == "POST":
        subid = request.POST['subid']
        sid=request.POST['sid']
        pid = request.POST['pid']
        problem = Problem.objects.filter(subject_id=subid).filter(id=pid).first()
        if problem is None: # ???????????????????????????????????????????????? (????????? pid ?????????????????????????????????????????????)
            subject = Subject.objects.get(subid=subid)
            section = Section.objects.get(id=sid)
            problems = Problem.objects.filter(subject_id=subject.subid).order_by('objid')
            problem = Problem.objects.filter(subject_id=subject.subid).first()
            context = {'subjects': subjects, 'subjectSelected': subject,
                       'sections': sections, 'sectionSelected': section,
                       'problems': problems, 'problemSelected':problem}
            return render(request, 'practicesSelect.html', context)
        else:
            request.session['subid'] = subid
            request.session['sid'] = sid #section id
            request.session['pid'] = pid
            return redirect('practiceEvaluate')
    else: #??????????????????????????????????????????
        if request.session.get('sid'): # ???????????? Back ??????????????????
            subid = request.session.get('subid')
            sid = request.session.get('sid')
            pid = request.session.get('pid')
            subject = Subject.objects.get(subid=subid)
            section = Section.objects.get(id=sid)
            problem = Problem.objects.get(id=pid)
            problems = Problem.objects.filter(subject_id=subid)
        else:
            subject = Subject.objects.first()
            section = Section.objects.first()
            problem = Problem.objects.filter(subject_id = subject.subid).first()
            problems = Problem.objects.filter(subject_id = subject.subid).order_by('objid')

        context = {'subjects': subjects, 'subjectSelected': subject,
                   'sections': sections, 'sectionSelected': section,
                   'problems': problems, 'problemSelected':problem}
        return render(request, 'practicesSelect.html', context)

@login_required(login_url='userLogin')
def practicesEvaluate(request):
    if request.method == "POST":
        subid =request.POST['subid']
        pid = request.POST['pid']
        stdid = request.POST['stdid']
        result = request.POST['result'+stdid]
        student = Student.objects.get(stdid=stdid)
        problem = Problem.objects.get(id=pid)
        subject = Subject.objects.get(subid=subid)
        score = Score.objects.filter(problem_id=pid, student_id=stdid).first()
        if score is None:
            score = Score()
        score.student = student
        score.problem = problem
        score.result = result
        score.calScore()
        score.save()
        messages.info(request, "???????????????????????????????????????????????????????????????????????????????????? "+ problem.objid
                      + "?????????: "+ student.name + " ???????????????????????????... ")
        sid = request.session.get('sid') #section id in the session
        section = Section.objects.filter(id=request.session.get('sid')).first()
        students = Student.objects.filter(section_id=request.session.get('sid'))
        scores = Score.objects.filter(problem_id=problem.id, student_id__in = students)
    else:
        subid = request.session.get('subid')
        sid = request.session.get('sid')
        pid = request.session.get('pid')
        subject = Subject.objects.get(subid=subid)
        section = Section.objects.get(id=sid)
        problem = Problem.objects.get(id=pid)
        students = Student.objects.filter(section_id=sid).order_by('stdid')
        scores = None

    context = {'subject': subject, 'section': section,
                'problem': problem, 'students': students,
                'scores':scores }
    return render(request, 'practicesEvaluate.html', context)

def inputCheckResult(request):
    if request.method=='POST':
        subid = request.POST['subid']
        stdid = request.POST['stdid']
        student = Student.objects.filter(stdid=stdid).first()
        # ???????????????????????????????????????????????????????????? Score ??????????????????????????????????????????????????????????????????
        # Department.objects.filter(departmentvolunteer__department__isnull=True)
        if student is None:
            messages.warning(request, "???????????????????????????????????????????????????????????? " + stdid + " ??????????????????: ")
            subjects = Subject.objects.all()
            context = {'subjects': subjects}
            return render(request, 'inputStudentID.html', context)
        else:
            request.session['subid'] = subid
            request.session['stdid'] = stdid  # section id
            return redirect('checkResult')
            # context = {'subject': subject, 'student': student, 'problems': problems, 'scores':scores}
            # return render(request, 'checkResult.html', context)
    else:
        subjects = Subject.objects.all()
        context= {'subjects':subjects}
        return render(request, 'inputStudentID.html', context)

def checkResult(request):
    subid = request.session.get('subid')
    stdid = request.session.get('stdid')
    subject = Subject.objects.get(subid=subid)
    problems = Problem.objects.filter(subject_id=subid).order_by('objid')
    student = Student.objects.filter(stdid=stdid).first()
    scores = Score.objects.filter(student_id=stdid, problem_id__in=problems).order_by('problem__objid')
    context = {'subject': subject, 'student': student, 'problems': problems, 'scores':scores}
    return render(request, 'checkResult.html', context)

def userLogin(request):
    if request.method == 'POST':
        form = UserAuthenForm(request.POST)
        if form.is_valid():
            userName = form.cleaned_data.get('userName')
            userPass = form.cleaned_data.get('userPass')
            user = authenticate(username=userName, password=userPass)
            if user is not None:
                login(request, user)
                request.session['userName'] = userName
                messages.success(request, "User logged in successfully...")
                return redirect('home')
            else:
                messages.error(request, "User Name or Password not correct..!!!")
                context = {'form': form}
                return render(request, 'userLogin.html', context)
    else:
        form = UserAuthenForm()
        context={'form':form}
        return render(request, 'userLogin.html', context)

def userLogout(request):
    logout(request)
    messages.info(request, "User logged out successfully... ")
    return redirect('home')

def fullView(request, url):
    request.session['viewMode'] = "full"
    return redirect(url)

def normalView(request, url):
    request.session['viewMode'] = "normal"
    return redirect(url)

def clearSession(request):
    if request.session.get('subid'):
        del request.session['subid']
    if request.session.get('sid'):
        del request.session['sid']
    if request.session.get('pid'):
        del request.session['pid']
    return redirect('home')


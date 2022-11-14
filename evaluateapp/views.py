from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from .models import *
from .forms import *
from django.contrib import messages
# Create your views here.
def home(request):
    request.session['viewMode'] = "normal"
    return render(request, 'home.html')

#-----------------Subject CRUD --------------------#
def subjectList(request):
    subjects = Subject.objects.all()
    context = {'subjects': subjects}
    return render(request, 'subjectList.html', context)

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
                messages.warning(request, "รายวิชานี้มีหมายเลขจุดประสงค์นี้อยู่แล้ว..")
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

def practiceSelect(request):
    subjects = Subject.objects.all()
    sections = Section.objects.all()
    request.session['viewMode'] = "normal"
    if request.method == "POST":
        subid = request.POST['subid']
        sid=request.POST['sid']
        pid = request.POST['pid']
        problem = Problem.objects.filter(subject_id=subid).filter(id=pid).first()
        if problem is None: # คลิ้กเปลี่ยนวิชา (ค่า pid เป็นของวิชาอื่น)
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
    else: #เข้ามาครั้งแรก
        if request.session.get('subid'): # กรณี Back กลับมา
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
        messages.info(request, "บันทึกผลการปฏิบัติจุดประสงค์ "+ problem.objid
                      + "ของ: "+ student.name + " เรียบร้อย... ")
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

def checkResult(request):
    if request.method=='POST':
        subid = request.POST['subid']
        stdid = request.POST['stdid']
        subject = Subject.objects.get(subid = subid)
        problems=Problem.objects.filter(subject_id = subid).order_by('objid')
        student = Student.objects.filter(stdid=stdid).first()
        scores = Score.objects.filter(student_id=stdid, problem_id__in=problems).order_by('problem__objid')

        # หาคะแนนของนักศึกษาใน Score ที่ปฏิบัติวิชาที่เลือก
        # Department.objects.filter(departmentvolunteer__department__isnull=True)
        if student is None:
            messages.warning(request, "ไม่พบรหัสนักศึกษาที่ " + stdid + " ในระบบ: ")
            subjects = Subject.objects.all()
            context = {'subjects': subjects}
            return render(request, 'inputStudentID.html', context)
        else:

            # context = {'subject':subject, 'student':student, 'scores':scores}
            context = {'subject': subject, 'student': student, 'problems': problems, 'scores':scores}
            return render(request, 'checkResult.html', context)
    else:
        subjects = Subject.objects.all()
        context= {'subjects':subjects}
        return render(request, 'inputStudentID.html', context)

def fullView(request): 
    request.session['viewMode'] = "full"
    return redirect('practiceEvaluate')

def normalView(request):
    request.session['viewMode'] = "normal"
    return redirect('practiceEvaluate')

def clearSession(request):
    if request.session.get('subid'):
        del request.session['subid']
    if request.session.get('sid'):
        del request.session['sid']
    if request.session.get('pid'):
        del request.session['pid']
    return redirect('home')


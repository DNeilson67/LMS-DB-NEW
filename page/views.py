from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden

from page.models import *
from classroom.models import *
from module.models import *
from page.forms import *
# Create your views here.

@login_required
def NewPageModule(request, course_id, module_id):
    user = request.user
    course = get_object_or_404(Course, id = course_id)
    module = get_object_or_404(Module, id = module_id)
    file_objs = []

    if user != course.user:
        return HttpResponseForbidden
    else:
        if request.method == 'POST':
            form = NewPageForm(request.POST, request.FILES)
            if form.is_valid():
                title = form.cleaned_data.get('title')
                content = form.cleaned_data.get('content')
                files = request.FILES.getlist('files')
                
                for file in files:
                    file_instance = PostFileContent(file=file, user=user)
                    file_instance.save()
                    file_objs.append(file_instance)
                
                p = Page.objects.create(title = title, content = content, user = user)
                p.files.set(file_objs)
                p.save()
                module.pages.add(p)
                return redirect('my-courses')
        else:
            form = NewPageForm()
    return render(request, 'page/newpage.html', {
        'form':form
    })

def PageDetail(request, course_id, module_id, page_id):
    page = get_object_or_404(Page, id = page_id)

    context = {
        'page':page
    }

    return render(request, 'page/page.html', context)

def MarkPageAsDone(request, course_id, page_id):
    page = get_object_or_404(Page)
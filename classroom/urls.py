from django.urls import path
from assignment.views import *
from classroom.views import *

from module.views import NewModule, CourseModule
from page.views import *
from question.views import *

urlpatterns = [
    path('newcourse/', NewCourse, name='newcourse'),
    path('MyCourses/', MyCourses, name='my-courses'),
    path('categories/', Categories, name='categories'),
    path('categories/<category_slug>', CategoryCourses, name='category-courses'),
    path('<course_id>/', CourseDetail, name='course'),
    path('<course_id>/enroll', Enroll, name='enroll'),
    path('<course_id>/edit', EditCourse, name='edit-course'),
    path('<course_id>/delete', DeleteCourse, name='delete-course'),
    #Modules
    path('<course_id>/modules', CourseModule, name='modules'),
    path('<course_id>/modules/newmodule', NewModule, name='new-module'),
    #Pages
    path('<course_id>/modules/<module_id>/pages/newpage', NewPageModule, name = 'new-page'),
    path('<course_id>/modules/<module_id>/pages/<page_id>', PageDetail, name = 'page-detail'),
    #Assignments
    path('<course_id>/modules/<module_id>/assignment/newassignment', NewAssignment, name = 'new-assignment'),
    path('<course_id>/modules/<module_id>/assignment/<assignment_id>', AssignmentDetail, name = 'assignment-detail'),
    path('<course_id>/modules/<module_id>/assignment/<assignment_id>/start',NewSubmission, name = 'start-assignment'),
    #Submissions
    path('<course_id>/submissions', Submissions, name = 'submissions'),
    path('<course_id>/studentsubmissions', StudentSubmissions, name = 'student-submissions'),
    path('<course_id>/submissions/<grade_id>/grade', GradeSubmissions, name = 'grade-submission'),
    #Questions
    path('<course_id>/questions', Questions, name='questions'),
    path('<course_id>/questions/newquestion', NewStudentQuestion, name='new-student-question'),
    path('<course_id>/questions/<question_id>', QuestionDetail, name='question-detail'),
    path('<course_id>/questions/<question_id>/vote', VoteAnswer, name='vote-answer'),
    path('<course_id>/questions/<question_id>/<answer_id>/markasanswer', MarkAsAnswer, name='mark-as-answer'),
]
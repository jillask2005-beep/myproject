
from django.urls import path,include
from .views import greetme,addition,sub,fact,reversed,prime,sumdigit,counts,set
from .views import *
urlpatterns = [
# path('welcommsg/',greetme),
# path('sum/',addition),
# path('sub/<int:a>/<int:b>/',sub),
# path("fact/<int:num>/",fact),
# path("reversed/<int:rev>/",reversed),
# path("prime/<int:number>/",prime),
# path("sumdigit/<int:numbers>/",sumdigit),
# path("counts/<int:numm>/",counts),
# path ("set/<str:name>/<int:age>/",set),
path("getstud/",StudentView.as_view()),
path("stud/<int:pk>/",StudentDetailView.as_view()),
    path("studentbulk/", StudentBulkView.as_view()),
    path("filt/",filterview.as_view()),
    path("department/", DepartmentView.as_view()),
    path("staff/", StaffView.as_view()),
    path("staffpost/",Staffpostview.as_view()),
    path('img/',ImageView.as_view()),
    path('imgd/<int:pk>/',ImageDeailsView.as_view()),
    path("signup/",Signup.as_view()),
    path("login/",LoginView.as_view())

]


#str
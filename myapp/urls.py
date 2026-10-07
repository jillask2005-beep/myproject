<<<<<<< HEAD
from django.urls import path
from .views import StudentView
from .views import EmployeeView
from .views import MovieView
from .views import productView
from .views import BookView
from .views import StudentdetailsView
from .views import EmployeeDetailView,BookDetailsView,MovieDetailsView,ProductDetailView,filterView
from .views import *


urlpatterns = [
    path("getstud/", StudentView.as_view()),
    path("getemp/",EmployeeView.as_view()),
    path("getmovie/",MovieView.as_view()),
    path("getprot/",productView.as_view()),
    path("getBook/",BookView.as_view()) ,
    path("getstudet/<int:pk>/",StudentdetailsView.as_view()),
    path("getempd/<int:pk>/",EmployeeDetailView.as_view()),
    path("getbooksd/<int:pk>/",BookDetailsView.as_view()),
    path('getmoviesd/<int:pk>/',MovieDetailsView.as_view()),
    path('getproductd/<int:pk>/',ProductDetailView.as_view()),
    path("getfilt/",filterView.as_view()),
    path('img/',Imageview.as_view()),
    path('imgd/<int:pk>/',ImageViewDeails.as_view()),
    path('sign/',Signup.as_view()),
    path('login/',LoginView.as_view())
    
]

=======

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
>>>>>>> f2856cda1cf955f6557ea43557ce31c8b23ba9f7

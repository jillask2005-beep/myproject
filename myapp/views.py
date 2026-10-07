from django.shortcuts import render
from django.http import HttpResponse
from .serializers import *
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from django.db.models import Sum, Count, Avg, Max, Min,IntegerField
# Create your views here.

from .models import *


def greetme(request):

    return HttpResponse("hello world")


def addition(request):
    a=10
    b=12
    sum=a+b
    return HttpResponse(sum)


def sub(request,a,b): #path params
    diff=a-b
    return HttpResponse(diff)

def fact(request,num):
    f=1

    for i in range(num,0,-1):
        f*=i

    return HttpResponse(f)


def reversed(request,rev):
    reverses=0
    while rev > 0:
        digit=rev%10
        reverses=reverses *10 +digit
        rev=rev//10
    return HttpResponse(reverses)

def prime(request,number):
    if number < 2:
        return HttpResponse("not prime")
    for i in range(2,number):
        if number % i==0:
         return HttpResponse("not prime")
    else:
        return HttpResponse("prime")
def sumdigit(request,numbers):
    total=0
    while numbers > 0:
        digit=numbers % 10
        total=total+digit
        numbers=numbers//10
    return HttpResponse(total)

def counts(request,numm):
    count=0
    while numm >0:
        numm=numm//10
        count=count +1
    return HttpResponse(count)

def set(request,name,age):
    return HttpResponse(f"hello {name}, your age is {age}"),

# def lagest(request,str1,str2,str3):
#     len1=len(str1)
#     len2=len(str2)
#     len=len(str3)
# if len1 >= len2 and len1 >= len3:
#     result=len1
# elif len2 >=len1 and len2 >=len3
#       result=len2
# else:
#     result=str3

# return 



#crud -get post(add) put/patch - update  delete

#get

from .models import Student

class StudentView(APIView):

        def get(self,request):

            studentlist=Student.objects.all()

            serializer=StudentSerializer(studentlist,many=True)
            return Response({
                    'data':serializer.data
            })

        def post(self,request):
            serializer=StudentSerializer(data=request.data)

            if serializer.is_valid():
                serializer.save()
                return Response({
                    'msg':'data added successfully',
                    'data':serializer.data
                }, status=status.HTTP_201_CREATED)

            return Response({
                'error':serializer.errors
            },status=status.HTTP_400_BAD_REQUEST)

        



class StudentDetailView(APIView):

    def get(self,request,pk):
        try:

          student=Student.objects.get(id=pk)

          

          serializer=StudentSerializer(student)

          return Response({
              'data':serializer.data
          },status=status.HTTP_200_OK)


        except Student.DoesNotExist:
            return Response({
                'error': 'Student not found'
            }, status=status.HTTP_404_NOT_FOUND)


    def delete(self, request, pk):
        try:
            student = Student.objects.get(id=pk)

            student.delete()

            return Response({
                'msg': "Successfully deleted"
            }, status=status.HTTP_200_OK)

        except Student.DoesNotExist:
            return Response({
                'error': 'Student not found'
            }, status=status.HTTP_404_NOT_FOUND)

    def put(self,request,pk):
        try:

          student=Student.objects.get(id=pk)


          serializer=StudentSerializer(student,data=request.data)

          if serializer.is_valid():
              serializer.save()


              return Response({
                    'data':serializer.data
                },status=status.HTTP_200_OK)
          
          return Response({
                             'error':serializer.errors
                          },status=status.HTTP_400_BAD_REQUEST)


        except Student.DoesNotExist:
            return Response({
                'error': 'Student not found'
            }, status=status.HTTP_404_NOT_FOUND)

    def patch(self,request,pk):
                try:
        
                  student=Student.objects.get(id=pk)
        
        
                  serializer=StudentSerializer(student,data=request.data,partial=True )
        
                  if serializer.is_valid():
                      serializer.save()
        
        
                      return Response({
                            'data':serializer.data
                        },status=status.HTTP_200_OK)
                  
                  return Response({
                                     'error':serializer.errors
                                  },status=status.HTTP_400_BAD_REQUEST)
        
        
                except Student.DoesNotExist:
                    return Response({
                        'error': 'Student not found'
                    }, status=status.HTTP_404_NOT_FOUND)
        



#restframework --installed apps (add it)
#serializer ==>
#views
#urls





class StudentBulkView(APIView):

    def post(self, request):

        serializer = StudentSerializer(
            data=request.data,
            many=True
        )

        if serializer.is_valid():
            serializer.save()

            return Response(
                {
                    "message": "Students added successfully",
                    "data": serializer.data
                },
                status=status.HTTP_201_CREATED
            )

        return Response(
            {
                "error": serializer.errors
            },
            status=status.HTTP_400_BAD_REQUEST
        )


from django.db.models import Q
from django.db.models import F, ExpressionWrapper, DecimalField

class filterview(APIView):

    def get(self,request):

                query_set=Student.objects.all()
        
                course=request.query_params.get("c")
                age=request.query_params.get("age")
                a=request.query_params.get("a")
                b=request.query_params.get("b")
                search=request.query_params.get("search")

                order=request.query_params.get('order')


                if search:
                     query_set=query_set.filter(
                          Q(course__icontains=search) |
                          Q(name__icontains=search)
                     )
           
                if course:
                    query_set=query_set.filter(course__icontains=course)
        
        
                


                if a and b:
                    query_set=query_set.filter(age__range=(a,b))


                if a and not b:
                        query_set=query_set.filter(age__gte=a)

                if b and not a:
                                        query_set=query_set.filter(age__lte=b)


                if order:
                     query_set=query_set.order_by(order)
                
              
                results=query_set.aggregate(
                     max_age=Max('age'),
                     min_age=Min('age'),
                      total_stud=Count('id'),
                       avg_age=Avg('age'),
                        sum_age=Sum('age')
                     
                )

                query_set = query_set.annotate(
                    age_afterten=ExpressionWrapper(
                        F("age") +10-1,
                        output_field=IntegerField()
                      
                    )
                )

                
                grpby = query_set.values("is_active").annotate(
                total_price=Count("id")
            )
                        
                serializer=StudentSerializer(query_set,many=True)
                
                           
                
                return Response({
                                    'data':serializer.data,
                                    'results':results,
                                    'coursebycount':grpby
                                   
                            })
        




# ?c=on&age=24





class DepartmentView(APIView):
    serializer_class=DepartmentSerializer

    def get(self, request):
        departments = Department.objects.all()

        serializer = DepartmentSerializer(
            departments,
            many=True
        )

        return Response({
            "data": serializer.data
        }, status=status.HTTP_200_OK)

    def post(self, request):
        serializer = DepartmentSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()

            return Response({
                "message": "Department added successfully",
                "data": serializer.data
            }, status=status.HTTP_201_CREATED)

        return Response({
            "error": serializer.errors
        }, status=status.HTTP_400_BAD_REQUEST)


class StaffView(APIView):
    serializer_class=StaffSerializer


    def get(self, request):
        staffs = Staffs.objects.all()

        serializer = StaffSerializer(
            staffs,
            many=True,
            context = {"request":request}
        )

        return Response({
            "data": serializer.data
        }, status=status.HTTP_200_OK)


class Staffpostview(APIView):
    serializer_class = StaffpostSerializer  
    def post(self, request):
        serializer = StaffpostSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()

            return Response({
                "message": "Staff added successfully",
                "data": serializer.data
            }, status=status.HTTP_201_CREATED)

        return Response({
            "error": serializer.errors
        }, status=status.HTTP_400_BAD_REQUEST)

class ImageView(APIView):
     serializer_class = Imageserailizer
     def get(self,request):
          images=Images.objects.all()
          serializer=Imageserailizer(images,many=True,context = {"request":request})
          return Response({
               'data':serializer.data
          },status=status.HTTP_201_CREATED)
     def post(self,request):
          serializer=Imageserailizer(data=request.data)
          if serializer.is_valid():
               serializer.save()
               return Response({
                    'data':serializer.data,
                    'data':"data added suss"
               },status=status.HTTP_200_OK)
          return Response({
               'error':serializer.errors
          },status=status.HTTP_400_BAD_REQUEST)

     
class ImageDeailsView(APIView):
     def get(self,request,pk):
          try:
               image=Images.objects.get(id=pk)
               serializer=Imageserailizer(image)
               return Response({
                    'data':serializer.data
               },status=status.HTTP_201_CREATED)
          except Images.DoesNotExist:
               return Response({
                    'error':'image not found'
               },status=status.HTTP_400_BAD_REQUEST)
     def patch(self,request,pk):
          try:
               image=Images.objects.get(id=pk)
               serializer=Imageserailizer(image,data=request.data,partial=True)
               if serializer.is_valid():
                    serializer.save()
                    return Response({
                         'data':serializer.data
                    },status=status.HTTP_200_OK)
         
               return Response({
                    'error':serializer.errors
               },status=status.HTTP_400_BAD_REQUEST)
          except Images.DoesNotExist:
               return Response({
                    'error':"image not found"
               })

     def put(self,request,pk):
          try:
               image=Images.objects.get(id=pk)
               serializer=Imageserailizer(image,data=request.data)
               if serializer.is_valid():
                    serializer.save()
                    return Response({
                         'data':serializer.data,
                         'data':'data added suss'
                    },status=status.HTTP_201_CREATED)
      
               return Response({
                    'error':serializer.errors
               },status=status.HTTP_400_BAD_REQUEST)
          except Images.DoesNotExist:
               return Response({
                    'error':'image not found'
               },status= status.HTTP_400_BAD_REQUEST)

     def delete(self,request,pk):
          try:
               image=Images.objects.get(id=pk)
               image.delete()
               return Response({
                    'mes':'delete sus'
               },status=status.HTTP_200_OK)
          except Images.DoesNotExist:
               return Response({
                    'error':'image not found'
               },status=status.HTTP_400_BAD_REQUEST)
from .serializers import SignupSerializer
class Signup(APIView):
     def post(self,request):
          serializer = SignupSerializer(data=request.data)
          if serializer.is_valid():
               serializer.save()
               return Response({"msg":"Account created","data":serializer.data})
          else:
               return Response({"error":serializer.errors})

from django.contrib.auth import authenticate
class LoginView(APIView):
     def post(self,request):
          username = request.data.get("username")
          password = request.data.get("password")

          user = authenticate(username=username,password=password)

          if user is not None:
               return Response({"msg":"Login successfull","user":{"id":user.id,"username":user.username}})
          else:
               return Response({"msg":"Invalid credentials"})



     
          

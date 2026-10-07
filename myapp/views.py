from django.shortcuts import render
from django.http import HttpResponse
<<<<<<< HEAD
from .serializers import Studentserializers
from rest_framework.response import Response 
from rest_framework.views import APIView
from .serializers import*
from rest_framework import status
from django.db.models import  Sum, Count, Avg, Max, Min
from django.db.models import F, ExpressionWrapper, IntegerField




# Create your views here.

def home (request):
    return HttpResponse("hello world") 

from .models import Student
class StudentView(APIView):
    # def get(self,request):
    #     studentList= Student.objects.all()
    #     serializer=Studentserializers(studentList,many=True)

    #     return Response({
    #         "data":serializer.data  
    #     })
    def post(self,request):
        serializer=Studentserializers(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
               "msg":"data added sucessfully",
               "data":serializer.data
            },status=status.HTTP_201_CREATED)
        return Response({
            "error":serializer.errors
        },status=status.HTTP_400_BAD_REQUEST)

    def get(self,request):
        students=Student.objects.all()
        city=request.query_params.get("city")
        age=request.query_params.get("age")


        if city:
            students=students.filter(city__exact=city)
        if age:
            students=students.filter(age__gte=20)

        result=students.aggregate(
            max_age=Max('age'),
            min_age=Min('age'),
            total_stud=Count('age'),
            avg_age=Avg('age'),
            sum_age=Sum('age')
        )
        students=students.annotate(
            age_afterten=ExpressionWrapper(
                F('age')+10-7,
                output_field=IntegerField()
            )
        )

        grpby=students.values('course').annotate(
            total_price=Count('id')
        )
        


        serializer=Studentserializers(students,many=True)
        return Response({
                'data':serializer.data,
                'result':result,
                'namebycount':grpby
            },status=status.HTTP_201_CREATED)


    
from .models import Employee,Movie,Product
class EmployeeView(APIView):
    # def get(self,request):
    #     employeeList=Employee.objects.all()
    #     serializer=Employeeserializers(employeeList,many=True)
    #     return Response({
    #       "data":serializer.data  
    #     })
    def post(self,request):
        serializer=Employeeserializers(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                "mes":"data added succussfully",
                'data':serializer.data
            },status=status.HTTP_201_CREATED)
        return Response({
            "error":serializer.errors
        },status=status.HTTP_400_BAD_REQUEST)
    def get(self,request):
        employee=Employee.objects.all()
        age=request.query_params.get("a")
        order=request.query_params.get('order')

        if age:
            employee=employee.filter(age__gte=20)

        if order:
            employee=employee.order_by(order)

        seralizer=Employeeserializers(employee,many=True)    

        results=employee.aggregate(
            max_age=Max('age'),
            min_age=Min('age'),
            total_age=Count('age'),
            avg_age=Avg('age'),
            sum_age=Sum('age')
        )
        employee = employee.annotate(
            age_ofteen=ExpressionWrapper(
            F("age") + 10 - 2,
            output_field=IntegerField()
                )
            )
        seralizer=Employeeserializers(employee,many=True)
        return Response({
            'data':seralizer.data,
            'res':results,
            'emp':seralizer.data
        })
    
    

    
class MovieView(APIView):
    def get(self,request):
        movielist=Movie.objects.all()
        serializer=Movieserializers(movielist,many=True)
        return Response({
            "data":serializer.data
        })
    def post(self,request):
        serializer=Movieserializers(data=request.data)
        if serializer.is_valid():
           serializer.save()
           return Response({
               "mes":"data added successful",
               "data":serializer.data
           },status=status.HTTP_201_CREATED)
        return Response({
            "error":serializer.errors
        },status=status.HTTP_400_BAD_REQUEST)
    def get(self, request):
        Movies = Movie.objects.all()

        name = request.query_params.get("n")

        if name:
            Movies = Movies.filter(Directer_name__icontains=name)

        serializer = Movieserializers(Movies, many=True)

        return Response({
            "data": serializer.data
        })
class productView(APIView):
    # def get(self,request):
    #     productlist=Product.objects.all()
    #     serializer=Productserializers(productlist,many=True)


    #     return Response({
    #         "data":serializer.data
    #     })
    def post(self,request):
        serializer=Productserializers(data=request.data)
        if serializer.is_valid:
            serializer.save()
            return Response({
                "mes":"data added succussfully",
                'data':serializer.data
            },status=status.HTTP_201_CREATED)
        return Response({"error":serializer.errors},status=status.HTTP_400_BAD_REQUEST)

    def get(self, request):

        product = Product.objects.all()

        name = request.query_params.get("name")
        price = request.query_params.get("price")

        if name:
            product = product.filter(name__icontains=name)
            product=product.filter(name__exact=name)
        if price:
            product = product.filter(price__gte=price)

            
            res=product.aggregate(
                max_price=Max('price'),
                min_price=Min('price'),
                avg_price=Avg('price'),
                total_price=Count('price'),
                sum_price=Sum('price')
            )
            product=product.annotate(
                price_afterten=ExpressionWrapper(
                    F('price')+8000-2000,
                    output_field=IntegerField()
                )
            )

        serializer = Productserializers(product, many=True)

        return Response({
            "data": serializer.data,
            'result':res,
        })
from .models import Book

class BookView(APIView):
    # def get(self,request):
    #     booklist=Book.objects.all()
    #     serializers=Bookserializers(booklist,many=True)
    #     return Response({
    #         "data":serializers.data
    #     })
    def post(self,request):
        serializer=Bookserializers(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'mes':"data added succussfully",
                'data':serializer.data
            },status=status.HTTP_201_CREATED)
        return Response({
            'error':serializer.data
        },status=status.HTTP_400_BAD_REQUEST)
    def get(self,request):
        Books=Book.objects.all()
        name=request.query_params.get('n')
        genre=request.query_params.get('g')

        if name:
            Books=Books.filter(Author_name__icontains=name)
        if genre:
           Books = Books.filter(genre__icontains=genre)

        result = Books.aggregate(
         max_published_year=Max('published_year'),
         min_published_year=Min('published_year'),
         total_published_year=Count('published_year'),
         avg_published_year=Avg('published_year'),
         sum_published_year=Sum('published_year')
         )
        Books=Books.annotate(
                published_year_afterten=ExpressionWrapper(
                    F('published_year')+10-1,
                    output_field=IntegerField()
                )
            )

        gryby=Books.values('Book_title').annotate(
            total_Author_name=Count('id')
        )


              
        
        seializer=Bookserializers(Books,many=True)
        return Response({
            'data':seializer.data,
            'result':result,
            'grupby':gryby
        })
   


from .models import Student,Employee,Book,Movie
class StudentdetailsView(APIView):
    def get(self,request,pk):
        try:
            student=Student.objects.get(id=pk)
            serializer=Studentserializers(student)
            return Response({
                "data":serializer.data
            },status=status.HTTP_200_OK)
        except Student.DoesNotExist:
            return Response({
                'error':'Student not found'
            },status=status.HTTP_400_BAD_REQUEST)

    def patch(self,request,pk):
        try:
            student= Student.objects.get(id=pk )
            serializer=Studentserializers(student,data=request.data,partial=True)
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
                'error':'student not found'
            },status=status.HTTP_400_BAD_REQUEST)

    def put(self,request,pk):
        try:
             student=Student.objects.get(id=pk)
             Serializer=Studentserializers(student,data=request.data)
             if Serializer.is_valid():
                        Serializer.save()
                        return Response({
                            'data':Serializer.data,
                            'data':'data added successfully '
                        },status=status.HTTP_200_OK)
             return Response({
                        'error':Serializer.errors
                    },status=status.HTTP_400_BAD_REQUEST)
        except Student.DoesNotExist:
            return Response({
                'error':'srudent not found'
            },status=status.HTTP_400_BAD_REQUEST)
       
    
    def delete(self,request,pk):
        try:
            student=Student.objects.get(id=pk)
            student.delete()
            return Response({
                'mes':'delete succussfully',

            },status=status.HTTP_200_OK)
        except Student.DoesNotExist:
            return Response({
                "error":"student not found"
            },status=status.HTTP_400_BAD_REQUEST)

class EmployeeDetailView(APIView):

    def get(self, request, pk):
        try:
            employee = Employee.objects.get(id=pk)

            serializer = Employeeserializers(employee)

            return Response({
                'data': serializer.data
            }, status=status.HTTP_200_OK)

        except Employee.DoesNotExist:
            return Response({
                'error': 'Employee not found'
            }, status=status.HTTP_404_NOT_FOUND)
    def patch(self,request,pk):
        try:
             employeee=Employee.objects.get(id=pk)
             serializer= Employeeserializers(employeee,data=request.data,partial=True)
             if serializer.is_valid():
                 serializer.save()
                 return Response({
                     'data':serializer.data,
                     'data':"data added successfully"
                 },status=status.HTTP_200_OK)
             return Response({
                 'error':serializer.errors
             },status=status.HTTP_400_BAD_REQUEST)
        except Employee.DoesNotExist:
            return Response({
                'error':"employee not found"
            },status=status.HTTP_400_BAD_REQUEST)
    def put(self,request,pk):
        try:
             Employeee=Employee.objects.get(id=pk)
             serializer=Employeeserializers(Employeee,data=request.data)
             if serializer.is_valid():
                        serializer.save()
                        return Response({
                            'data':serializer.data,
                            'data':'data added successfully'
                        },status=status.HTTP_200_OK)
             return Response({
                        'error':serializer.errors
                    },status=status.HTTP_400_BAD_REQUEST)
        except Employee.DoesNotExist:
            return Response({
                'error':'employee not found'
            },status=status.HTTP_400_BAD_REQUEST)
       
    
            
       
    def delete(self, request, pk):
        try:
            employee = Employee.objects.get(id=pk)

            employee.delete()

            return Response({
                'mes': 'Delete successful'
            }, status=status.HTTP_200_OK)

        except Employee.DoesNotExist:
            return Response({
                'error': 'Employee not found'
            }, status=status.HTTP_404_NOT_FOUND)



class BookDetailsView(APIView):
    def get(self,request,pk):
        try:
            Books=Book.objects.get(id=pk)
            serializer=Bookserializers(Books)
            return Response({
                'data':serializer.data
            },status=status.HTTP_200_OK)
        except Book.DoesNotExist:
            return Response({"error":'Book is not found'},status=status.HTTP_400_BAD_REQUEST)

    def patch(self,request,pk):
            try:
                Books=Book.objects.get(id=pk)
                serializer=Bookserializers(Books,data=request.data,partial=True)

                if serializer.is_valid():
                    serializer.save()
                    return Response({
                        'data':serializer.data
                    },status=status.HTTP_200_OK)
                return Response({
                                    'error':serializer.error
                                },status=status.HTTP_400_BAD_REQUEST)

            
            except Book.DoesNotExist:
                return Response({"error":'Book is not found'},status=status.HTTP_400_BAD_REQUEST)

        
    def delete(self,request,pk):
        try:
            books=Book.objects.get(id=pk)
            books.delete()
            return Response({'mes':'delete successful'},status=status.HTTP_200_BAD_REQUEST)
        except Book.DoesNotExist:
            return Response({'error':'Book not found'},status=status.HTTP_400_BAD_REQUEST)

class MovieDetailsView(APIView):
    def get(self,request,pk):
        try:
            Movies=Movie.objects.get(id=pk)
            serializer=Movieserializers(Movies)
            return Response({'data':serializer.data},status=status.HTTP_201_CREATED)
        except Movie.DoesNotExist:
            return Response({"movie not found"},status=status.HTTP_400_BAD_REQUEST)

    def patch(self,request,pk):
        try:
            moviese=Movie.objects.get(id=pk)
            serializer=Movieserializers(moviese,data=request.data,partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response({'data':serializer.data},status=status.HTTP_201_CREATED)
            return Response({
                'error':serializer.errors
            },status=status.HTTP_400_BAD_REQUEST)
        except Movie.DoesNotExist:
            return Response({
                'error':'book not found'
            },status=status.HTTP_400_BAD_REQUEST)

    def put(self,request,pk):
        try:
            Moviese=Movie.objects.get(id=pk)
            serializer=Movieserializers(Moviese,data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response({
                     "message": "Student updated successfully",
                     'data':serializer.data
                },status=status.HTTP_200_CONTINUE)
            return Response({
                'error':serializer.errors
            },status=status.HTTP_400_BAD_REQUEST)
        except Movie.DoesNotExist:
            return Response({
                'error':"movies not found"
            },status=status.HTTP_400_BAD_REQUEST)
             
    def delete(self,request,pk):
        try:
            Movies=Movie.objects.get(id=pk)
            Movies.delete()
            return Response({'mes':'delete succussfully'},status=status.HTTP_201_CREATED)
        except Movie.DoesNotExist:
            return Response({'error':'movie not found'},status=status.HTTP_400_BAD_REQUEST)


class ProductDetailView(APIView):

    def get(self, request, pk):
        try:
            products = Product.objects.get(id=pk)
            serializer = Productserializers(products)

            return Response(
                {'data': serializer.data},
                status=status.HTTP_200_OK
            )

        except Product.DoesNotExist:
            return Response(
                {'error': 'Product not found'},
                status=status.HTTP_404_NOT_FOUND
            )
    def patch(self,request,pk):
        try:
            productss=Product.objects.get(id=pk)
            serializer=Productserializers(productss,data=request.data,partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response({
                    'data':serializer.data
                },status=status.HTTP_201_CREATED)
            return Response({
                'error':serializer.errors
            },status=status.HTTP_400_BAD_REQUEST)
        except Product.DoesNotExist:
            return Response({
                'error':'product not found'
            },status=status.HTTP_400_BAD_REQUEST)
    def put(self,request,pk):
        try:
             products=Product.objects.get(id=pk)
             serializer=Productserializers(products,data=request.data)
             if serializer.is_valid():
                        serializer.save()
                        return Response({
                            'data':serializer.data,
                            'data ':'data added succefully'
                        },status=status.HTTP_201_CREATED)
             return Response({
                        'error':serializer.errors
                    },status=status.HTTP_400_BAD_REQUEST)
        except Product.DoesNotExist:
            return Response({
                'error':"product not found"
            },status=status.HTTP_400_BAD_REQUEST)  
        
       
    
            

    def delete(self, request, pk):
        try:
            products = Product.objects.get(id=pk)
            products.delete()

            return Response(
                {'mess': 'Deleted successfully'},
                status=status.HTTP_204_NO_CONTENT
            )

        except Product.DoesNotExist:
            return Response(
                {'error': 'Product not found'},
                status=status.HTTP_404_NOT_FOUND
            )
from django.db.models import Q

class filterView(APIView):

    def get(self, request):

        employee = Employee.objects.all()

        name = request.query_params.get("name")
        a = request.query_params.get("age")
        b = request.query_params.get("age")
        serach=request.query_params.get("serach")


        if name:
            employee = employee.filter(name__icontains=name)

        if a:
            employee = employee.filter(age__gte=a)

        if b:
            employee=employee.filter(age__lte=b)

        if a and b:
            employee=employee.filter(age__range=(a,b))
        if serach:
            employee=employee.filter(
                Q(name__icontains=serach)|
                Q(age__icointains=serach)
            )


        serializer = Employeeserializers(employee, many=True)

        return Response({
            "data": serializer.data
        })

class Imageview(APIView):
    serializer_class=imageseralizer
    def get(self,request):
        image=Images.objects.all()
        serializer=imageseralizer(image,many=True,context={'request':request})
        return Response({
            'data':serializer.data
        },status=status.HTTP_200_OK)
    def post(self,request):
        serializer=imageseralizer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'data':serializer.data,
                'data':'data added sus'
            },status=status.HTTP_200_OK)
        return Response({
            'error':serializer.errors,

        },status=status.HTTP_400_BAD_REQUEST)

class ImageViewDeails(APIView):
    def get(self,request,pk):
        try:
            image=Images.objects.get(id=pk)
            serializer=imageseralizer(image)
            return Response({
                'data':serializer.data
            },status=status.HTTP_200_OK)
        except Images.DoesNotExist:
            return Response({
                'error':serializer.errors,
                'data':'image not found'
            },status=status.HTTP_400_BAD_REQUEST)
    def patch(self,request,pk):
        try:
            image=Images.objects.get(id=pk) 
            seralizer=imageseralizer(image,data=request.data,partial=True)
            if seralizer.is_valid():
               seralizer.save()
               return Response(
            {
                'data':seralizer.data
            },status=status.HTTP_200_OK
        )
            return Response({
            'error':seralizer.errors
            },status=status.HTTP_400_BAD_REQUEST)
        except Images.DoesNotExist:
            return Response({
                'error':'image not found'
            },status=status.HTTP_400_BAD_REQUEST)

    def put(self,request,pk):
        try:
            image=Images.objects.get(id=pk)
            serializer=imageseralizer(image,data=request.data)
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
                'error':'image not found'
            },status=status.HTTP_400_BAD_REQUEST)

    def delete(self,request,pk):
        try:
            image=Images.objects.get(id=pk)
            image.delete()
            return Response({
                'data':'deleye sus'
            },status=status.HTTP_200_OK)
        except Images.DoesNotExist:
            return Response({
                'error':'image not found'
            },status=status.HTTP_400_BAD_REQUEST)

from .serializers import SignupSerializer  
class Signup(APIView):
    def post(self,request):
        serializer=SignupSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'mes':'Accound created','data':serializer.data
            },status=status.HTTP_201_CREATED)
        return Response({
            'error':serializer.errors
        },status=status.HTTP_400_BAD_REQUEST)

from django.contrib.auth import authenticate
class LoginView(APIView):
    def post(self, request):
        username = request.data.get("username")
        password = request.data.get("password")

        user = authenticate(
            username=username,
            password=password
        )

        if user is not None:
            return Response({
                'mes': "Login successful",
                'user': {
                    'id': user.id,
                    'username': user.username,
                    'email': user.email
                }
            })

        return Response({
            'mes': "Invalid username or password"
        })

    
    
    
=======
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



     
          
>>>>>>> f2856cda1cf955f6557ea43557ce31c8b23ba9f7

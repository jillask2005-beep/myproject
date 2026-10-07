from django.db import models

# Create your models here.

class Student(models.Model):
    course_choices=[
        ("JAVA",'Java'),
        ("PYTHON",'Python'),
        ('DART','Dart')
    ] #first db store, uservalues -->Java
    name=models.CharField(max_length=50)
    email=models.EmailField(unique=True)
    age=models.PositiveIntegerField(default=18)
    address=models.CharField(blank=True,null=True)
    is_active=models.BooleanField(default=True)
    course=models.CharField(choices=course_choices)
    doj=models.DateTimeField(auto_now_add=True)
    country=models.CharField(max_length=20,default='india',null=True,blank=True)


    def __str__(self):
        return f"{self.name} {self.age} {self.address}"


# class emp(models.Model):
#     course_choices=[
#         ("JAVA",'Java'),
#         ("PYTHON",'Python'),
#         ('DART','Dart')
#     ] #first db store, uservalues -->Java
#     name=models.CharField(max_length=50)
#     email=models.EmailField(unique=True)


class Emp(models.Model):
    name = models.CharField(max_length=100)
    age = models.IntegerField()

    def __str__(self):
        return self.name

class EmpProfile(models.Model):
    emp = models.OneToOneField(Emp, on_delete=models.CASCADE)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=15)

    def __str__(self):
        return self.emp.name



class Department(models.Model):
    title=models.CharField(max_length=30)
    branch=models.CharField(max_length=30)


class Staffs(models.Model):
    name=models.CharField(max_length=30)
    experience=models.PositiveIntegerField(default=0)
    department=models.ForeignKey(Department,on_delete=models.CASCADE)
    address = models.CharField(max_length=200, blank=True,null=True)
    phone = models.CharField(max_length=15,blank=True,null=True)
    image = models.ImageField(upload_to="staffs_image/", blank=True, null=True)

class Images(models.Model):
    image = models.ImageField(upload_to="images/",blank=True,null=True)
    description = models.CharField(max_length=100,blank=True,null=True)



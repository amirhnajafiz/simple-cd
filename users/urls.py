from django.urls import path, include

from . import views

app_name = 'users'

urlpatterns = [
	# add the first page show to users
	path('', include('django.contrib.auth.urls')),
	# Registration page
	path('register/', views.register, name='register'),
]
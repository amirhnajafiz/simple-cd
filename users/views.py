from django.shortcuts import render, redirect
from django.contrib.auth import login
from django.contrib.auth.forms import UserCreationForm

# Create your views here.


def register(request):
	# this function creates a new user for the web project
	if request.method != "POST":
		form = UserCreationForm()
	else:
		form = UserCreationForm(data=request.POST)	
		# now starting process
		if form.is_valid():
			new_user = form.save()
			login(request, new_user)
			return redirect('note_logs:index')
	# display an empty page or invalid form
	context = {'form': form}
	return render(request, 'registration/register.html', context)		
from django import forms

from .models import Notepad, Note


class NotepadForm(forms.ModelForm):
	# the base form class
	class Meta:
		# this will tell django to set the base in form of which class
		# and which fields to include in the form
		model = Notepad
		fields = ['text']
		labels = {'text': ''}


class NoteForm(forms.ModelForm):
	# also like the base class
	class Meta:
		model = Note
		fields = ['text']
		labels = {'text': 'Note:'}
		widgets = {'text': forms.Textarea(attrs={'cols': 80})}	
		# the above var is an HTML element which creates a field to get the data	
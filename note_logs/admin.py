from django.contrib import admin

from .models import Notepad, Note

# Register your models here.

admin.site.register(Notepad)
admin.site.register(Note)
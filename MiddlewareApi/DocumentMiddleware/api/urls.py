from django.urls import path
from .views import DocumentView, UserView, DocumentCategoryView

urlpatterns = [
    path('user/', UserView.as_view()),
    path('document/', DocumentView.as_view()),
    path('document-category/', DocumentCategoryView.as_view()),
]

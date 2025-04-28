"""
URL configuration for asset_library project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from django.urls import re_path
import os

swagger_url = os.getenv('DYNAMIC_BASE_URL', 'https://usd-asset-library.up.railway.app/')

schema_view = get_schema_view(
   openapi.Info(
      title="Papaya API",
      default_version='v1',
      description='API of 2025 CIS 7000 "Papaya" asset browser.',
      terms_of_service="https://www.google.com/policies/terms/",
      license=openapi.License(name="BSD License"),
   ),
   public=True,
   permission_classes=(permissions.AllowAny,),
   url=swagger_url
)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('library.urls')),  
    path('silk/', include('silk.urls', namespace='silk')),
    re_path(r'^playground/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    re_path(r'^docs/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc')
]

# Serve media files in development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
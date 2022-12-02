# QR Link

Proyecto de Tópicos Avanzados en Ingeniería de Software, UCUDAL 2022.

## Deployar

### Admin Panel
````
cd admin_panel
flutter build web --web-renderer canvaskit
cd ..
firebase deploy --only hosting:admin-panel
````
### Web app para el usuario final
````
flutter build web --web-renderer canvaskit
firebase deploy --only hosting:web
````


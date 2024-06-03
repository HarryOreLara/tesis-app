# tesis_app

Este proyecto es una recopilacion de informacion durante meses, se refactorizo muchas veces el codigo contal de lograr una buena funcionalidad, y aun falta refactorizar mas.

Este codigo es un proyecto de Tesis.

## Development
Este proyecto fue generado con [Flutter](https://flutter.dev) version `chanel 3.13.2` y Dart Version `3.1.0 estable`


## Instalaciones
- Visual Studio code 1.88
- Android studio 2022.2
- Modelo de dispositivo de desarrollo: Pixel 6 Pro `API 31` y en `Android 12`

## Entorno de desarrollo
`flutter doctor -v`
```
[√] Flutter (Channel master, 3.16.0-19.0.pre, on Microsoft Windows [Versi¢n 10.0.19045.4412], locale es-PE)
    • Flutter version 3.16.0-19.0.pre on channel master at C:\src\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision f05bb9a182 (7 months ago), 2023-10-28 22:27:00 +0200
    • Engine revision 84dcb4fb93
    • Dart version 3.3.0 (build 3.3.0-71.0.dev)
    • DevTools version 2.28.1

[√] Windows Version (Installed version of Windows is version 10 or higher)

[!] Android toolchain - develop for Android devices (Android SDK version 35.0.0-rc1)
    • Android SDK at C:\Android\SDK
    • Platform android-33, build-tools 35.0.0-rc1
    • Java binary at: C:\Program Files\Android\Android Studio\jbr\bin\java
    • Java version OpenJDK Runtime Environment (build 11.0.15+0-b2043.56-9505619)
    X Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/windows#android-setup for more details.

[√] Chrome - develop for the web
    • Chrome at C:\Program Files\Google\Chrome\Application\chrome.exe

[√] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.10.1)
    • Visual Studio at D:\Programas Ingenieria\Visual Studio\IDE_VisualStudio2019
    • Visual Studio Community 2022 version 17.10.34928.147
    • Windows 10 SDK version 10.0.22621.0

[√] Android Studio (version 2022.1)
    • Android Studio at C:\Program Files\Android\Android Studio
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.15+0-b2043.56-9505619)

[√] IntelliJ IDEA Community Edition (version 2023.2)
    • IntelliJ at C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2023.2.5
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart

[√] Connected device (4 available)
    • Android SDK built for x86 (mobile) • emulator-5554 • android-x86    • Android 10 (API 29) (emulator)
    • Windows (desktop)                  • windows       • windows-x64    • Microsoft Windows [Versi¢n 10.0.19045.4412]
    • Chrome (web)                       • chrome        • web-javascript • Google Chrome 125.0.6422.141
    • Edge (web)                         • edge          • web-javascript • Microsoft Edge 125.0.2535.79

[√] Network resources
    • All expected network resources are available.

! Doctor found issues in 1 category.

```




## Dependencias (Dependencies)

Nombre | Versión | Uso
------------ | ------------- | -------------
[animate_do](https://pub.dev/packages/animate_do) | 3.1.2 | Ejecutar animaciones de entrada o salida de la app.
[dio](https://pub.dev/packages/dio) | 5.4.0 | Peticiones HTTP.
[equatable](https://pub.dev/packages/equatable) | 2.0.5 | Comparar instancias.
[flutter_dotenv](https://pub.dev/packages/flutter_dotenv) | 5.1.0 | Permitir tener acceso a las variables de entorno del archivo `.env`
[flutter_riverpod](https://pub.dev/packages/flutter_riverpod) | 2.4.9 | Gestor de estado de la aplicación.
[formz](https://pub.dev/packages/formz) | 0.6.1 | Validador de formulario en el ingreso de datos en tiempo real.
[go_router](https://pub.dev/packages/go_router) | 13.0.1 | Enrutador de la aplicación.
[google_fonts](https://pub.dev/packages/google_fonts) | 6.1.0 | Fuente de letras.
[bloc](https://pub.dev/packages/bloc) | 8.1.2 | Gestor de estado.
[intl](https://pub.dev/packages/intl) | 0.19.0 | Funciones de internacionalización y localización, en donde incluye los formatos de fecha.




## Antes de correr el proyecto, ejecute los comandos

`flutter clean`, para limpiar archivos residuales que probablemente se hayan quedado.

Ejecutar `flutter pub get` para descargar las dependencias necesarias desde [PubDev](https://pub.dev/).

La aplicacion automaticamente recargara el archivo `pubspec.yaml` si esta en Visual Studio Code, en caso contrario, en Android Studio puede usar el gestor de dependencias o ejecutar el mismo comando `flutter pub get` en el apartado de comandos


El archivo `.env` no se cargara al repositorio, por ello esta el archivo `.env.template` el cual contiene la URL del backend, la cual se debe implementar antes de hace peticiones http. Solo cambie el nombre de `.env.template` a `.env` y todo estara funcionado correctamente.



## Ejecutar el build de producción 'APK' (Production)

Dentro de la carpeta `Key` se encuentra los dos archivos JKS y dentro del archivo `.env` estan sus respectivas llaves de acceso para poder firmar la aplicación en futuras versiones.

Tener en cuenta que para cada versión que se realize cambiar la versión dentro del archivo `pubspec.yaml` y la versión de codigo dentro de `android/app/build.gradle`

Comando | Uso
------------ | -------------
flutter build apk | Generara 3 archivos apk para diferente arquitectura móvil.
flutter build appbundle | Genera el archivo `aab` para poder hacer un despliegue a Play Store.
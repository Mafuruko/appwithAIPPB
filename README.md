# appwithai

`appwithai` adalah aplikasi Flutter untuk deteksi objek secara real-time menggunakan kamera perangkat dan model YOLO dalam format TensorFlow Lite.

## Identitas

- Nama: Muhammad Naufal Dzakwan
- NRP: 5025231234

## Fitur

- Deteksi objek langsung dari kamera.
- Tampilan bounding box dan hasil deteksi dari `ultralytics_yolo`.
- Daftar objek terdeteksi beserta confidence score.
- Tombol untuk menampilkan atau menyembunyikan hasil deteksi.
- UI sederhana dengan halaman pembuka dan halaman kamera.

## Teknologi

- Flutter
- Dart
- TensorFlow Lite model
- Ultralytics YOLO
- Package utama:
  - `ultralytics_yolo`
  - `camera`
  - `permission_handler`

## Struktur Penting

```text
lib/
  main.dart                 # Entry point, UI, dan halaman deteksi

assets/
  models/
    yolo11n.tflite          # Model YOLO yang dipakai aplikasi
    yolo11n_int8.tflite     # Model tambahan, belum dipakai di pubspec
    yolo26n_int8.tflite     # Model tambahan, belum dipakai di pubspec

android/
  app/src/main/AndroidManifest.xml
                            # Izin kamera Android
```

## Prasyarat

Pastikan sudah terpasang:

- Flutter SDK
- Dart SDK
- Android Studio atau Visual Studio Code
- Android SDK dan emulator/perangkat Android

Cek instalasi Flutter:

```bash
flutter doctor
```

## Instalasi

Clone atau buka project ini, lalu jalankan:

```bash
flutter pub get
```

## Menjalankan Aplikasi

Jalankan aplikasi ke emulator atau perangkat Android:

```bash
flutter run
```

Untuk build APK:

```bash
flutter build apk
```

Hasil APK release berada di:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Model AI

Aplikasi menggunakan model:

```text
assets/models/yolo11n.tflite
```

Model tersebut didaftarkan di `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/models/yolo11n.tflite
```

Jika ingin memakai model lain, ubah `modelPath` di `lib/main.dart` dan pastikan model tersebut juga didaftarkan di `pubspec.yaml`.

Contoh:

```dart
YOLOView(
  modelPath: 'assets/models/yolo11n.tflite',
  task: YOLOTask.detect,
)
```

## Izin Kamera

Android sudah memiliki izin kamera di `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
```

Saat aplikasi dijalankan, perangkat perlu memberikan akses kamera agar fitur deteksi bisa digunakan.

## Cara Kerja Aplikasi

1. Pengguna membuka halaman utama.
2. Pengguna menekan tombol `Start Detection`.
3. Aplikasi membuka kamera melalui `YOLOView`.
4. Model YOLO memproses frame kamera secara real-time.
5. Hasil deteksi ditampilkan sebagai jumlah objek dan daftar label objek.

## Konfigurasi Deteksi

Konfigurasi utama deteksi berada di `lib/main.dart`:

```dart
YOLOView(
  modelPath: 'assets/models/yolo11n.tflite',
  task: YOLOTask.detect,
  confidenceThreshold: 0.45,
  iouThreshold: 0.7,
  useGpu: false,
)
```

Keterangan:

- `confidenceThreshold`: batas minimum keyakinan hasil deteksi.
- `iouThreshold`: batas overlap untuk filtering hasil deteksi.
- `useGpu`: penggunaan GPU untuk inferensi, saat ini diset `false`.

## Testing

Jalankan test Flutter:

```bash
flutter test
```

## Catatan

- Aplikasi paling relevan dijalankan di perangkat fisik karena membutuhkan kamera.
- File model TFLite harus tersedia di folder `assets/models`.
- Jika model diganti, sesuaikan juga path asset di `pubspec.yaml`.

# Suitmedia Flutter Test App

A Flutter app for Suitmedia technical test, featuring:
- Palindrome checker
- Multi-screen navigation
- User list with API pagination (reqres.in)
- Custom UI with background and icon assets

## Features
- **First Screen**: Input Name & Palindrome, check palindrome, navigate to next screen
- **Second Screen**: Show name from first screen, select user from API
- **Third Screen**: List users from API, pagination with "Load Next Page" button
- **Custom UI**: Background image, rounded input, custom buttons, and icon

## Screenshots
_Add screenshots here if needed_

## Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/AtomNano/suitmedia_luthfinaldi.git
cd suitmedia_luthfinaldi
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Add assets
Pastikan file berikut ada di folder `assets/images/`:
- `background.png` (+@2x, @3x)
- `ic_photo.png` (+@2x, @3x)

### 4. Run the app
```bash
flutter run
```

## API
Menggunakan [reqres.in](https://reqres.in/api/users) untuk data user dengan parameter `page` dan `per_page`.

## Customization
- Ubah jumlah data per halaman di `lib/services/api_service.dart` (`per_page`)
- Ubah tampilan di folder `lib/screens/`

## License
MIT

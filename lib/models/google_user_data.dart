// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

class GoogleUserData {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String idToken;

  GoogleUserData({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.idToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'idToken': idToken,
    };
  }
}

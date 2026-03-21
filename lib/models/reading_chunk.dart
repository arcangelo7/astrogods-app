// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

class ReadingChunk {
  final String content;
  final String topic;
  final bool isComplete;
  final bool isSectionEnd;
  final bool isTopicChange;
  final bool isReconnecting;
  final int? readingId;
  final String? language;
  final String? error;
  final String? errorKey;
  final bool isSubscriptionRequired;

  const ReadingChunk({
    required this.content,
    required this.topic,
    required this.isComplete,
    this.isSectionEnd = false,
    this.isTopicChange = false,
    this.isReconnecting = false,
    this.readingId,
    this.language,
    this.error,
    this.errorKey,
    this.isSubscriptionRequired = false,
  });

  bool get hasError => error != null;
}

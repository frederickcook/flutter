// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(GlobalMaterialLocalizations, () {
    test('uses exact locale when exists', () {
      final GlobalMaterialLocalizations localizations = new GlobalMaterialLocalizations(const Locale('pt', 'PT'));
      expect(localizations.formatDecimal(10000), '10\u00A0000');
    });

    test('falls back to language code when exact locale is missing', () {
      final GlobalMaterialLocalizations localizations = new GlobalMaterialLocalizations(const Locale('pt', 'XX'));
      expect(localizations.formatDecimal(10000), '10.000');
    });

    test('falls back to default format when neither language code nor exact locale are available', () {
      final GlobalMaterialLocalizations localizations = new GlobalMaterialLocalizations(const Locale('xx', 'XX'));
      expect(localizations.formatDecimal(10000), '10,000');
    });

    group('formatHour', () {
      test('formats h', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('en', 'US'));
        expect(localizations.formatHour(const TimeOfDay(hour: 10, minute: 0)), '10');
        expect(localizations.formatHour(const TimeOfDay(hour: 20, minute: 0)), '8');

        localizations = new GlobalMaterialLocalizations(const Locale('ar', ''));
        expect(localizations.formatHour(const TimeOfDay(hour: 10, minute: 0)), '١٠');
        expect(localizations.formatHour(const TimeOfDay(hour: 20, minute: 0)), '٨');
      });

      test('formats HH', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('de', ''));
        expect(localizations.formatHour(const TimeOfDay(hour: 9, minute: 0)), '09');
        expect(localizations.formatHour(const TimeOfDay(hour: 20, minute: 0)), '20');

        localizations = new GlobalMaterialLocalizations(const Locale('en', 'GB'));
        expect(localizations.formatHour(const TimeOfDay(hour: 9, minute: 0)), '09');
        expect(localizations.formatHour(const TimeOfDay(hour: 20, minute: 0)), '20');
      });

      test('formats H', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('es', ''));
        expect(localizations.formatHour(const TimeOfDay(hour: 9, minute: 0)), '9');
        expect(localizations.formatHour(const TimeOfDay(hour: 20, minute: 0)), '20');

        localizations = new GlobalMaterialLocalizations(const Locale('fa', ''));
        expect(localizations.formatHour(const TimeOfDay(hour: 9, minute: 0)), '۹');
        expect(localizations.formatHour(const TimeOfDay(hour: 20, minute: 0)), '۲۰');
      });
    });

    group('formatMinute', () {
      test('formats English', () {
        final GlobalMaterialLocalizations localizations = new GlobalMaterialLocalizations(const Locale('en', 'US'));
        expect(localizations.formatMinute(const TimeOfDay(hour: 1, minute: 32)), '32');
      });

      test('formats Arabic', () {
        final GlobalMaterialLocalizations localizations = new GlobalMaterialLocalizations(const Locale('ar', ''));
        expect(localizations.formatMinute(const TimeOfDay(hour: 1, minute: 32)), '٣٢');
      });
    });

    group('formatTimeOfDay', () {
      test('formats ${TimeOfDayFormat.h_colon_mm_space_a}', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('ar', ''));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '٩:٣٢ ص');

        localizations = new GlobalMaterialLocalizations(const Locale('en', ''));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '9:32 AM');
      });

      test('formats ${TimeOfDayFormat.HH_colon_mm}', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('de', ''));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '09:32');

        localizations = new GlobalMaterialLocalizations(const Locale('en', 'ZA'));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '09:32');
      });

      test('formats ${TimeOfDayFormat.H_colon_mm}', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('es', ''));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '9:32');

        localizations = new GlobalMaterialLocalizations(const Locale('ja', ''));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '9:32');
      });

      test('formats ${TimeOfDayFormat.frenchCanadian}', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('fr', 'CA'));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '09 h 32');
      });

      test('formats ${TimeOfDayFormat.a_space_h_colon_mm}', () {
        GlobalMaterialLocalizations localizations;

        localizations = new GlobalMaterialLocalizations(const Locale('zh', ''));
        expect(localizations.formatTimeOfDay(const TimeOfDay(hour: 9, minute: 32)), '上午 9:32');
      });
    });
  });
}

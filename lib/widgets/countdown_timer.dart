import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'package:get_storage/get_storage.dart';

// Create a convenience constructor for your specific date
class CountdownTimer extends StatefulWidget {
  CountdownTimer({super.key})
      : targetDate = DateTime(2025, 4, 4, 18, 0); // 6:00 PM on March 28, 2025

  final DateTime targetDate;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  Duration _timeRemaining = Duration.zero;
  final _storage = GetStorage();
  late DateTime _effectiveTargetDate;

  static const String _targetDateKey = 'countdown_target_date';

  @override
  void initState() {
    super.initState();
    _initializeTargetDate();
    _calculateTimeRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _calculateTimeRemaining();
    });
  }

  void _initializeTargetDate() {
    // Try to get the saved target date from storage
    final savedTimestamp = _storage.read<int>(_targetDateKey);

    if (savedTimestamp != null) {
      // If we have a saved date, use it
      _effectiveTargetDate =
          DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
    } else {
      // Otherwise use the provided target date and save it
      _effectiveTargetDate = widget.targetDate;
      _storage.write(
          _targetDateKey, _effectiveTargetDate.millisecondsSinceEpoch);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateTimeRemaining() {
    final now = DateTime.now();
    if (_effectiveTargetDate.isAfter(now)) {
      setState(() {
        _timeRemaining = _effectiveTargetDate.difference(now);
      });
    } else {
      setState(() {
        _timeRemaining = Duration.zero;
      });
      _timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.accentColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Token Launch',
            style: AppTextStyles.subheading,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeBox(
                  _timeRemaining.inDays.toString().padLeft(2, '0'), 'Days'),
              const SizedBox(width: 10),
              _buildTimeBox(_getHours().padLeft(2, '0'), 'Hours'),
              const SizedBox(width: 10),
              _buildTimeBox(_getMinutes().padLeft(2, '0'), 'Minutes'),
              const SizedBox(width: 10),
              _buildTimeBox(_getSeconds().padLeft(2, '0'), 'Seconds'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.subtitleColor,
            ),
          ),
        ],
      ),
    );
  }

  String _getHours() {
    return (_timeRemaining.inHours % 24).toString();
  }

  String _getMinutes() {
    return (_timeRemaining.inMinutes % 60).toString();
  }

  String _getSeconds() {
    return (_timeRemaining.inSeconds % 60).toString();
  }
}

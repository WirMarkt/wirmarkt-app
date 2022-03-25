import 'package:flutter/material.dart';

enum LogicalWidth {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

extension MediaQueryLogicalWidth on MediaQueryData {
  LogicalWidth get logicalWidth {
    var logicalToMaxWidth = const {
      LogicalWidth.xs: 576,
      LogicalWidth.sm: 768,
      LogicalWidth.md: 992,
      LogicalWidth.lg: 1200,
      LogicalWidth.xl: 1400,
    };
    for (var entry in logicalToMaxWidth.entries) {
      if (size.width < entry.value) return entry.key;
    }
    return LogicalWidth.xxl;
  }
}

extension EnumComparisonOperators on Enum {
  bool operator <(Enum other) {
    return index < other.index;
  }

  bool operator <=(Enum other) {
    return index <= other.index;
  }

  bool operator >(Enum other) {
    return index > other.index;
  }

  bool operator >=(Enum other) {
    return index >= other.index;
  }
}

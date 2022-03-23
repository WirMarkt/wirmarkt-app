import 'package:flutter/material.dart';

enum LogicalWidth {
  xs, //(for phones - screens less than 768px wide)
  sm, //(for tablets - screens equal to or greater than 768px wide)
  md, //(for small laptops - screens equal to or greater than 992px wide)
  lg, //(for laptops and desktops - screens equal to or greater than 1200px wide)
}

extension MediaQueryLogicalWidth on MediaQueryData {
  LogicalWidth get logicalWidth {
    if (size.width < 768) {
      return LogicalWidth.xs;
    } else if (size.width < 992) {
      return LogicalWidth.sm;
    } else if (size.width < 1200) {
      return LogicalWidth.md;
    } else {
      return LogicalWidth.lg;
    }
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
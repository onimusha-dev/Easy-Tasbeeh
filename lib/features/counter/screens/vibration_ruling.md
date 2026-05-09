# Vibration & Haptic Feedback Ruling

This document outlines the standardized haptic feedback strengths and logic used in the Easy Tasbeeh application to ensure a premium and consistent user experience.

## Feedback Strengths

| Event | Haptic Type | Vibration Duration | Description |
| :--- | :--- | :--- | :--- |
| **Standard Tap** | `selectionClick` | 10ms | Very weak, minimal feedback for high-speed tapping. |
| **Combo Set Finished** | `lightImpact` | 30ms | Subtle but distinct; slightly stronger than a standard tap. |
| **Milestone** | `mediumImpact` | 30ms | Solid pulse for intermediate progress (interval defined by user). |
| **Target Reached** | `mediumImpact` / `heavyImpact` | 70ms / Pattern | "Nice middle" feel; clear confirmation of session completion. |

## Conditional Logic

### 1. Mode-Based Restrictions
*   **Single Mode**: Milestone vibrations are active based on the user's selected milestone interval (33, 100, etc.).
*   **Combo Mode**: Milestone vibrations are **disabled** to avoid interference with segment-completion haptics. Only the end of a specific dhikr segment triggers haptics.

### 2. Goal Haptic Patterns
*   If **Goal Haptic Pattern** is enabled in settings:
    *   Uses a multi-pulse pattern: `[0, 100, 50, 100, 50, 400]`.
    *   Uses `heavyImpact` for the pulses to provide a premium "success" feel.
*   If disabled:
    *   Uses a solid **70ms** vibration with `mediumImpact`.

### 3. Finish Freeze (Safety)
To ensure the completion feedback is fully felt and to prevent accidental double-taps, a precise freeze is applied immediately after the target is reached:
*   **Pattern Mode**: 850ms freeze (Vibration 800ms + 50ms buffer).
*   **Solid Mode**: 120ms freeze (Vibration 70ms + 50ms buffer).
During this time, the counter button is completely disabled—**no tap vibration, no milestone haptics, and no count increase**—ensuring the completion feedback is the only thing felt.

## Implementation Details

*   **Location**: Logic is primarily handled in `_incrementCounter` within `counter_screen.dart`.
*   **Utility**: `_safeVibrate` helper method is used to combine Flutter's `HapticFeedback` with the `vibration` package for maximum compatibility and control.

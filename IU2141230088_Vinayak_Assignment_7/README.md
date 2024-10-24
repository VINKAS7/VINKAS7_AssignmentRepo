# Fitness Club Rewards Smart Contract

## Overview

This contract manages a simple rewards program for fitness club members. Members earn points for activities and can redeem them for rewards.

### Key Functions

1. **grantMembership(address member)**: Allows the club owner to grant membership to users.
2. **earnPoints(uint points)**: Allows members to earn points.
3. **redeemPoints(uint points)**: Allows members to redeem points, provided they have enough.

### Events

- `MembershipGranted`: Triggered when a new member is granted membership.
- `PointsEarned`: Triggered when points are earned.
- `PointsRedeemed`: Triggered when points are redeemed.